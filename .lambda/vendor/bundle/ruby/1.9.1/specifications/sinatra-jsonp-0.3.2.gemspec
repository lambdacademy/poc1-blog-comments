# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{sinatra-jsonp}
  s.version = "0.3.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Serg Podtynnyi}]
  s.date = %q{2012-01-16}
  s.description = %q{JSONP output helper for Sinatra}
  s.email = %q{serg.podtynnyi@gmail.com}
  s.homepage = %q{http://github.com/shtirlic/sinatra-jsonp}
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.6}
  s.summary = %q{JSONP output helper for Sinatra}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sinatra>, ["~> 1.0"])
      s.add_runtime_dependency(%q<json_pure>, ["~> 1.4"])
      s.add_development_dependency(%q<rspec>, ["~> 2.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<sinatra-contrib>, ["~> 1.0"])
    else
      s.add_dependency(%q<sinatra>, ["~> 1.0"])
      s.add_dependency(%q<json_pure>, ["~> 1.4"])
      s.add_dependency(%q<rspec>, ["~> 2.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<sinatra-contrib>, ["~> 1.0"])
    end
  else
    s.add_dependency(%q<sinatra>, ["~> 1.0"])
    s.add_dependency(%q<json_pure>, ["~> 1.4"])
    s.add_dependency(%q<rspec>, ["~> 2.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<sinatra-contrib>, ["~> 1.0"])
  end
end
