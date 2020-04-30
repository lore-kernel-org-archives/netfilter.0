From: trentbuck@gmail.com (Trent W. Buck)
Subject: idempotent nft delete table? (or: why does "flush table" delete rules but keep chains?)
Date: Thu, 30 Apr 2020 14:26:19 +1000
Message-ID: <87368l38gk.fsf@goll.lan>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

A typical ruleset looks like

    flush ruleset
    table filter { ... }

That works fine until I have several partial rulesets (e.g. the
sysadmin, libvirtd, and sshguard) that manage their own tables in
parallel, e.g.

    foo.nft:
        flush ruleset
        table foo { ... }

    bar.nft:
        flush ruleset
        table bar { ... }

If I reload either file, both tables are removed, and only one table is
readded.

The obvious thing to try is this:

        flush table foo
        table foo { ... }

However this doesn't flush the chains, only the rules.
So if you make an edit like this:

         flush table foo
         table x {
       -   chain y {
       +   chain z {
             type filter hook input priority filter; policy drop
             tcp dport ssh accept
             }
         }

What you end up with is a ruleset that looks like this:

       table x {
           chain y {
               type filter hook input priority filter; policy drop;
           }
           chain z {
               type filter hook input priority filter; policy drop;
               tcp dport ssh accept
           }
       }

...and your SSH stops working.

I also considered this, but it will error out if the table doesn't exist yet:

        flush table foo
        table foo { ... }

I suppose I could use add table (which is idempotent) and then delete
table (which isn't), so ending up with

        table foo
        flush table foo
        table foo { ... }

Is this sensible?  Have I missed something obvious?

PS: I think the way normal people handle this is with a middleware layer
like firewalld (Fedora) or ufw (Ubuntu), but those are a bit too
heavyweight for my taste.

