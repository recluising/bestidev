module ApplicationHelper
  def taxon(name)
    # Shop by Productos, carefull if we change Taxonomy!
    #Taxonomy.find_by_name("Productos").root.children.find_by_name(name)
    # Shop by first option, less likely to chanche:
    Taxonomy.all.first.root.children.find_by_name(name)
  end
end
