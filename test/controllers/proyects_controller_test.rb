require 'test_helper'

class ProyectsControllerTest < ActionController::TestCase
  setup do
    @project = proyects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proyect" do
    assert_difference('Proyect.count') do
      post :create, project: { description: @project.description, end_date: @project.end_date, name: @project.name, start_date: @project.start_date, state: @project.state }
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should show proyect" do
    get :show, id: @project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project
    assert_response :success
  end

  test "should update proyect" do
    patch :update, id: @project, project: { description: @project.description, end_date: @project.end_date, name: @project.name, start_date: @project.start_date, state: @project.state }
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy proyect" do
    assert_difference('Proyect.count', -1) do
      delete :destroy, id: @project
    end

    assert_redirected_to projects_path
  end
end
