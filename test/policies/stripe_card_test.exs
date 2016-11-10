defmodule CodeCorps.StripeAccountPolicyTest do
 use CodeCorps.PolicyCase

 import CodeCorps.StripeAccount
 import CodeCorps.StripeAccountPolicy, only: [index?: 2, show?: 2]

 alias CodeCorps.StripeAccount

  @tag :pending
  describe "index?" do
   test "returns true when user is an admin" do
     #test
   end
 end
end
