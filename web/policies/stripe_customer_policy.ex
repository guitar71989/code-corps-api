defmodule CodeCorps.StripeCustomerPolicy do
  import CodeCorps.Helpers.Policy,
  only: [admin_or_higher?: 1, get_membership: 2, get_role: 1, owner?: 1]

  alias CodeCorps.StripeCustomer
  alias CodeCorps.User
  alias Ecto.Changeset

  def index?(%User{admin: true}, %StripeCustomer{}), do: true
  def index?(%User{} = user, %StripeCustomer{} = stripe_customer), do: stripe_customer |> get_membership(user) |> get_role |> admin_or_higher?

  def show?(%User{admin: true}, %StripeCustomer{}), do: true
  def show?(%User{} = user, %StripeCustomer{} = stripe_customer), do: stripe_customer |> get_membership(user) |> get_role |> owner?
  def show?(%User{} = user, %StripeCustomer{} = stripe_customer), do: stripe_customer.id == user_id
  def show?(%User{}, %StripeCustomer{}), do: false
end
