From: Christopher Munns <munns@meetup.com>
Subject: CONFIG_NF_CONNTRACK_EVENTS stability?
Date: Wed, 05 Dec 2007 17:37:11 -0500
Message-ID: <47572817.6010907@meetup.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I was hoping someone might be able to comment on the stability of
CONFIG_NF_CONNTRACK_EVENTS(in 2.6.22 right now).  I'm trying to set up
conntrackd to aid in stateful failover between firewalls and since it is
still marked as Experimental, I was curious just how experimental it
is.  Has anyone had this under some high load?  100+ concurrent
connections?  Any issues with DNAT?

Thanks,

- Chris Munns
Meetup
