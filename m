From: Robert White <rwhite@pobox.com>
Subject: So close to "recent" support... a modest proposal (or two)
Date: Tue, 7 Feb 2017 09:05:59 +0000
Message-ID: <35f7095a-8e2c-7836-a7e8-2ecafa5d3091@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

So with the "timeout" flag, if we had a "duplicates" flag we'd have full 
support for the old recent rules.

Consider (disregarding any syntax problems) the following, which is a 
semantic translation of one of my iptables rule group:

table ip filter {
  set bad_actors {
   type ipv4_address
   flags timeout
  }
  set recent {
   type ipv4_address . inet_service
   flags duplicates timeout
  }

  chain throttle {
   set update ip saddr timeout 1d drop
   set add ip saddr . dport timeout 1h @recent lt 4 return
   set add ip saddr timeout 1d @bad_actors
   drop
  }

  chain input {
   type filter hook input priority 0; policy accept;
   set update ip saddr timeout 1d @bad_actors drop
   tcp dport ssh jump throttle
  }

}

Explained:

- the update of @bad_actors keeps them locked out till the go away for a day

- the @recent set acts as an event accumulator

- the timeout on @recent entries is the span

So the above approves three tries an hour because of the return, then 
falls through to mark the fourth try in an hour or less puts you in the 
@bad_actor list.

This lets me have my occasional SSH session for maintenance. Doesn't 
punish too soon. And forgives me next-day if I accidentally trip my own 
limit. Botnets and brute-force attacks quickly become irrelevant.


Underlying semantics:

In essence, if sets can hold duplicate entries then they return the 
number of entries that match when used in a numeric context (such as 
less-than or greater than or equal) and implicitly have a "greater-than 
zero" in Boolean contexts.

Each set entry would have it's own separate timeout (a count isn't 
sufficient).

The "add" operation will add a duplicate entry.

The "update" operation will update the timestamp of the newest entry 
only. (This _may_ be a change to existing semantics. The documentation 
on the add and update verbs was a little terse. But better sooner than 
later for this sort of change, if it is one. 8-)

The "update" entry would _not_ add an entry if no entry exists.

ASIDE: We don't seem to have a dynamic delete operation (we probably 
should) but it would best delete _all_ matching entries. Updating the 
timeout to zero or -1 should delete the latest entry.

MAYBE: add and update could take a "copies" number for useful weighting. 
e.g. all entries would have a default of 1 for this value and the return 
value would be the sum of all weights/copies from the list.

Garbage collection semantics would be the same as now. That would add 
some slop to the timeout/recent-count but too much precision there would 
be a huge waste of CPU.

----

Separately:

It would be super useful if sets could (optionally) live in a global 
table or be aliased or otherwise shared between tables.

In particular I'd like to be able to put that @bad_actor set in the 
netdev table at a very negative priority to drop those packets before 
the state tracker and all that. It would cover that whole UNTRACKED 
issue automagically, without add/remove events in the connection tracker.

Syntactically, qualified namespace references like @filter::bad_actor 
would be fine, but I don't know if the underlying system can support 
that sort of cross-table access thing. (pointer locking or whatever 
might be problematic.)

====

Sincerely,
Rob White,
Pushy user... 8-)
