defmodule ChannelLiveViewDemo.ReleaseTasks do
  def eval_purge_stale_data() do
    # Eval commands needs to start the app before
    # Or Application.load(:my_app) if you can't start it
    Application.ensure_all_started(:channel_live_view_demo)
  end

  def rpc_print_connected_users() do
    # Code that print users connected to the current running system
  end
end
