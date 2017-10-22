defmodule ExAws.Cognito do
  @moduledoc """
  AWS Cognito-idp
  """

  import ExAws.Utils, only: [camelize_keys: 1]
  require Logger

  @namespace "AWSCognitoIdentityProviderService"

  ## Streams
  ######################

  @type stream_name :: binary
  # ExAws.Cognito.list_users |> ExAws.request
  # ExAws.Cognito.list_users(%{:user_pool_id => "us-west-2_e3v0YLSV2"}) |> ExAws.request

  @doc "ListUsers"
  @type user_pool_id :: binary
  @type username :: binary

  @type list_users_opts :: [
    {:attributes_to_get, list} |
    {:filter, binary} |
    {:pagination_token, binary} |
    {:limit, pos_integer}
  ]
  @spec list_users(user_pool_id :: binary) :: ExAws.Operation.JSON.t
  @spec list_users(user_pool_id :: binary, opts :: list_users_opts) :: ExAws.Operation.JSON.t
  def list_users(user_pool_id, opts \\ %{}) do
    data = opts
    |> Map.put(:user_pool_id, user_pool_id)
    |> camelize_keys
    |> Map.merge(%{})

    request(:list_users, data)
  end


  @doc "AdminListDevices"
  @type admin_list_devices_opts :: [
    {:limit, pos_integer} |
    {:pagination_token, binary}
  ]
  @spec admin_list_devices(user_pool_id :: binary, username :: binary) :: ExAws.Operation.JSON.t
  @spec admin_list_devices(user_pool_id :: binary, username :: binary, opts :: admin_list_devices_opts) :: ExAws.Operation.JSON.t
  def admin_list_devices(user_pool_id, username, opts \\ %{}) do
    data = opts
    |> Map.put(:user_pool_id, user_pool_id)
    |> Map.put(:username, username)
    |> camelize_keys
    |> Map.merge(%{})

    request(:admin_list_devices, data)
  end

  @type admin_validation_data :: {
    :name, binary |
    :value, binary
  }

  @type user_attribute :: {
    :name, binary |
    :value, binary
  }

  @doc "AdminCreateUser"
  @type admin_create_user_opts :: [
    {:limit, pos_integer} |
    {:desired_delivery_mediums, binary} |
    {:force_alias_creation, boolean} |
    {:message_action, binary} |
    {:tempory_password, binary} |
    {:user_attributes, user_attribute} |
    {:validation_data, admin_validation_data}
  ]

  @spec admin_create_user(user_pool_id :: binary, username :: binary) :: ExAws.Operation.JSON.t
  @spec admin_create_user(user_pool_id :: binary, username :: binary,  opts :: admin_create_user_opts) :: ExAws.Operation.JSON.t
  def admin_create_user(user_pool_id, username, opts \\ %{}) do
    data = opts
    |> Map.put(:user_pool_id, user_pool_id)
    |> Map.put(:username, username)
    |> camelize_keys
    |> Map.merge(%{})

    request(:admin_create_user, data)
  end


  @doc "AdminAddUserToGroup"

  @spec admin_create_user(user_pool_id :: binary, username :: binary,  group_name :: binary) :: ExAws.Operation.JSON.t
  def admin_add_user_to_group(user_pool_id, username, group_name) do
    data = opts
    |> Map.put(:user_pool_id, user_pool_id)
    |> Map.put(:username, username)
    |> Map.put(:group_name, group_name)
    |> camelize_keys
    |> Map.merge(%{})

    request(:admin_add_user_to_group, data)
  end


  @doc "AdminUpdateUserAttributes"
  @type admin_update_user_attributes :: [
    {:user_attributes, user_attribute}
  ]

  @spec admin_update_user_attributes(user_pool_id :: binary, username :: binary) :: ExAws.Operation.JSON.t
  @spec admin_update_user_attributes(user_pool_id :: binary, username :: binary, opts :: admin_update_user_attributes) :: ExAws.Operation.JSON.t
  def admin_update_user_attributes(user_pool_id, username, opts \\ %{}) do
    data = opts
    |> Map.put(:user_pool_id, user_pool_id)
    |> Map.put(:username, username)
    |> camelize_keys
    |> Map.merge(%{})

    request(:admin_update_user_attributes, data)
  end


  @doc "AdminDeleteUser"
  @spec admin_delete_user(user_pool_id :: binary, username :: binary) :: ExAws.Operation.JSON.t
  def admin_delete_user(user_pool_id, username) do
    data = %{:username => username}
    |> Map.put(:user_pool_id, user_pool_id)
    |> camelize_keys
    |> Map.merge(%{})

    request(:admin_delete_user, data)
  end

  @doc "AdminEnableUser"
  @spec admin_enable_user(user_pool_id :: binary, username :: binary) :: ExAws.Operation.JSON.t
  def admin_enable_user(user_pool_id, username) do
    data = %{:username => username}
    |> Map.put(:user_pool_id, user_pool_id)
    |> camelize_keys
    |> Map.merge(%{})

    request(:admin_enable_user, data)
  end

  @doc "AdminDisableUser"
  @spec admin_disable_user(user_pool_id :: binary, username :: binary) :: ExAws.Operation.JSON.t
  def admin_disable_user(user_pool_id, username) do
    data = %{:username => username}
    |> Map.put(:user_pool_id, user_pool_id)
    |> camelize_keys
    |> Map.merge(%{})

    request(:admin_disable_user, data)
  end

  @doc "AdminGetUser"
  @spec admin_get_user(user_pool_id :: binary, username :: binary) :: ExAws.Operation.JSON.t
  def admin_get_user(user_pool_id, username) do
    data = %{:username => username}
    |> Map.put(:user_pool_id, user_pool_id)
    |> camelize_keys
    |> Map.merge(%{})

    request(:admin_get_user, data)
  end

  @doc "AdminGetDevice"
  @spec admin_get_device(user_pool_id :: binary , username :: binary, device :: binary) :: ExAws.Operation.JSON.t
  def admin_get_device(user_pool_id, username, device) do
    data = %{:username => username}
    |> Map.put(:device_key, device)
    |> Map.put(:user_pool_id, user_pool_id)
    |> camelize_keys
    |> Map.merge(%{})

    request(:admin_get_device, data)
  end


  @doc "AdminConfirmUser"

  @spec admin_confirm_user(user_pool_id :: binary, username :: binary) :: ExAws.Operation.JSON.t
  def admin_confirm_user(user_pool_id, username) do
    data = %{:username => username}
    |> Map.put(:user_pool_id, user_pool_id)
    |> camelize_keys
    |> Map.merge(%{})

    request(:admin_confirm_sign_up, data)
  end

  @doc "AdminResetUserPassword"
  @spec admin_reset_user_password(user_pool_id :: binary, username :: binary) :: ExAws.Operation.JSON.t
  def admin_reset_user_password(user_pool_id, username) do
    data = %{:username => username}
    |> Map.put(:user_pool_id, user_pool_id)
    |> camelize_keys
    |> Map.merge(%{})

    request(:admin_reset_user_password, data)
  end

  @doc "AdminUserGlobalSignOut"

  @spec admin_user_global_signout(user_pool_id :: binary, username :: binary) :: ExAws.Operation.JSON.t
  def admin_user_global_signout(user_pool_id, username) do
    data = %{:username => username}
    |> Map.put(:user_pool_id, user_pool_id)
    |> camelize_keys
    |> Map.merge(%{})

    request(:admin_user_global_sign_out, data)
  end


  defp request(action, data, opts \\ %{}) do
    operation =
      action
      |> Atom.to_string
      |> Macro.camelize

    ExAws.Operation.JSON.new(:"cognito-idp", %{
      data: data,
      headers: [
        {"x-amz-target", "#{@namespace}.#{operation}"},
        {"content-type", "application/x-amz-json-1.1"}
      ]
    } |> Map.merge(opts))
  end
end
