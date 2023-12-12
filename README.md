
# Writing and publishing Docs on OpenLiberty.io

* [Overview](#overview)
* [Publishing a new topic](#publishing-a-new-topic)
* [Updating an existing topic](#updating-an-existing-topic)
* [Editing the Docs navigation](#editing-the-docs-navigation)

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

 The `staging` and `vNext` branches are protected and all pull requests to those branches require review from a either a [doc member](https://github.com/orgs/OpenLiberty/teams/docs-members) or [doc maintainer](https://github.com/orgs/OpenLiberty/teams/docs-maintainers/members). The Open Liberty docs are typically published every 4 weeks. If you want to publish doc updates with the next Open Liberty docs release, your doc updates must be merged to the `vNext` branch at least 3 business days before the Open Liberty docs release. For example, if the Open Liberty docs release is on Tuesday, , then you must complete your doc updates and merge them to the `vNext` branch by the previous Thursday. Only [doc maintainers](https://github.com/orgs/OpenLiberty/teams/docs-maintainers/members) can merge pull requests to the `vNext` branch. The following sections provide further information about making doc updates and merging to the `vNext` branch.  

 \
Prior to publishing on the production site, Open Liberty content is reviewed on our draft and staging sites. We provide docs-only versions of both of these sites, which build faster than the full draft and staging sites, so that content updates are available for review sooner.  

The following sites are available to review and publish docs content:
* [full draft site](https://draft-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/)
     Contains all draft content (`draft` branches) of the site  

* [docs-draft site](https://docs-draft-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/)
     Contains only the docs portion of the draft content (`draft` branch) of the site  

* [full staging site](https://staging-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/)
     Contains all staging content (`staging` branches) of the site    

* [docs-staging site](https://docs-staging-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/)
     Contains only the docs portion of the staging content (`staging` branch) of the site  

* [production site](https://openliberty.io)
     Contains all production content (`prod` branch) of the site

For a full breakdown of what branches and repos are used for each site, see the [table breakdown](https://github.com/OpenLiberty/openliberty.io/wiki/Websites-&-branch-breakdown).

## Publishing a new topic
The author of the doc must complete the following steps:

1. Clone [the docs repo](https://github.com/OpenLiberty/docs) and create your feature branch off the default `vNext` branch. Include the number of the Git issue for the doc in the name of your branch (for example, `1234-concept-topic`). Do _all_ your writing and editing in this branch.

2. Create your doc by using [Asciidoc](https://asciidoctor.org/docs/asciidoc-syntax-quick-reference/) markup. Use an editor such as [Atom](https://atom.io/) or [VSCode with the Asciidoc plug-in](https://marketplace.visualstudio.com/items?itemName=joaompinto.asciidoctor-vscode).

3. When you finish the initial draft, check that it renders correctly by using the preview function in your editor. Make sure to run [Acrolinx](https://www.acrolinx.com/) to check for grammar and IBM style issues.

4. Push the file to GitHub, then create a pull request (PR) into the `draft` branch. Link the PR to the issue you created in Step 1. Request a review of the PR from David Mueller (`dmuelle`) or one of [the doc members](https://github.com/orgs/OpenLiberty/teams/docs-members). Notify your reviewer that the doc is a new topic that needs to be added to the draft navigation. They can work with you to determine the best section of the navigation for your topic and [to update the nav.adoc file]((#Editing-the-docs-navigation)).

5. All the builds and deployments of non-prod sites have been moved to IBM Cloud and now build automatically whenever the a PR is merged into their respective branch. These builds are private and, therefore, their detailed build/deploy progress can't be tracked. However, if you have access to the [Slack channel for draft site](https://app.slack.com/client/T15GKHBT4/C01G7L68KAP) or the [Slack channel for staging site](https://app.slack.com/client/T15GKHBT4/C01GX9P8YP2), you can at least track when the builds start and finish.

6. When the build is finished, check that the doc looks correct on either the [docs-draft site](https://docs-draft-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/) or the [full draft site](https://draft-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/).

   In addition to the existing [full draft site](https://draft-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/) we have a [docs-draft site](https://docs-draft-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/), which contains only the docs content, allowing it to build and deploy much quicker. However, since this site contains only the doc content, any links to other parts of openliberty.io will not resolve. In general, use the doc-draft site to review content because it updates much quicker than the full site. However, if you need to review content that links to pages on openliberty.io that are not in the docs, use the full draft site.

   If you see any problems, such as formatting issues or typos, resolve them first in your branch. Then, create another PR into `draft` branch, link the PR to the issue again,  and get the PR merged. Wait for IBM Cloud to rebuild [docs-draft site](https://docs-draft-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/) or [full draft site](https://draft-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/) and verify the change.

7. Submit your doc for technical, strategist, peer, and editorial reviews.

   Reviewers can leave comments in the Git issue for the doc. Make sure to respond to their comments in the issue and document how you fixed the concerns that they raised. When the reviewer is satisfied with the draft, they can sign off by commenting their approval and adding the appropriate label to the Git issue:`technical reviewed`, `peer reviewed`, `strategist reviewed`, or `editorial reviewed`. Make sure to keep the Git Pipelines status updated in the issue to the stage of review that the doc is ready for or undergoing.

   _If the doc is a task_, it must be tested so that the steps are verified. Add the `requires doc testing` label to the issue. Coordinate testing with the technical reviewer and ask the tester to comment their approval in the issue and add the `doc tested` label after they verify the steps.

8. When all the reviews are complete, if your doc is targeted to publish in the next release, create a PR from your branch (_not_ from the `draft` branch) to the `staging` branch.

    If your doc isn’t targeted to publish until a later release, don’t make the PR to staging until the target release is the next scheduled release. For example, if your doc is targeted for the 20.0.0.10 release, don’t create a PR to staging until after the 20.0.0.9 release publishes.

    Link the PR to the issue. Request a review of the PR from David Mueller (`dmuelle`) or one of [the doc maintainers](https://github.com/orgs/OpenLiberty/teams/docs-maintainers/members). Work with your reviewer to update the staging nav.adoc file.

    In the PR, provide a link to your post on the [full draft site](https://draft-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/) or [docs-draft site](https://docs-draft-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/).

9. If any changes are requested to the PR, make them in your branch and push them to `draft` branch first. Once the site rebuilds, check that everything is correct on the [docs-draft site](https://docs-draft-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/) or [full draft site](https://draft-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/).

10. After the PR to `staging` is approved and merged, IBM Cloud automatically rebuilds the [docs-staging site](https://docs-staging-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/) and [full staging site](https://staging-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs//). If you have access, you can track the progress in the [Slack channel](https://app.slack.com/client/T15GKHBT4/C01GX9P8YP2).

11. When the build finishes, check to make sure the doc renders correctly on the [docs-staging site](https://docs-staging-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/) or [full staging site](https://staging-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/). If any changes are needed, make sure to add them to the `draft` branch and review on the [full draft site](https://draft-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/) or [docs-draft site](https://docs-draft-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/) before you make a new PR to `staging`.

12. After you verify the doc, post a link to it on one of the staging sites in the Git issue and change the issue status to `Ready to publish`.  Open a PR from `staging` to `vNext`, add the issue number to the comment section of the PR (#issue_number), and request a review of the PR from David Mueller (`dmuelle`) or one of [the doc maintainers](https://github.com/orgs/OpenLiberty/teams/docs-maintainers/members). After the PR is approved and merged to `vNext`, the doc will publish with the next scheduled release.

## Updating an existing topic
All edits and updates to existing Open Liberty Docs must be documented and tracked in a GitHub issue in [the Open Liberty docs repo](https://github.com/OpenLiberty/docs). To update an existing topic, complete the following steps:

1. Clone [the docs repo](https://github.com/OpenLiberty/docs) and create your feature branch off the default `vNext` branch. Include the number of the Git issue for the doc in the name of your branch (for example, `1234-concept-topic`). Do _all_ your writing and editing in this branch.

2. Make the necessary edits to the doc or docs that are detailed in your GitHub issue. Check that the content looks right by using the preview function in your editor. Make sure to run [Acrolinx](https://www.acrolinx.com/) to check for grammar and IBM style issues.

3. Push the file to GitHub, then create a PR into the `draft` branch. Link the PR to the issue you created in Step 1. Request a review of the PR from David Mueller (`dmuelle`) or one of [the doc members](https://github.com/orgs/OpenLiberty/teams/docs-members). Notify your reviewer if any changes to the navigation are required. They can work with you to [update the nav.adoc file]((#Editing-the-docs-navigation)).

4. After the PR is merged, wait for IBM Cloud to rebuild the [docs-draft site](https://docs-draft-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/) or [full draft site](https://draft-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/) and verify the changes. If you have access to [this Slack channel](https://app.slack.com/client/T15GKHBT4/C01G7L68KAP), you can use it to track build/deploy progress.

   If you see any problems, make any changes in your personal branch first, then push to the `draft` branch again and verify the changes after rebuild.

6. Request a review of your doc

    If your changes just fix a typographical error or other minor grammar or style issues, request a peer review from a one of [the doc members](https://github.com/orgs/OpenLiberty/teams/docs-members).

    If you make updates or additions to technical information, request a technical review from the appropriate SME. If you edit a task and the steps substantially change, the doc must be tested. Add the `requires doc testing` label to the issue. Coordinate testing with the technical reviewer and ask the tester to comment their approval in the issue and add the `doc tested` label when they verify the steps. After the technical review is complete, request a peer review from a one of [the doc members](https://github.com/orgs/OpenLiberty/teams/docs-members).

    Reviewers can leave comments in the Git issue for the doc. Make sure to respond to their comments in the issue and document how you fixed the concerns that they raised. When the reviewer is satisfied with the draft, they can sign off by commenting their approval in the issue and adding the appropriate label to the Git issue:`technical reviewed` or `peer reviewed`. Make sure to keep the Git Pipelines status updated in the issue to the stage of review that the doc is ready for or undergoing.

7. When all the reviews are complete, if your changes are targeted to publish in the next release, create a PR from your branch (_not_ from the `draft` branch) to the `staging` branch. If your changes aren’t targeted to publish until a later release, don’t make the PR to `staging` until the target release is the next scheduled release. For example, if your update is targeted for the 20.0.0.10 release, don’t create a PR to staging until after the 20.0.0.9 release is published. Edits for grammar and style or for technical issues that aren’t connected to a specific release can be targeted to publish with the next scheduled release.

   Link the PR to the issue. Request a review of the PR from David Mueller (`dmuelle`) or one of [the doc maintainers](https://github.com/orgs/OpenLiberty/teams/docs-maintainers/members). Work with your reviewer to update the staging nav.adoc file.

   In the PR, provide a link to your update on the [docs-draft site](https://docs-draft-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/) or [full draft site](https://draft-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/).

8. If any changes are requested to the PR, make them in your personal branch and push them to `draft` first. After the PR is merged, wait for IBM Cloud to rebuild the [docs-draft site](https://docs-draft-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/) or [full draft site](https://draft-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/) and verify the changes.  If you have access to [this Slack channel](https://app.slack.com/client/T15GKHBT4/C01G7L68KAP), you can use it to track build/deploy progress.

9. After the PR to `staging` is approved and merged, IBM Cloud will automatically rebuild the [docs-staging site](https://docs-staging-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/) and [full staging site](https://staging-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/). If you have access, you can track the progress in the [Slack channel](https://app.slack.com/client/T15GKHBT4/C01GX9P8YP2).

10. When the build finishes, check to make sure the doc renders correctly on the [docs-staging site](https://docs-staging-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/) or [full staging site](https://staging-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/). If any changes are needed, make sure to add them to the `draft` branch and review on the [full draft site](https://draft-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/) or [docs-draft site](https://docs-draft-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/) before you make a new PR to `staging`.

11. After you verify the doc, post a link to it on one of the staging sites in the Git issue and change the issue status to `Ready to publish`.  Open a PR from `staging` to `vNext`, add the issue number to the comment section of the PR (#issue_number), and Request a review of the PR from David Mueller (`dmuelle`) or one of [the doc maintainers](https://github.com/orgs/OpenLiberty/teams/docs-maintainers/members). After the PR is approved and merged to `vNext`, the changes publish with the next scheduled release.


## Editing the Docs navigation


_If you’re unsure of how to update the Open Liberty navigation or unfamiliar with the Antora navigation schema, work with a [doc maintainer](https://github.com/orgs/OpenLiberty/teams/docs-maintainers/members) to plan and commit your update._

[Site navigation in the Antora framework](https://docs.antora.org/antora/2.3/navigation/files-and-lists/) is controlled by a `nav.adoc` file. The Open Liberty Docs navigation is split between two `nav.adoc` files, one for the main Docs content and one for the reference topics. The content of each of these files is an [unordered Asciidoc list](https://docs.antora.org/antora/2.3/navigation/files-and-lists/#list-structure), which determines the order and hierarchy of the navigation entries.

Since the Open Liberty [draft](https://draft-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/), [staging](https://staging-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/) and [production](https://www.openliberty.io/) sites each maintain unique navigation files, you must update them individually, otherwise, unwanted changes and merge conflicts can occur.

The `draft` and `staging` branches each have a dedicated branch for editing the navigation. For the draft branch, this branch is called `draft-nav` and for the staging branch it’s called `staging-nav`. When you’re working in these branches, edit only the `nav.adoc` file and open pull requests only to the branch for which they are specified: `draft` for `draft-nav` and `staging` for `staging-nav`. The production navigation is automatically updated from `vNext` with each release. _You should never directly update the nav.adoc file in the `vNext` branch_. This file, along with everything else in `vNext` branch, is only updated through PRs from the `staging` branch.

To add an item to the navigation or to edit an existing item, complete the following steps:

1. Pull down the `draft-nav` branch and open the `nav.adoc` file for the section of the navigation where you want you to add an entry.

    The `nav.adoc` file for the main Docs content is kept in [the ROOT module](https://github.com/OpenLiberty/docs/tree/vNext/modules/ROOT) and the `nav.adoc` file for the reference content is kept in [the reference module](https://github.com/OpenLiberty/docs/tree/vNext/modules/reference).

2. Add a properly formed [Antora page reference](https://docs.antora.org/antora/2.3/navigation/xrefs-and-link-text/) to the section of the navigation list where you want your entry to appear. If you’re editing an existing item, make sure your changes use the proper syntax for an Antora page reference.

3. Open a pull request from the `draft-nav` branch to the `draft` branch and request a review from a [doc maintainer](https://github.com/orgs/OpenLiberty/teams/docs-maintainers/members).

4. After the PR is merged, wait for IBM Cloud to rebuild the [docs-draft site](https://docs-draft-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/) or [full draft site](https://draft-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/) and verify the changes. If you have access to [this Slack channel](https://app.slack.com/client/T15GKHBT4/C01G7L68KAP), you can use it to track build/deploy progress.

5. After you review and verify your navigation updates on one of the draft sites, and if everything looks correct, create a PR to the `staging` branch.

    _Don’t open a PR from `draft-nav` to `staging`_. Since `draft` and `staging` have separate navigation files with different content, you must re-create your changes on the `staging-nav` branch and PR that branch to `staging`. Follow the same process that you used in steps 1 - 4, but instead of working in the`draft-nav` and `draft` branches, make your changes in `staging-nav` and PR them to `staging`.

6. After the PR to `staging` is reviewed, approved and merged, IBM Cloud will automatically rebuild the [docs-staging site](https://docs-staging-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/) and [full staging site](https://staging-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/). If you have access, you can track the progress in the [Slack channel](https://app.slack.com/client/T15GKHBT4/C01GX9P8YP2).

7. After you verify your changes on [docs-staging site](https://docs-staging-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/) or [full staging site](https://staging-openlibertyio.mqj6zf7jocq.us-south.codeengine.appdomain.cloud/docs/), ask a docs maintainer to open a PR from `staging` to `vNext`. Your updates can publish with the next scheduled release.
