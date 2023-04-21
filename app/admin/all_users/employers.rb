ActiveAdmin.register User, as: "employers" do

  # , as: 'Candidates'

  menu parent: ['all_users']

  config.batch_actions = false
  # config.filters = false
  # config.comments = false
  config.sort_order = 'name_asc'
  # config.per_page = 1
 
  actions :all, except: [:destroy]

  # filter :name, filters: [:starts_with, :ends_with]
  filter :name , filters: [:equals, :contains], label: 'Something else'
  # filter :name_contains, label: 'Something else'

  scope :all
  scope :active
  scope :inactive
  scope :deleted
  # scope :working
  # scope :working, :default => true do |users|
  #   users.where(name: '44')
  # end

  permit_params :name, :email, :role, :status

  index do
    id_column
    column :name
    column :email
    column :role
    column :created_at
    # actions
    actions defaults: true do |user|
      link_to 'new action', admin_candidates_path
    end
  end

  show do
    attributes_table do
      row :id
      row :name
      # row :image do |resource|
      #   image_tag(resource.image, width: 150, height: 150)
      # end
      row "user_email" do |resource|
        resource.email
      end
      row :role    
      row :status
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.attribute_names
    f.inputs do
      # f.input :image, as: :file, input_html: {accept: ".ico, .png, .jpg, .jpeg"}, hint: (image_tag(f.object.image, width: 150, height: 150)
      f.input :name#, hint: "Only alphabets allowed" if f.object.new_record?
      f.input :email#, as: :quill_editor
      f.input :status, as: :select
      f.input :role, as: :select #hint: image_tag(f.object.image, width: 150, height: 150) if f.object.new_record?
    end
    f.actions
  end

  # members do
  # end

  controller do

    def scoped_collection
      super.employer
    end

  #   def update
  #     super
  #   end
  end

end
