
# Writing and publishing docs on OpenLiberty.io 

## Overview

The Open Liberty website is built on the [Antora](https://antora.org/) framework, which provides a structure for publishing and managing versioned documentation. The documentation in [Open Liberty Docs](https://www.openliberty.io/docs/latest/overview.html) defaults to the most recent release version. You can view previous release versions by selecting them from the version picker that precedes the sidebar navigation. Each release version is managed from a separate branch.

To write and publish content in Open Liberty docs, you work with only the following three branches:
* `draft`+
 The branch where new content and updates to existing content is initially delivered so that the docs team can review it. All content updates remain in this branch until they are targeted to publish in the next release.
* `staging`+
 When content is approved for publication and is targeted for the next upcoming release, push it to the staging branch. This is the final opportunity to review the content and ensure that it is free of errors and ready to publish. Content should only be in the staging branch for as long as it takes to verify it, after which a doc maintainer will push the entire branch to `vNext`
 * `vNext`+
 vNext is source of each upcoming release. At release time, a cut is taken from this branch to make the release branch, which is then named `vX.0.0.x` according to the release version.

 Each branch is protected andd all pull requests require review from a either a [doc member](https://github.com/orgs/OpenLiberty/teams/docs-members) or [doc maintainer](https://github.com/orgs/OpenLiberty/teams/docs-maintainers/members).

## Publishing a new topic
The author of the doc must complete the following steps:
  
1. Clone [the docs repo](https://github.com/OpenLiberty/docs) and create your feature branch off of the default `vNext` branch. Include the number of the Git issue for the doc in the name of your branch (e.g. `1234-concept-topic`). Do _all_ your writing and editing in this branch.

2. Create your doc by using [Asciidoc](https://asciidoctor.org/docs/asciidoc-syntax-quick-reference/) markup. Use an editor such as [Atom](https://atom.io/) or [VSCode with the Asciidoc plugin](https://marketplace.visualstudio.com/items?itemName=joaompinto.asciidoctor-vscode).

3. When you finish the initial draft, check that it renders correctly by using the preview function in your editor. Make sure to run [Acrolinx](https://www.acrolinx.com/) to check for grammar and IBM style issues. 

4. Push the file to GitHub, then create a pull request (PR) into the `draft` branch. Link the PR to the issue you created in Step 1. Request a review of the PR from David Mueller (`dmuelle`), Charlotte Holt (`Charlotte-Holt`) or one of [the doc members](https://github.com/orgs/OpenLiberty/teams/docs-members). Notify your reviewer that this is a new topic that needs to be added to the draft navigation. They will work with you to determine the appropriate section of the navigation for your topic and to update the nav.adoc file.


5. Request a build of the [draft openliberty.io site](https://draft-openlibertyio.mybluemix.net/docs/):
    1. Sign in to [Travis CI](https://travis-ci.com/github/OpenLiberty/openliberty.io) with your GitHub account.
    2. Click **More Options > Trigger Build**. Make sure the `master` branch is selected, then click **Trigger custom build**. The draft site build starts running.
            

6. When the build finishes, check that the doc renders correctly on the [draft site](https://draft-openlibertyio.mybluemix.net/docs/). Post a link to your draft in the Git issue for the doc.

    If you see any problems (e.g. formatting or typos), first resolve them in your branch, create another PR into `draft` branch (link the PR to the issue again), then run the [draft site build from Travis CI](https://travis-ci.com/github/OpenLiberty/openliberty.io) again.

7. Submit your doc for technical, strategist, peer, and editorial reviews. 

   Reviewers should leave comments in the git issue for the doc. Make sure to respond to their comments in the issue and document how the concerns that they raised have been addressed. When the reviewer is satisfied with the draft, they can sign off by commenting their approval in the issue and adding the appropriate label to the Git issue:`technical reviewed`, `peer reviewed`, `strategist reviewed`, or `editorial reviewed`. Make sure to keep the Git "Pipelines" status updated in the issue to reflect the stage of review that the doc is ready for or undergoing.

   _If the doc is a task_, it must be tested so that the steps are verified. Add the `requires doc testing` label to the issue. Coordinate testing with the technical reviewer and ask the tester to comment their approval in the issue and add the `doc tested` label when the steps have been verified.

8. When all the reviews are complete, if your doc is targeted to publish in the next release, create a PR from your branch (_not_ from the `draft` branch) to the `staging` branch. If your doc is not targeted to publish until a later release, do not make the PR to staging until the target release is the next scheduled release. For example, if you doc is targeted for the 20.0.0.10 release, do not create a PR to staging until after the 20.0.0.9 release is published.

   Link the PR to the issue. Request a review of the PR from David Mueller (`dmuelle`), Charlotte Holt (`Charlotte-Holt`) or one of [the doc maintainers](https://github.com/orgs/OpenLiberty/teams/docs-maintainers/members). Work with your reviewer to update the staging nav.adoc file.

   In the PR, provide a link to your post on the [draft site](https://draft-openlibertyio.mybluemix.net/docs/).
   
9. If any changes are requested to the PR, make them in your branch and push them to draft first. Then run the draft site build from Travis CI again to check that they are fine on the draft site. Then open a new PR to staging and request another review.

10. Once the PR to staging is approved and merged, request a build of the [staging openliberty.io site from Travis CI](https://travis-ci.com/github/OpenLiberty/openliberty.io). To trigger a staging build, use the same procedure that you used in step 5 to trigger a draft build.

11. When the build finishes, check to make sure the doc renders correctly on the [staging site](https://staging-openlibertyio.mybluemix.net/docs/). If any changes are needed make sure to add them to the draft branch and review on the draft site before making a new PR to staging.

12. Once you verify the doc, post a link to it on the staging site to the Git issue and change the issue status to `Ready to publish`.  Open a PR from `staging` to `vNext` and Request a review of the PR from David Mueller (`dmuelle`), Charlotte Holt (`Charlotte-Holt`) or one of [the doc maintainers](https://github.com/orgs/OpenLiberty/teams/docs-maintainers/members). Once the PR is approved and merged to `vNext`, the doc will publish with the next scheduled release.

## Updating an existing topic
All edits and updates to existing Open Liberty docs must be documented and tracked in a GitHub issue in [the Open Liberty docs repo](https://github.com/OpenLiberty/docs). To update an existing topic, complete the following steps:

1. Clone [the docs repo](https://github.com/OpenLiberty/docs) and create your feature branch off of the default `vNext` branch. Include the number of the Git issue for the doc in the name of your branch (e.g. `1234-concept-topic`). Do _all_ your writing and editing in this branch.

2. Make the necessary edits to the doc or docs that are detailed in your Git Hub issue. Check that the content renders correctly by using the preview function in your editor. Make sure to run [Acrolinx](https://www.acrolinx.com/) to check for grammar and IBM style issues.

3. Push the file to GitHub, then create a pull request (PR) into the `draft` branch. Link the PR to the issue you created in Step 1. Request a review of the PR from David Mueller (`dmuelle`), Charlotte Holt (`Charlotte-Holt`) or one of [the doc members](https://github.com/orgs/OpenLiberty/teams/docs-members). Notify your reviewer if any changes to the navigation are required. They will work with you to update the nav.adoc file.

4. Request a build of the [draft openliberty.io site](https://draft-openlibertyio.mybluemix.net/docs/):
    1. Sign in to [Travis CI](https://travis-ci.com/github/OpenLiberty/openliberty.io) with your GitHub account.
    2. Click **More Options > Trigger Build**. Make sure the `master` branch is selected, then click **Trigger custom build**. The draft site build starts running.            

5. When the build finishes, check that the doc renders correctly on the [draft site](https://draft-openlibertyio.mybluemix.net/docs/). Post a link to your draft in the Git issue for the doc.

    If you see any problems (e.g. formatting or typos), first resolve them in your branch, create another PR into `draft` branch (link the PR to the issue again), then run the [draft site build from Travis CI](https://travis-ci.com/github/OpenLiberty/openliberty.io) again. 

6. Request a review of your doc

    If the changes you made were just to fix a typo or other minor grammar or style issues, request a peer review from a one of [the doc members](https://github.com/orgs/OpenLiberty/teams/docs-members).

    If you make updates or additions to technical information, request a technical review from the appropriate SME. If you edit a task and the steps substantially change, the doc must be tested. Add the `requires doc testing` label to the issue. Coordinate testing with the technical reviewer and ask the tester to comment their approval in the issue and add the `doc tested` label when the steps have been verified. After the technical review is complete, request a peer review from a one of [the doc members](https://github.com/orgs/OpenLiberty/teams/docs-members).

    Reviewers should leave comments in the git issue for the doc. Make sure to respond to their comments in the issue and document how the concerns that they raised have been addressed. When the reviewer is satisfied with the draft, they can sign off by commenting their approval in the issue and adding the appropriate label to the Git issue:`technical reviewed` or `peer reviewed`. Make sure to keep the Git "Pipelines" status updated in the issue to reflect the stage of review that the doc is ready for or undergoing.

7. When all the reviews are complete, if your changes are targeted to publish in the next release, create a PR from your branch (_not_ from the `draft` branch) to the `staging` branch. If your changes are not targeted to publish until a later release, do not make the PR to staging until the target release is the next scheduled release. For example, if your updated is targeted for the 20.0.0.10 release, do not create a PR to staging until after the 20.0.0.9 release is published. Edits for grammar and style or for technical issues that are not connected to a specific release should be targeted to publish with the next scheduled release.

   Link the PR to the issue. Request a review of the PR from David Mueller (`dmuelle`), Charlotte Holt (`Charlotte-Holt`) or one of [the doc maintainers](https://github.com/orgs/OpenLiberty/teams/docs-maintainers/members). Work with your reviewer to update the staging nav.adoc file.

   In the PR, provide a link to your post on the [draft site](https://draft-openlibertyio.mybluemix.net/docs/).
   
8. If any changes are requested to the PR, make them in your branch and push them to draft first. Then run the draft site build from Travis CI again to check that they are fine on the draft site. Then open a new PR to staging and request another review.

9. Once the PR to staging is approved and merged, request a build of the [staging openliberty.io site from Travis CI](https://travis-ci.com/github/OpenLiberty/openliberty.io). To trigger a staging build, use the same procedure that you used in step 5 to trigger a draft build.

10. When the build finishes, check to make sure the doc renders correctly on the [staging site](https://staging-openlibertyio.mybluemix.net/docs/). If any changes are needed make sure to add them to the draft branch and review on the draft site before making a new PR to staging.

1. Once you verify the doc, post a link to it on the staging site to the Git issue and change the issue status to `Ready to publish`.  Open a PR from `staging` to `vNext` and Request a review of the PR from David Mueller (`dmuelle`), Charlotte Holt (`Charlotte-Holt`) or one of [the doc maintainers](https://github.com/orgs/OpenLiberty/teams/docs-maintainers/members). Once the PR is approved and merged to `vNext`, the changes will publish with the next scheduled release.


