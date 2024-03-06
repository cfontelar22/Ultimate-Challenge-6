# app/admin/customer.rb
ActiveAdmin.register Customer do
    permit_params :full_name, :phone_number, :email, :notes, :image
  
    index do
      selectable_column
      id_column
      column :full_name
      column :phone_number
      column :email
      column :created_at
      actions
    end
  
    filter :full_name
    filter :phone_number
    filter :email
    filter :created_at
  
    form do |f|
      f.inputs "Customer Details" do
        f.input :full_name
        f.input :phone_number
        f.input :email
        f.input :notes
        f.input :image, as: :file
      end
      f.actions
    end
  
    controller do
      def scoped_collection
        super.includes(:image_attachment)
      end
    end
  
    def self.ransackable_attributes(auth_object = nil)
      %w[id full_name phone_number email notes created_at updated_at]
    end
  
    def self.ransackable_associations(auth_object = nil)
      ["image_attachment", "image_blob"]
    end
  end
  