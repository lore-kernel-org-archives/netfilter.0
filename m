From: Aldo Lagana <ALagana@p21.com>
Subject: RE: Poll on large sites that deploy Iptables.
Date: Thu, 3 Jun 2004 12:59:27 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0776B9DA384FFB4C94A6B73F7DC87A6003F35CC8@newman.p21.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Brett Simpson' <simpsonb@hillsboroughcounty.org>, netfilter@lists.netfilter.org

First off - like AOL, IBM, etc - all use high-end probably cisco routers
which do their firewalling - one cannot get the packet per second throughput
they need without dedicated ASIC-based router/firewalls...

Second - you come from checkpoint world...thats software only - right?  if
so, then netfilter is the equivalent...with netfilter, and added modules
(Squid, KAME IPSec, etc..) you can/will achieve the functionality that
checkpoint had/did...when you worry about thousands of users, then you will
simply have to place your netfilter firewall on a powerful box...one with
good network cards and a fast processor(s)...the same would be true in a
checkpoint implementation to support thousands of users....

short story long - netfilter has all the equivalents of checkpoint including
the hardware requirements for many concurrent connections.


-----Original Message-----
From: Brett Simpson [mailto:simpsonb@hillsboroughcounty.org]
Sent: Thursday, June 03, 2004 9:19 AM
To: netfilter@lists.netfilter.org
Subject: Re: Poll on large sites that deploy Iptables.


On Wednesday 02 June 2004 03:54 pm, Brett Simpson wrote:
> We are a large organization, 3000 plus users, considering switching from
> Checkpoint FW1 to Iptables. I was wondering how many large organizations
> (1000 plus users) are using Iptables in a production environment?
>
> For those that are using Iptables and were previously using a commercial
> product what were your reasons for switching and what issues have you seen
> using Iptables?


Thanks for the responses.

I have a few more questions:
Does anyone know of any large firewall sites? Large site would consist of 
large numbers of users, rules, routes, tunnels, or high bandwidth use.

Of those who answered the above question:
Are any of those well known companies (i.e. like AOL, IBM, etc... ) who use 
Iptables?

What version of Linux are they using?

What are they doing for support? (i.e. Redhat, IBM, 3rd party support,
mailing 
lists, etc)

How many physical firewalls are deployed?

Is it known if they converted from a commercial firewall? (i.e Checkpoint, 
NetScreen, Cisco PIX, etc)

Thanks in advance,
Brett



Visit our website at http://www.p21.com/visit 
The information in this e-mail is confidential and may contain legally
privileged information.  It is intended solely for the person or entity to
which it is addressed.  Access to this e-mail by anyone else is
unauthorized. If you are not the intended recipient, any disclosure,
copying, distribution, action taken, or action omitted to be taken in
reliance on it, is prohibited and may be unlawful.  If you received this
e-mail in error, please contact the sender and delete the material from any
computer. 



