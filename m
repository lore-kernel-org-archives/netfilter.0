From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: CONFIG_NF_CONNTRACK_EVENTS stability?
Date: Thu, 13 Dec 2007 01:31:02 +0100
Message-ID: <47607D46.4040304@netfilter.org>
References: <47572817.6010907@meetup.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47572817.6010907@meetup.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christopher Munns <munns@meetup.com>
Cc: netfilter@vger.kernel.org, Netfilter-failover list <netfilter-failover@lists.netfilter.org>

Christopher Munns wrote:
> I was hoping someone might be able to comment on the stability of
> CONFIG_NF_CONNTRACK_EVENTS(in 2.6.22 right now).  I'm trying to set up
> conntrackd to aid in stateful failover between firewalls and since it is
> still marked as Experimental, I was curious just how experimental it
> is.  Has anyone had this under some high load?  100+ concurrent
> connections?  Any issues with DNAT?

No, issues. Give it a try. BTW, better post this sort of questions to
netfilter-failover. In my testbed [1] I have reached up to 2500 HTTP GET
requests/s. The firewalls are two Dual core AMD Opteron 2200 GHz with
1GBit Ethernets. Note that this is the maximum amount of connections
that I could generate with only one client.

[1] http://people.netfilter.org/pablo/conntrack-tools/testcase.html

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
