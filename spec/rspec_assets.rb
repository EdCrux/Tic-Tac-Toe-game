require_relative "../lib/assets.rb"

describe Assets do
    let(:let_array) {Array('A'...'O') << Array('P'...'X') << 'Y'}
    let(:logo) {Assets.getlogo}
    let(:screen_clear) {Assets.clear}
    let(:color) {Assets.color}
    let(:random_value) {let_array[rand(let_array.length-1)]}
    let(:width) {3}
    let(:sign) {"-"}

    describe '#getlogo' do
        it "returns string array with logo" do
            expect(logo).not_to be_empty
        end

        it "returns more then one line" do 
            expect(logo.length).to be > 0
        end

        it "return value different then nil" do
            expect(logo).not_to be nil
        end
    end

    describe '#clear' do
        it "the screen" do
            expect(screen_clear).not_to be nil
        end

        it "returns true" do
            expect(screen_clear).to be_truthy
        end
    end

    describe '#color' do
        it "return a symbol as a color" do
            expect(Assets.color("X")).to be_kind_of(Symbol)
        end

        it "return blue if X is the argument" do
            expect(Assets.color("X")).to eql(:blue)
        end

        it "return green if O is the argument" do
            expect(Assets.color("O")).to eql(:green)
        end

        it "return white as a default" do
            expect(Assets.color(random_value)).to eql(:white)
        end

        it "return white default" do
            expect(Assets.color(random_value)).not_to eql(:blue) && eql(:green)
        end
    end

    describe '#line' do
        it "returns error if no arguments" do
            expect(lambda{Assets.line}).to raise_error(ArgumentError)
        end

        it "return a string with specific width" do
            expect(Assets.line(width,sign)).to eql("---")
        end
    end
end