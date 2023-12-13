module ApplicationHelper
  def default_meta_tags
    {
      site: "Kids Exercises App",
      image: image_url('background.jpeg'),
      description: "Perfect app for kids",
      og: {
        title: "Kids Exercises App",
        image: image_url('background.jpeg'),
        description: "Perfect app for kids",
        site_name: "Kids Exercises App"
      }
      # TODO: add twitter tags
    }
  end
end
