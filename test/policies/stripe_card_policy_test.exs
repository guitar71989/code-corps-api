defmodule CodeCorps.StripeAccountPolicyTest do
 use CodeCorps.PolicyCase

 import CodeCorps.StripeCard
 import CodeCorps.StripeCardPolicy, only: [index?: 2, show?: 2]

 alias CodeCorps.StripeCard

  describe "index?" do
   test "returns true when user is the current user" do
     #test
   end

   test "returns false when user is not the current user" do
     #test
   end
  end

  describe "show?" do
   test "returns true when user is the current user" do
     #test
   end

   test "returns false when user is not the current user" do
     #test
   end
  end

end
