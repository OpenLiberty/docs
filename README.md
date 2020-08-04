# docs
# Writing and publishing blog posts on the OpenLiberty.io blog

* [Authors: creating a new blog post](#Authors-creating-a-new-blog-post)
* [Editors: editing and publishing a post](#Editors-editing-and-publishing-a-post)
* [Authors and Editors: updating a published post](#Authors-and-Editors-updating-a-published-post)
* [Troubleshooting Asciidoc](#Troubleshooting-Asciidoc)
* [Running a Docker container for local preview](#Running-a-Docker-container-for-local-preview)


## Authors: creating a new blog post

These steps are to be completed by the author of the doc:
  

1. Clone the repo and create your feature branch off of the default `vNext` branch. Include the number of the Git issue for the doc in the name of your branch (e.g. `1234-concept-topic`). Do _all_ your writing and editing in this branch.

2. Create your doc using [Asciidoc](https://asciidoctor.org/docs/asciidoc-syntax-quick-reference/) markup (use an editor such as [Atom](https://atom.io/) or [VSCode with the Asciidoc plugin](https://marketplace.visualstudio.com/items?itemName=joaompinto.asciidoctor-vscode)).

3. When you have finished the post, check that it renders correctly by using the preview function in your editor. Make sure to run [Acrolinx](https://www.acrolinx.com/) to check for grammar and IBM style issues. 

4. Push the file to GitHub, then create a pull request (PR) into the `draft` branch.

   Link the PR to the issue you created in Step 1.

5. Request a build of the [draft openliberty.io site](https://draft-openlibertyio.mybluemix.net/docs/):
    1. Sign in to [Travis CI](https://travis-ci.com/github/OpenLiberty/openliberty.io) with your GitHub account.
    2. Click **More Options > Trigger Build**. Make sure the `master` branch is selected, then click **Trigger custom build**.
    
          The draft site build starts running.

6. When the build is finished, check that the doc renders correctly on the [draft site](https://draft-openlibertyio.mybluemix.net/docs/). Post a link to your draft in the Git issue for the doc.

  If you see any problems (e.g. formatting or typos), resolve them first in your branch, create another PR into `draft` branch (link the PR to the issue again), then run the [draft site build from Travis CI](https://travis-ci.com/github/OpenLiberty/openliberty.io) again.

7. Submit your doc for technical, strategist, peer, and editorial reviews. 

  Reviewers should leave comments in the git issue for the doc. Make sure to respond to their comments in the issue and document hwo the concerns that they raised have been addressed. When the reviewer is satisfied with the draft, they can sign off by adding the appropriate label to the Git issue (`technical reviewed`, `peer reviewed` `strategist reviewed` or `editorial reviewed`). Make sure to keep the Git "Pipelines" status updated in the issue to reflect the stage of review that the doc is ready for or undergoing.

  If the doc is a task, it must be tested so the steps are verified. Coordinate the testing with the technical reviewer and add the `doc tested` label when the steps have been verified.

8. When all the reviews are complete, if your doc is targeted to publish in the next release, create a PR from your branch (_not_ from the `draft` branch) to the `staging` branch. Do not create the PR to staging until the week before the release in which your doc is targeted to publish. If your doc is not targeted to publish until a later release, do not make the PR to staging.

  Link the PR to the issue. Request a review of the PR from David Mueller (`dmuelle`) or Charlotte Holt (`Charlotte-Holt`).

  In the PR, provide a link to your post on the [draft site](https://draft-openlibertyio.mybluemix.net/blog/).
   
9. If any changes are requested to the PR, make them in your branch, push the changes to the draft branch, then run the draft site build from Travis CI again to check that they are fine on the draft site.

  This automatically updates the PR to staging.

10. Once the PR to staging is approved and merged, request a build of the [staging openliberty.io site from Travis CI](https://travis-ci.com/github/OpenLiberty/openliberty.io). To trigger a staging build, use the same procedure that you used in step 5 to trigger a draft build.

11. When the build finishes, check to make sure the doc renders correctly on the [staging site](https://staging-openlibertyio.mybluemix.net/blog/). If any changes are needed make sure to add them to the draft branch and review on the draft site before making a PR to staging.

12. Once you verify the doc, post a link to it on the staging site to the Git issue and change the issue status to `Ready to publish`. The ID focals will merge the staging draft to `vNext` so that it publishes with the next release.





## Editors: editing and publishing a post

These steps are completed by the editors of the blog. They might ask questions or make suggestions to the author of the post. They might also make edits directly in the post to prepare it for publishing.

1. Review the post on the [draft site](https://draft-openlibertyio.mybluemix.net/blog/) as linked from the issue.

   Ask the author to make changes by adding review comments to the PR.

   For edits such as punctuation, formatting, highlighting, adding SEO details, or larger changes discussed with the author, the editor can make the edits directly in the author's branch and push the changes to `draft` branch, then rebuild the [draft site from Travis CI](https://travis-ci.com/github/OpenLiberty/openliberty.io) to check them.
   
   To check out the author's branch locally: `git fetch origin` then `git checkout -b branch_name origin/branch_name`, which creates a new local branch that's linked to their remote branch. When you've made changes, push them back to `origin/branch_name`.

2. Add tags to the blog post:

   a. In the author's branch, update the [blogs_tags.json](./blog_tags.json) file by adding the slug of the blog post (the file name without the date part or the `.adoc`) to the start of the `posts` array (1-2 entries per line) for each appropriate tag. Do this in an editor (such as VSCode) and make sure the syntax is correct.

   b. Push the changes to `draft` branch as before and check that they get built correctly on the [draft site](https://draft-openlibertyio.mybluemix.net/blog/).

2. When a publishing date has been decided:

   * Check that the post looks fine.
   
   * Check that the author's details and the SEO details, including front matter, the title, and the filename slug, are appropriate for the post.
   
   * Check that the post has tags defined in the `blogs_tags.json` file in the same PR.

   * If necessary, rename the file with the planned publication date.

3. On the day of publication (or the day before):

   a. Approve the PR.
   
   b. Ask @lauracowen (or another admin) to merge the PR into `staging`.
   
4. Request a build of the [staging openliberty.io site from Travis CI](https://travis-ci.com/github/OpenLiberty/openliberty.io).

5. When the build has finished, check to make sure the blog renders correctly on the [staging site](https://staging-openlibertyio.mybluemix.net/blog/). 

   This is the final check before the post is published live on the [production site](https://openliberty.io/blog/).

   If there are any problems found on the [staging site](https://staging-openlibertyio.mybluemix.net/blog/), you must resolve them quickly or revert the PR.
   
   Make any changes in the author's branch, and push to both `draft` and `staging`.
   
6. To publish the post, create a PR from `staging` branch to `prod` branch and add @lauracowen (or other admin) as approver.

7. When the PR is approved, merge it into `prod`.

12. Rebuild the [production site from the IBM Cloud console](https://console.bluemix.net/devops/pipelines/fcc7c3e9-9c40-4a58-8a7f-09c08413ab7d?env_id=ibm:yp:us-south).

    When the build has finished, check that the post looks as expected on [openliberty.io/blog](https://openliberty.io/blog/).

    If the post's file name uses a future date, the post will not exist on the production site until at least that date and the production site has been rebuilt.

13. When the post is published, and any changes you made are in all three branches (`draft`, `staging`, and `prod`), delete the author's branch.

You've published a post!



## Authors and Editors: updating a published post

If a published post on openliberty.io/blog contains an error or needs updating in any way, anyone can create a PR to get it fixed.

1. As when creating a new post (see above), clone the `blogs` repo and create a new branch based on the `prod` branch. You will do all your work in this branch.

2. Open the file in an editor (e.g. [VSCode with the Asciidoc plugin](https://marketplace.visualstudio.com/items?itemName=joaompinto.asciidoctor-vscode)) and make any changes needed.

3. If the tags need correcting, update the [blogs_tags.json](./blog_tags.json) file. If you add new tags, make sure to add the blog post's slug to the beginning of the `posts` arrays (1-2 entries per line) for each tag.

4. Create a PR from your branch to the `draft` branch, then (when the PR has been merged) run the [draft site build from Travis CI](https://travis-ci.com/github/OpenLiberty/openliberty.io) to check that the changes are fine on the [draft site](https://draft-openlibertyio.mybluemix.net/blog/).

   Make any changes in your branch then push to `draft` branch again rebuild.

5. Create a PR from your branch to `staging branch` (not from `draft` branch) and add @lauracowen as reviewer. You can create this PR at any point because any new changes you make in your branch are automatically added to the PR.

6. When approved, @lauracowen (or other admin) will merge to `staging`, then run the [build for the staging site from Travis CI](https://travis-ci.com/github/OpenLiberty/openliberty.io) and check that it looks fine on the [staging site](https://staging-openlibertyio.mybluemix.net/blog/).

7. The approver will then create a PR from `staging` to `prod`, then merge and [rebuild the production site from the IBM Cloud console](https://console.bluemix.net/devops/pipelines/fcc7c3e9-9c40-4a58-8a7f-09c08413ab7d?env_id=ibm:yp:us-south) to publish the updates on the [openliberty.io/blog](https://openliberty.io/blog/).



## Troubleshooting Asciidoc

Certain characters (eg apostrophe ' ) in the main heading are displayed incorrectly. To fix, escape with a backslash (`\`).
eg `= Minimise turnaround times with Open Liberty\'s dev mode`

See also:
* [Asciidoc quick syntax](https://asciidoctor.org/docs/asciidoc-syntax-quick-reference/)
* [Asciidoc user manual (more detailed)](https://asciidoctor.org/docs/user-manual/)



## Running a Docker container for local preview

Github.com does a pretty good job of rendering asciidoc so you can preview your file there, but to see exactly what it will
look like you can run the website locally. 

### Running the website on your local machine
```
git clone https://github.com/OpenLiberty/blogs.git
git clone https://github.com/OpenLiberty/openliberty.io.git
docker pull kinueng/openliberty.io
```
Replace "currentFolder" in the following command with the full path to the folder you are in. 
```
docker run --rm --name website -it -p 4000:4000 -v currentFolder/openliberty.io:/home/jekyll kinueng/openliberty.io

# example when current directory is /Users/bruce/projects/blog/website:
# docker run --name website -it -p 4000:4000 -v /Users/bruce/projects/blog/website/openliberty.io:/home/jekyll kinueng/openliberty.io
```

### Update the running container with your edits
Before your new or updated blog entry will appear on the website, you will need to run the script below to update the container with your latest changes, then wait for the container to finish processing them.  Then you can see your changes at http://localhost:4000/blog/

Note that blogs named with dates in the future, e.g. 2099-01-05, will not be shown, so don't do that. 

```
./blogs/scripts/refresh_docker_image.sh
```

### How to know when your changes are rendered by the container
You will see `Jekyll` detect your new files and regenerate the blog files.  You will want to wait for the line "...done in XXXX seconds."

```
      Regenerating: 101 file(s) changed at 2018-10-29 18:53:10
      ...
      Jekyll Feed: Generating feed for posts
      ...
            ...done in 121.8705398 seconds.
```


