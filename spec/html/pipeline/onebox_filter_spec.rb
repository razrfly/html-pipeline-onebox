require "spec_helper"

RSpec.describe HTML::Pipeline::OneboxFilter do
  subject { HTML::Pipeline::OneboxFilter }

  let(:html_link) { %(<a href="https://www.youtube.com/watch?v=qediav063xQ">video</a>) }
  let(:markdown_link) { %([video](https://www.youtube.com/watch?v=qediav063xQ)) }
  let(:link) { %(https://www.youtube.com/watch?v=qediav063xQ) }
  let(:link_without_preview) { %(https://ruby-doc.org/) }

  it "has a version number" do
    expect(HTML::Pipeline::Onebox::VERSION).not_to be nil
  end

  it "doesn't affect links in markdown" do
    expect(subject.to_html(markdown_link)).to eq(markdown_link)
  end

  it "doesn't affect links in HTML tag" do
    expect(subject.to_html(html_link)).to eq(html_link)
  end

  it "doesn't affect links without leading whitespace" do
    new_link = "TEXT" + link
    expect(subject.to_html(new_link)).to eq(new_link)
  end

  it "does affect links at start of line" do
    expect(subject.to_html(link)).to eq(
      %(<iframe width="480" height="360" src="https://www.youtube.com/embed/qediav063xQ?feature=oembed&amp;wmode=opaque" frameborder="0" allowfullscreen="">\n            </iframe>)
    )
  end

  it "does affect links with leading whitespace" do
    link_with_whitespace = " " + link
    expect(subject.to_html(link_with_whitespace)).to eq(
      %( <iframe width="480" height="360" src="https://www.youtube.com/embed/qediav063xQ?feature=oembed&amp;wmode=opaque" frameborder="0" allowfullscreen="">\n            </iframe>)
    )
  end

  it "does affect links with leading new line" do
    link_with_whitespace = "\n" + link
    expect(subject.to_html(link_with_whitespace)).to eq(
      %(\n<iframe width="480" height="360" src="https://www.youtube.com/embed/qediav063xQ?feature=oembed&amp;wmode=opaque" frameborder="0" allowfullscreen="">\n            </iframe>)
    )
  end

  it "doesn't affect links without preview" do
    expect(subject.to_html(link_without_preview)).to eq(link_without_preview)
  end
end
