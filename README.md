
# Writing and publishing Docs on OpenLiberty.io 

* [Overview](#Overview)
* [Publishing a new topic](#Publishing-a-new-topic)
* [Updating an existing topic](#Updating-an-existing-topic)
* [Editing the Docs navigation](#Editing-the-docs-navigation)

## Overview

The Open Liberty website is built on the [Antora](https://antora.org/) framework, which provides a structure for publishing and managing versioned documentation. The documentation in the [Open Liberty Docs](https://www.openliberty.io/docs/latest/overview.html) section of the Open Liberty website defaults to the most recent release version. You can view previous release versions by selecting them from the version picker that precedes the sidebar navigation. Each release version is managed from a separate branch.

To write and publish content in Open Liberty Docs, you work with the following branches:
* your personal branch

    For each new doc or edit to an existing doc, create a new branch based on the default `vNext` branch. Name this branch after the GitHub issue that tracks your work. Do all your writing and editing for that issue in this branch. When you're ready for the docs team to review your work, open a pull request from this branch to the `draft` branch. After your content publishes, delete this branch and start a new one for any new work. For more information, see [Publishing a new topic](#Publishing-a-new-topic) and [Updating an existing topic](#Updating-an-existing-topic).
* `draft`

     Deliver new content from your personal branch to `draft` so the Docs team can review it. All content updates stay in this branch until they're targeted to publish in the next release.
* `staging`

    When content is approved for publication targeted for the next scheduled release, push it from your personal branch to the staging branch. The staging branch is the final opportunity to review the content and check that it’s ready to publish. Content stays in the staging branch only for the time it takes to verify it, after which a doc maintainer pushes the entire branch to `vNext`
 * `vNext`
 
    `vNext` is source of each upcoming release. At release time, a cut is taken from this branch to make the release branch, which is then named `vX.0.0.x` according to the release version.

 Each branch is protected and all pull requests require review from a either a [doc member](https://github.com/orgs/OpenLiberty/teams/docs-members) or [doc maintainer](https://github.com/orgs/OpenLiberty/teams/docs-maintainers/members).

## Publishing a new topic
The author of the doc must complete the following steps:
  
1. Clone [the docs repo](https://github.com/OpenLiberty/docs) and create your feature branch off the default `vNext` branch. Include the number of the Git issue for the doc in the name of your branch (for example, `1234-concept-topic`). Do _all_ your writing and editing in this branch.

2. Create your doc by using [Asciidoc](https://asciidoctor.org/docs/asciidoc-syntax-quick-reference/) markup. Use an editor such as [Atom](https://atom.io/) or [VSCode with the Asciidoc plug-in](https://marketplace.visualstudio.com/items?itemName=joaompinto.asciidoctor-vscode).

3. When you finish the initial draft, check that it renders correctly by using the preview function in your editor. Make sure to run [Acrolinx](https://www.acrolinx.com/) to check for grammar and IBM style issues. 

4. Push the file to GitHub, then create a pull request (PR) into the `draft` branch. Link the PR to the issue you created in Step 1. Request a review of the PR from David Mueller (`dmuelle`), Charlotte Holt (`Charlotte-Holt`) or one of [the doc members](https://github.com/orgs/OpenLiberty/teams/docs-members). Notify your reviewer that the doc is a new topic that needs to be added to the draft navigation. They can work with you to determine the best section of the navigation for your topic and [to update the nav.adoc file]((#Editing-the-docs-navigation)).


5. Request a build of the [draft openliberty.io site](https://draft-openlibertyio.mybluemix.net/docs/):
    1. Sign in to [Travis CI](https://travis-ci.com/github/OpenLiberty/openliberty.io) with your GitHub account.
    2. Click **More Options > Trigger Build**. Make sure the `draft` branch is selected, then click **Trigger custom build**. The draft site build starts running.
            

6. When the build finishes, check that the doc looks right on the [draft site](https://draft-openlibertyio.mybluemix.net/docs/). Post a link to your draft in the Git issue for the doc.

    If you see any problems, first resolve them in your branch and create another PR into `draft` branch (link the PR to the issue again). Then, run the [draft site build from Travis CI](https://travis-ci.com/github/OpenLiberty/openliberty.io) again.

7. Submit your doc for technical, strategist, peer, and editorial reviews. 

   Reviewers can leave comments in the Git issue for the doc. Make sure to respond to their comments in the issue and document how you fixed the concerns that they raised. When the reviewer is satisfied with the draft, they can sign off by commenting their approval and adding the appropriate label to the Git issue:`technical reviewed`, `peer reviewed`, `strategist reviewed`, or `editorial reviewed`. Make sure to keep the Git Pipelines status updated in the issue to the stage of review that the doc is ready for or undergoing.

   _If the doc is a task_, it must be tested so that the steps are verified. Add the `requires doc testing` label to the issue. Coordinate testing with the technical reviewer and ask the tester to comment their approval in the issue and add the `doc tested` label after they verify the steps.

8. When all the reviews are complete, if your doc is targeted to publish in the next release, create a PR from your branch (_not_ from the `draft` branch) to the `staging` branch. 

    If your doc isn’t targeted to publish until a later release, don’t make the PR to staging until the target release is the next scheduled release. For example, if your doc is targeted for the 20.0.0.10 release, don’t create a PR to staging until after the 20.0.0.9 release publishes.

    Link the PR to the issue. Request a review of the PR from David Mueller (`dmuelle`), Charlotte Holt (`Charlotte-Holt`) or one of [the doc maintainers](https://github.com/orgs/OpenLiberty/teams/docs-maintainers/members). Work with your reviewer to update the staging nav.adoc file.

    In the PR, provide a link to your post on the [draft site](https://draft-openlibertyio.mybluemix.net/docs/).
   
9. If any changes are requested to the PR, make them in your branch and push them to draft first. Then, run the draft site build from Travis CI again to check that the changes look right on the draft site. Open a new PR to staging and request another review.

10. After the PR to staging is approved and merged, request a build of the [staging openliberty.io site from Travis CI](https://travis-ci.com/github/OpenLiberty/openliberty.io). 
    1. Click **More Options > Trigger Build**. Make sure the `staging` branch is selected, then click **Trigger custom build**. The staging site build starts running.

11. When the build finishes, check to make sure the doc renders correctly on the [staging site](https://staging-openlibertyio.mybluemix.net/docs/). If any changes are needed make sure to add them to the draft branch and review on the draft site before you make a new PR to staging.

12. After you verify the doc, post a link to it on the staging site to the Git issue and change the issue status to `Ready to publish`.  Open a PR from `staging` to `vNext` and Request a review of the PR from David Mueller (`dmuelle`), Charlotte Holt (`Charlotte-Holt`) or one of [the doc maintainers](https://github.com/orgs/OpenLiberty/teams/docs-maintainers/members). After the PR is approved and merged to `vNext`, the doc will publish with the next scheduled release.

## Updating an existing topic
All edits and updates to existing Open Liberty Docs must be documented and tracked in a GitHub issue in [the Open Liberty docs repo](https://github.com/OpenLiberty/docs). To update an existing topic, complete the following steps:

1. Clone [the docs repo](https://github.com/OpenLiberty/docs) and create your feature branch off the default `vNext` branch. Include the number of the Git issue for the doc in the name of your branch (for example, `1234-concept-topic`). Do _all_ your writing and editing in this branch.

2. Make the necessary edits to the doc or docs that are detailed in your GitHub issue. Check that the content looks right by using the preview function in your editor. Make sure to run [Acrolinx](https://www.acrolinx.com/) to check for grammar and IBM style issues.

3. Push the file to GitHub, then create a PR into the `draft` branch. Link the PR to the issue you created in Step 1. Request a review of the PR from David Mueller (`dmuelle`), Charlotte Holt (`Charlotte-Holt`) or one of [the doc members](https://github.com/orgs/OpenLiberty/teams/docs-members). Notify your reviewer if any changes to the navigation are required. They can work with you to [update the nav.adoc file]((#Editing-the-docs-navigation)).

4. Request a build of the [draft openliberty.io site](https://draft-openlibertyio.mybluemix.net/docs/):
    1. Sign in to [Travis CI](https://travis-ci.com/github/OpenLiberty/openliberty.io) with your GitHub account.
    2. Click **More Options > Trigger Build**. Make sure the `draft` branch is selected, then click **Trigger custom build**. The draft site build starts running.            

5. When the build finishes, check that the doc renders correctly on the [draft site](https://draft-openlibertyio.mybluemix.net/docs/). Post a link to your draft in the Git issue for the doc.

    If you see any problems, first resolve them in your branch. Create another PR into the `draft` branch (link the PR to the issue again), then run the [draft site build from Travis CI](https://travis-ci.com/github/OpenLiberty/openliberty.io) again. 

6. Request a review of your doc

    If your changes just fix a typographical error or other minor grammar or style issues, request a peer review from a one of [the doc members](https://github.com/orgs/OpenLiberty/teams/docs-members).

    If you make updates or additions to technical information, request a technical review from the appropriate SME. If you edit a task and the steps substantially change, the doc must be tested. Add the `requires doc testing` label to the issue. Coordinate testing with the technical reviewer and ask the tester to comment their approval in the issue and add the `doc tested` label when they verify the steps. After the technical review is complete, request a peer review from a one of [the doc members](https://github.com/orgs/OpenLiberty/teams/docs-members).

    Reviewers can leave comments in the Git issue for the doc. Make sure to respond to their comments in the issue and document how you fixed the concerns that they raised. When the reviewer is satisfied with the draft, they can sign off by commenting their approval in the issue and adding the appropriate label to the Git issue:`technical reviewed` or `peer reviewed`. Make sure to keep the Git Pipelines status updated in the issue to the stage of review that the doc is ready for or undergoing.

7. When all the reviews are complete, if your changes are targeted to publish in the next release, create a PR from your branch (_not_ from the `draft` branch) to the `staging` branch. If your changes aren’t targeted to publish until a later release, don’t make the PR to staging until the target release is the next scheduled release. For example, if your update is targeted for the 20.0.0.10 release, don’t create a PR to staging until after the 20.0.0.9 release is published. Edits for grammar and style or for technical issues that aren’t connected to a specific release can be targeted to publish with the next scheduled release.

   Link the PR to the issue. Request a review of the PR from David Mueller (`dmuelle`), Charlotte Holt (`Charlotte-Holt`) or one of [the doc maintainers](https://github.com/orgs/OpenLiberty/teams/docs-maintainers/members). Work with your reviewer to update the staging nav.adoc file.

   In the PR, provide a link to your update on the [draft site](https://draft-openlibertyio.mybluemix.net/docs/).
   
8. If any changes are requested to the PR, make them in your branch and push them to draft first. Then, run the draft site build from Travis CI again to check that they look right on the draft site. Open a new PR to staging and request another review.

9. After the PR to staging is approved and merged, request a build of the [staging openliberty.io site from Travis CI](https://travis-ci.com/github/OpenLiberty/openliberty.io). 
    1. Click **More Options > Trigger Build**. Make sure the `staging` branch is selected, then click **Trigger custom build**. The staging site build starts running.

10. When the build finishes, check to make sure the doc renders correctly on the [staging site](https://staging-openlibertyio.mybluemix.net/docs/). If any changes are needed make sure to add them to the draft branch and review on the draft site before you make a new PR to staging.

11. After you verify the doc, post a link to it on the staging site to the Git issue and change the issue status to `Ready to publish`.  Open a PR from `staging` to `vNext` and Request a review of the PR from David Mueller (`dmuelle`), Charlotte Holt (`Charlotte-Holt`) or one of [the doc maintainers](https://github.com/orgs/OpenLiberty/teams/docs-maintainers/members). After the PR is approved and merged to `vNext`, the changes publish with the next scheduled release.


## Editing the Docs navigation


_If you’re unsure of how to update the Open Liberty navigation or unfamiliar with the Antora navigation schema, work with a [doc maintainer](https://github.com/orgs/OpenLiberty/teams/docs-maintainers/members) to plan and commit your update._

[Site navigation in the Antora framework](https://docs.antora.org/antora/2.3/navigation/files-and-lists/) is controlled by a `nav.adoc` file. The Open Liberty Docs navigation is split between two `nav.adoc` files, one for the main Docs content and one for the reference topics. The content of each of these files is an [unordered Asciidoc list](https://docs.antora.org/antora/2.3/navigation/files-and-lists/#list-structure), which determines the order and hierarchy of the navigation entries. 

Since the Open Liberty [draft](https://draft-openlibertyio.mybluemix.net/), [staging](https://staging-openlibertyio.mybluemix.net/) and [production](https://www.openliberty.io/) sites each maintain unique navigation files, you must update them individually, otherwise, unwanted changes and merge conflicts can occur.

The `draft` and `staging` branches each have a dedicated branch for editing the navigation. For the draft branch, this branch is called `draft-nav` and for the staging branch it’s called `staging-nav`. When you’re working in these branches, edit only the `nav.adoc` file and open pull requests only to the branch for which they are specified: `draft` for `draft-nav` and `staging` for `staging-nav`. The production navigation is automatically updated from `vNext` with each release. _You should never directly update the nav.adoc file in the `vNext` branch_. This file, along with everything else in `vNext` branch, is only updated through PRs from the `staging` branch.

To add an item to the navigation or to edit an existing item, complete the following steps:

1. Pull down the `draft-nav` branch and open the `nav.adoc` file for the section of the navigation where you want you to add an entry. 

    The `nav.adoc` file for the main Docs content is kept in [the ROOT module](https://github.com/OpenLiberty/docs/tree/vNext/modules/ROOT) and the `nav.adoc` file for the reference content is kept in [the reference module](https://github.com/OpenLiberty/docs/tree/vNext/modules/reference).

2. Add a properly formed [Antora page reference](https://docs.antora.org/antora/2.3/navigation/xrefs-and-link-text/) to the section of the navigation list where you want your entry to appear. If you’re editing an existing item, make sure your changes use the proper syntax for an Antora page reference.

3. Open a pull request from the `draft-nav` branch to the `draft` branch and request a review from a [doc maintainer](https://github.com/orgs/OpenLiberty/teams/docs-maintainers/members).

4. After the PR is approved and merged, request a build of the [draft openliberty.io site](https://draft-openlibertyio.mybluemix.net/docs/). For build instructions, see step 5 of [Publishing a new topic](#Publishing-a-new-topic).

5. After you review and verify your navigation updates on the draft site, add your changes to staging.

    _Don’t open a PR from `draft-nav` to `staging`_. Since `draft` and `staging` have separate navigation files with different content, you must re-create your changes on the `staging-nav` branch and PR that branch to `staging`. Follow the same process that you used in steps 1 - 4, but instead of working in the`draft-nav` and `draft` branches, make your changes in `staging-nav` and PR them to `staging`.

6. After your PR to staging is reviewed, approved, and merged, request a build of the staging site. For build instructions, see step 5 of [Publishing a new topic](#Publishing-a-new-topic).

7. After you verify your changes on the [staging site](https://staging-openlibertyio.mybluemix.net/docs/), ask a docs maintainer to open a PR from `staging` to `vNext`. Your updates can publish with the next scheduled release.
    





