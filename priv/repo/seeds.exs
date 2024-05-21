# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     CytelyTask.Repo.insert!(%CytelyTask.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

CytelyTask.Repo.delete_all(CytelyTask.Accounts.User)

CytelyTask.Repo.insert!(%CytelyTask.Accounts.User{
  email: "admin@cytely.com",
  password: "cytely_admin123",
  hashed_password: Bcrypt.hash_pwd_salt("cytely_admin123"),
  role: :admin
})

CytelyTask.Repo.insert!(%CytelyTask.Accounts.User{
  email: "user@cytely.com",
  password: "cytely_user123",
  hashed_password: Bcrypt.hash_pwd_salt("cytely_user123"),
  role: :user
})
