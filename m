From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: What's required for a stateful firewall + ipvs in 2.6 kernel?
Date: Wed, 10 Sep 2008 12:03:40 -0500
Message-ID: <48C7FDEC.3060907@riverviewtech.net>
References: <48C70B10.3040405@vfive.com> <48C7E4C2.9050500@riverviewtech.net> <48C7FD16.301@vfive.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48C7FD16.301@vfive.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 09/10/08 12:00, Brian Ghidinelli wrote:
> That's the issue... there are a lot of posts about LVS and netfilter on 
> Austintek.com and other sites but the dates range from 2000 to 2006 or 
> so making it hard to figure out what's current.

*nod*  This is the case with a lot of things, not just LVS.

> In sysadmining, I don't really like to be the pioneer. :)  No one else 
> has turned an RHEL box into a Firewall + LVS Director?

I doubt that you are the first, but I don't know that others have 
documented things for people to find.

> I believe keepalived synchronizes the LVS connections between ipvs on 
> the two boxes.  There is a config option "lvs_sync_daemon_inteface" for 
> this (as I understand it).

Ok...

> This is only half the picture though, and conntrackd appears to solve 
> the other half by also keeping netfilter in sync about which connections 
> are already established or related so iptables rules don't kill valid 
> sessions.

*nod*

> So in the end I suppose the real question is whether or not anyone has 
> successfully used the Antefacto patches on RHEL?  I will try the 
> lvs-users mailing list for that one...

Please follow up with what you find so others searching this archive in 
the future will have some information.

> Thanks for the help Grant,

You are welcome.



Grant. . . .
