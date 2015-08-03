module Gemsmith
  module Skeletons
    class GitSkeleton < BaseSkeleton
      def create_files
        template "%gem_name%/Gemfile.tt", template_options
      end

      def create_repository
        Dir.chdir(File.join(destination_root, gem_name)) do
          `git init`
          `git add .`
          `git commit --all --no-verify --message "Added Gemsmith skeleton."`
        end
      end
    end
  end
end
