defmodule CodeCorps.StripeAccountPolicyTest do
  use CodeCorps.PolicyCase

  import CodeCorps.StripeAccountPolicy, only: [index?: 2, show?: 2]
  import CodeCorps.StripeAccount, only: [create_changeset: 2]

  alias CodeCorps.StripeAccount

  describe "index?" do
    test "returns true when user is an admin" do
      user = build(:user, admin: true)
      organization = insert(:organization)

      assert index?(user, %{organization_id: organization.id})
    end

    test "returns false when user is not member of organization" do
      user = insert(:user)
      organization = insert(:organization)

      refute index?(user, %{organization_id: organization.id})
    end

    test "returns false when user is pending member of organization" do
      user = insert(:user)
      organization = insert(:organization)

      insert(:organization_membership, role: "pending", member: user, organization: organization)

      refute index?(user, %{organization_id: organization.id})
    end

    test "returns false when user is contributor of organization" do
      user = insert(:user)
      organization = insert(:organization)

      insert(:organization_membership, role: "contributor", member: user, organization: organization)

      refute index?(user, %{organization_id: organization.id})
    end
  end

  describe "show?" do
    test "returns true when user is an admin" do
      user = build(:user, admin: true)
      organization = insert(:organization)

      assert show?(user, organization)
    end

    test "returns false when user is not member of organization" do
      user = insert(:user)
      organization = insert(:organization)

      refute show?(user, organization)
    end

    test "returns false when user is pending member of organization" do
      user = insert(:user)
      organization = insert(:organization)

      insert(:organization_membership, role: "pending", member: user, organization: organization)

      refute show?(user, organization)
    end

    test "returns false when user is contributor of organization" do
      user = insert(:user)
      organization = insert(:organization)

      insert(:organization_membership, role: "contributor", member: user, organization: organization)

      refute show?(user, organization)
    end

    test "returns true when user is admin of organization" do
      user = insert(:user)
      organization = insert(:organization)

      insert(:organization_membership, role: "admin", member: user, organization: organization)

      assert show?(user, organization)
    end

    test "returns true when user is owner of organization" do
      user = insert(:user)
      organization = insert(:organization)

      insert(:organization_membership, role: "owner", member: user, organization: organization)

      assert show?(user, organization)
    end
  end

  # describe "stripe_auth?" do
  #   test "returns true when user is an admin" do
  #     user = build(:user, admin: true)
  #     organization = build(:organization)
  #
  #     assert stripe_auth?(user, organization)
  #   end
  #
  #   test "returns false when user is not member of organization" do
  #     user = insert(:user)
  #     organization = insert(:organization)
  #
  #     refute stripe_auth?(user, organization)
  #   end
  #
  #   test "returns false when user is pending member of organization" do
  #     user = insert(:user)
  #     organization = insert(:organization)
  #
  #     insert(:organization_membership, role: "pending", member: user, organization: organization)
  #
  #     refute stripe_auth?(user, organization)
  #   end
  #
  #   test "returns false when user is contributor of organization" do
  #     user = insert(:user)
  #     organization = insert(:organization)
  #
  #     insert(:organization_membership, role: "contributor", member: user, organization: organization)
  #
  #     refute stripe_auth?(user, organization)
  #   end
  #
  #   test "returns false when user is admin of organization" do
  #     user = insert(:user)
  #     organization = insert(:organization)
  #
  #     insert(:organization_membership, role: "admin", member: user, organization: organization)
  #
  #     refute stripe_auth?(user, organization)
  #   end
  #
  #   test "returns false when user is owner of organization" do
  #     user = insert(:user)
  #     organization = insert(:organization)
  #
  #     insert(:organization_membership, role: "owner", member: user, organization: organization)
  #
  #     assert stripe_auth?(user, organization)
  #   end
  # end
end
