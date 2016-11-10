defmodule CodeCorps.StripeCustomerPolicyTest do
  use CodeCorps.PolicyCase

  import CodeCorps.StripeCustomer
  import CodeCorps.StripeCustomerPolicy, only: [index?: 2, show?: 2]

  alias CodeCorps.StripeCustomer

  describe "index?" do
    test "returns true when user is an admin" do

    end

    test "returns false when user is an admin or owner of an organization " do

    end

    test "returns false when user id is not the StripeCustomer id" do

    end
  end

  describe "show?" do
    test "returns true when user is viewing their own information" do

    end

    test "returns false when user is an admin" do

    end

    test "returns false when user is admin of organization" do

    end

    test "returns false when user id is not the StripeCustomer id" do

    end
  end
end
