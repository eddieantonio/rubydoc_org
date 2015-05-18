# Adds a doc method to every object.

# Make the method accessible on all
class Object
  # Opens a browser window showing the documentation for the given
  # class or method on ruby-doc.org.
  #
  # Usage:
  #
  # instance.doc            -> Goes to class documentation.
  # instance.doc :method    -> Goes to method documentation.
  def doc(name = nil)
    cls = self.class
    # Evaluate there to use all of the helpers in this module.
    RubyDocOrg.module_eval do
      url = name.nil? ? class_url(cls) : method_url(cls, name)
      launch_browser url
    end
    nil
  end
end
