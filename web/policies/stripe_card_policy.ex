defmodule CodeCorps.StripeCardPolicy do
  alias CodeCorps.StripeCard
  alias CodeCorps.User

  def index?(%User{} = user, %User{} = current_user), do: user.id == current_user.id

  def show?(%User{} = user, %User{} = current_user), do: user.id == current_user.id
end
