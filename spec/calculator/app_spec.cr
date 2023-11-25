require "../spec_helper"

describe Calculator::App do
  context "adding numbers" do
    it { Calculator::App.new(1, 2).add.should eq(3) }
    it { Calculator::App.new(-1, 2).add.should eq(1) }
  end

  context "subtracting numbers" do
    it { Calculator::App.new(1, 2).subtract.should eq(-1) }
  end

  context ".run" do
    it "adds numbers when operator is +" do
      Calculator::App.run(1, 2, "+").should eq(3)
    end

    it "subtracts numbers when operator is -" do
      Calculator::App.run(1, 2, "-").should eq(-1)
    end

    it "multiplies numbers when operator is *" do
      Calculator::App.run(1, 2, "*").should eq(2)
    end

    it "divides numbers when operator is /" do
      Calculator::App.run(1, 2, "/").should eq(0.5)
    end

    it "raises error when operator is not supported" do
      expect_raises(Calculator::InvalidOperatorException) { Calculator::App.run(1, 2, "x") }
    end
  end
end
