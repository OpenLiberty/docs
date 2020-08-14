# docs
# Writing and publishing docs on OpenLiberty.io 

The author of the doc must complete the following steps:
  
1. Clone [the docs repo](https://github.com/OpenLiberty/docs) and create your feature branch off of the default `vNext` branch. Include the number of the Git issue for the doc in the name of your branch (e.g. `1234-concept-topic`). Do _all_ your writing and editing in this branch.

2. Create your doc by using [Asciidoc](https://asciidoctor.org/docs/asciidoc-syntax-quick-reference/) markup. Use an editor such as [Atom](https://atom.io/) or [VSCode with the Asciidoc plugin](https://marketplace.visualstudio.com/items?itemName=joaompinto.asciidoctor-vscode).

3. When you finish the initial draft, check that it renders correctly by using the preview function in your editor. Make sure to run [Acrolinx](https://www.acrolinx.com/) to check for grammar and IBM style issues. 

4. Push the file to GitHub, then create a pull request (PR) into the `draft` branch. Link the PR to the issue you created in Step 1. Request a review of the PR from one of the doc maintainers.

5. Request a build of the [draft openliberty.io site](https://draft-openlibertyio.mybluemix.net/docs/):
    1. Sign in to [Travis CI](https://travis-ci.com/github/OpenLiberty/openliberty.io) with your GitHub account.
    2. Click **More Options > Trigger Build**. Make sure the `master` branch is selected, then click **Trigger custom build**. The draft site build starts running.
            

6. When the build finishes, check that the doc renders correctly on the [draft site](https://draft-openlibertyio.mybluemix.net/docs/). Post a link to your draft in the Git issue for the doc.

    If you see any problems (e.g. formatting or typos), first resolve them in your branch, create another PR into `draft` branch (link the PR to the issue again), then run the [draft site build from Travis CI](https://travis-ci.com/github/OpenLiberty/openliberty.io) again.

7. Submit your doc for technical, strategist, peer, and editorial reviews. 

   Reviewers should leave comments in the git issue for the doc. Make sure to respond to their comments in the issue and document hwo the concerns that they raised have been addressed. When the reviewer is satisfied with the draft, they can sign off by adding the appropriate label to the Git issue:`technical reviewed`, `peer reviewed`, `strategist reviewed`, or `editorial reviewed`. Make sure to keep the Git "Pipelines" status updated in the issue to reflect the stage of review that the doc is ready for or undergoing.

   _If the doc is a task_, it must be tested so that the steps are verified. Coordinate testing with the technical reviewer and add the `doc tested` label when the steps have been verified.

8. When all the reviews are complete, if your doc is targeted to publish in the next release, create a PR from your branch (_not_ from the `draft` branch) to the `staging` branch. If your doc is not targeted to publish until a later release, do not make the PR to staging until the target release is the next scheduled release. For example, if you doc is targeted for the 20.0.0.10 release, do not create a PR to staging until after the 20.0.0.9 release is published.

   Link the PR to the issue. Request a review of the PR from David Mueller (`dmuelle`) or Charlotte Holt (`Charlotte-Holt`).

   In the PR, provide a link to your post on the [draft site](https://draft-openlibertyio.mybluemix.net/docs/).
   
9. If any changes are requested to the PR, make them in your branch and push them to draft first. Then run the draft site build from Travis CI again to check that they are fine on the draft site. Then open a new PR to staging and request another review.

10. Once the PR to staging is approved and merged, request a build of the [staging openliberty.io site from Travis CI](https://travis-ci.com/github/OpenLiberty/openliberty.io). To trigger a staging build, use the same procedure that you used in step 5 to trigger a draft build.

11. When the build finishes, check to make sure the doc renders correctly on the [staging site](https://staging-openlibertyio.mybluemix.net/docs/). If any changes are needed make sure to add them to the draft branch and review on the draft site before making a new PR to staging.

12. Once you verify the doc, post a link to it on the staging site to the Git issue and change the issue status to `Ready to publish`.  Open a PR from `staging` to `vNext` and request approval of the PR from one of the doc publishers. Once the PR is approved and merged to `vNext`, it will publish with the next scheduled release.



