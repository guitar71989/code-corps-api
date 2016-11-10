defmodule CodeCorps.StripeAccountPolicyTest do
  use CodeCorps.PolicyCase

  import CodeCorps.StripeAccount
  import CodeCorps.StripeAccountPolicy, only: [index?: 2, show?: 2]

  alias CodeCorps.StripeAccount

  describe "index?" do
    test "returns true when user is an admin" do
      user = build(:user, admin: true)
      stripe_account = insert(:stripe_account)

      assert index?(user, %{stripe_account_id: stripe_account.id})
    end

    test "returns false when user is not member of organization" do
      user = insert(:user)
      stripe_account = insert(:stripe_account)

      refute index?(user, %{stripe_account_id: stripe_account.id})
    end

    test "returns false when user is pending member of organization" do
      user = insert(:user)
      stripe_account = insert(:stripe_account)

      insert(:organization_membership, role: "pending", member: user)

      refute index?(user, %{stripe_account_id: stripe_account.id})
    end

    test "returns false when user is contributor of organization" do
      user = insert(:user)
      stripe_account = insert(:stripe_account)

      insert(:organization_membership, role: "contributor", member: user)

      refute index?(user, %{stripe_account_id: stripe_account.id})
    end
  end

  describe "show?" do
    test "returns true when user is an admin" do
      user = build(:user, admin: true)
      stripe_account = insert(:stripe_account)

      assert show?(user, stripe_account)
    end

    test "returns true when user is owner of organization" do
      user = insert(:user)
      stripe_account = insert(:stripe_account)

      insert(:organization_membership, role: "owner", member: user)

      assert show?(user, stripe_account)
    end

    test "returns false when user is admin of organization" do
      user = insert(:user)
      stripe_account = insert(:stripe_account)

      insert(:organization_membership, role: "admin", member: user)

      refute show?(user, stripe_account)
    end

    test "returns false when user is not member of organization" do
      user = insert(:user)
      stripe_account = insert(:stripe_account)

      refute show?(user, stripe_account)
    end

    test "returns false when user is pending member of organization" do
      user = insert(:user)
      stripe_account = insert(:stripe_account)

      insert(:organization_membership, role: "pending", member: user)

      refute show?(user, stripe_account)
    end

    test "returns false when user is contributor of organization" do
      user = insert(:user)
      stripe_account = insert(:stripe_account)

      insert(:organization_membership, role: "contributor", member: user)

      refute show?(user, stripe_account)
    end
  end
end
