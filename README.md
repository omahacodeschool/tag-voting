# Theatre Arts Guild - Awards Manager

Team:

- [Steven Thiesfeld](http://github.com/StevenThiesfeld)
- [Ruthie Peters](http://github.com/ruthiep)
- [Beth Stranz](http://github.com/beth-str)
- [Luke Korth](http://github.com/lgklgklgk)

---

The Theatre Arts Guild (TAG) gives awards to actors, directors, and tech crew members for theatrical productions in Omaha. In the past they have done nominations and voting with paper ballots, but would like to switch to electronic ballots.

Historically, this is how the process has worked:

In May, nomination ballots are mailed to each TAG member, who then nominates up to five nominees for each awards category (by writing in their nominations). On these ballots, TAG members also indicate which theatrical products they attended in the past year. These ballots then get sent back (via mail or by scanning and emailing).

Nomination ballots get tallied by an accountant. The top 5 vote getters (after ballots are weighted -- people who attend more shows have weightier votes) for each category then become the official nominees.

In June, actual awards ballots are sent out by mail -- each category has the list of five nominees, and TAG members vote for one nominee from each category. The vote-caster also indicates which shows they attended. This ballot then gets mailed back or scanned and emailed back.

The awards ballots are tallied (after weighting to account for how many shows the vote-caster attended), and the top vote getter for each category then wins the award.

In addition to the process indicated above, TAG assigns each member a secret ID # (which is listed on the ballot in lieu of other identifying information), which is known only to the keymaster. This ensures that a proper paper trail exists if it becomes necessary to investigate wrongdoing while also ensuring voter anonymity.

## Challenges With Existing Methods

- Low response rates: Typically, only 30% of TAG members who receive a ballot (either for nominations or for awards) submit their nomination or votes.
- It’s tedious: Even with the low response rates, it’s tedious to count all of the votes, and it’s easy to make mistakes. TAG enlists the help of accountants to ensure accurate and truthful vote counting, but even then this process is time-consuming.
- It’s expensive: Ballots are mailed, meaning that postage is a concern.
- Duplication of Information: TAG members have to indicate on both ballots which shows they attended this past year, which results in duplication of information.

## Automation and So On

The most pressing concern (of the ones listed above) is the collection of votes and nominations (TAG is interested in also automating the tallying process, but wish to keep that process primarily human-controlled for now).

Here is the new desired workflow:

### Voting Period Setup

- An administrator updates the list of shows from the previous year.
- An administrator adds the email addresses of TAG members that are not yet in the system.
- An administrator removes from the system any users who are no longer TAG members.

### Nominations

- Once it is time for nominations to go out, an administrator sends a link to the nomination form to each member. The link uses a unique token, so the user doesn't have to log in to view their ballot.
- Each TAG member clicks the unique permalink in the email they received and fills out their nominations. They also indicate which shows the went to.
- Administrators can view each ballot as well as the number of shows the member submitting that ballot attended. (When they view a ballot, they can only see the secret ID of the voter -- not the voter's identifying information.)
- Administrators then hand-compile the list of award nominees from the nominations and create that list in a ballot-builder (not related to this project).

### Final Voting

- Administrators send out the final awards ballot to all TAG members, who then vote online. Administrators should be able to view anonymized individual ballots as well as aggregate ballot reports.
- An administrator tallies the votes by hand.
- Everyone has a fancy gala (this is not a feature of the software).

This is almost exactly the same as the existing workflow, except that ballots are sent out via email (or, rather, links to ballots are sent out via email) and filled out electronically.

This project deals only with the **Voting Period Setup** and **Nominations** sections from above. "Final Voting" is not in-scope.

Given this scope, here are features that will be necessary:

- Administrators should be able to open and close the voting period.
- Administrators should be able to add and remove TAG members from the roster, as well as edit their information.
- Administrators should be able to re-send the ballot link to any member who has requested it.
- Administrators should be able to add shows to the year’s list of shows.
- Administrators should be able to start a new year worth of shows (and nominations, and awards). (This is basically another way to describe the first 'should' case in this list.)
- Administrators should be able to view all ballots in a conveniently organized format.
- TAG members should be able to view and submit their secret ballot.

Here are some possible features which might be useful and which are supplement core functionality of the application:

- TAG members should be able to update their contact information.
- Administrators should be able to export the contact information of all members as a spreadsheet (suitable for mail-merge, etc).
- Members should be able to view their own ballots (at any time) and edit their ballots within the voting period. This would allow for a user to partially complete a ballot and then return to it later.
- Administrators should be able to export all ballots in a convenient format (spreadsheet?)
- TAG members should be able to update their list of shows attended as the year progresses, or at least should be able to submit such a list once (instead of once for each ballot -- the second time they cast a ballot, they would simply confirm or modify the pre-existing list instead of rebuilding it from scratch).
- Even though the nomination and vote-counting process will still be human-controlled, mechanical verification is useful.
- The voting ballots should work equally well on both conventional computer screens and on mobile devices.
- TAG members who prefer paper ballots could print out the ballots (from the link) as a well-formatted PDF, which they could then print and mail in. Since TAG members would be responsible for making this decision, their anonymity would not be compromised. This paper ballot should still have the secret ID number.

These features are **not** part of this project's scope at this time.

# Development Plan

There are a few moving parts here, so consder the following milestones:

1. Admin-level CRUD operations
2. User-facing prototype
3. Deployment to Staging
4. Front-end design
5. Deployment to Production
  
## Admin-level CRUD operations

We're going to start by making this application as fully functional in the _command line_ as possible. A typical user can't -- for example -- add a new show, but that should be possible. ActiveRecord helps us out there. A better example: A typical user shouldn't be able to close a voting period, but there needs to be a method that does precisely that (and nothing else!).

Once these functions are built and work as expected on the command line, we'll use a tool like Rails Admin or ActiveAdmin to quickly set up a web UI for them. This will be a restricted area for _us_ (so that when the client says something isn't working, we can fix it without having to use `rails console` on Production).

## User-facing prototype

With the internal API built (That's basically what the previous milestone achieved), we can get to work on setting up controllers for the user-facing side of the application.

The first step is to map out the views we'll need. Then categorize them into controllers and make barebones routes and views to connect the pieces.

At this point, the application works but looks boring.

## Deployment to Staging

Let's get it out there! Just for us to test on Heroku though. This is "Staging" -- a hardware and software mirror of what Production will be, but not exposed to the public.

This lets us handle deployment bugs in a true representation of a deployed environment without having to worry about contaminating real data or accidentally sending unprofessional messages to real users.

## Front-end design

"Bootstrap it". We don't have to use Twitter's Bootstrap CSS framework, but we'll implement an attractive UI for the application using _some_ CSS framework. Maybe the one GitHub just launched?

We'll also add our own styles using an object-oriented CSS approach.

## Deployment to Production

If it works on Staging, it should work on Production. Deploy. Rejoice.