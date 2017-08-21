From: J Doe <general@nativemethods.com>
Subject: Re: "Test" mode for nft ?
Date: Mon, 21 Aug 2017 12:49:25 -0400
Message-ID: <F7E62975-8D1B-436C-94FD-24F72B96FF67@nativemethods.com>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi Jeff,

As far as I know there is not a command line option for nft to parse the syntax to check that it is correct and then NOT apply the ruleset.  I know pf (Mac OS X and OpenBSD), has this and it's quite handy.

The wiki does have documentation for how to debug the rules (testing what rule fires on what packet, etc.), at [1] but doesn't mention syntax checking.

If you are accidentally locking yourself out you could create a cron job that calls "nft rule flush ruleset" to drop the firewall and schedule it to run every few minutes or so.

- J

Sources:
[1] wiki.nftables.org/wiki-nftables/index.php/Ruleset_debug/tracing

