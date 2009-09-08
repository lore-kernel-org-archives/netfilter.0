From: Nicholas Couchman <nick.couchman@yahoo.com>
Subject: Re: Windows/NetBIOS & SNAT
Date: Tue, 8 Sep 2009 16:50:02 -0700 (PDT)
Message-ID: <185948.38077.qm@web33403.mail.mud.yahoo.com>
References: <651562.95010.qm@web33406.mail.mud.yahoo.com> <4AA62E6A.4030501@chello.at>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1252453803; bh=B3NqMwwSqEUYP2uK6rk6p4kF6YyT34WzYu15Tx6Pvuw=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:References:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type; b=MogMXykzGTtQKR1lQZyG8IBuAfpEnFBLLLq8JvY6SkxJ64qtxOIm5yOIb7Ds9Oxkr3lMMXrbKopWP6XoaNYxD1uCH4H8KBiPppGZhWsUepg7owKrK2fVOmqs9XV/ss46weEtY2bOUNiJjV1TvI7gxvqn06ehjS7Cqn0W0xTjUco=
In-Reply-To: <4AA62E6A.4030501@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

> Hello,


> I'm just guessing, but as you do source nat, the wins server will only see requests from the nat source and will only reply to that address - trying to assign a netbios name to 192.168.100.100. I 
> don't know about nf_conntrack_netbios_ns, but maybe you would need something like nf_conntrack_nat_netbios_ns, which I don't know if it exists.
> But, do you really need the nat? Why not add the proper routes for the networks? There nf_conntrack_netbios_ns may do it's job within a simple filtering ruleset.

> Regards,

> Mart

Well, I think I've found part of the problem.  The nf_conntrack_netbios_ns module only operates on port 137, not on port 138.  I don't know exactly what the difference is, but it seems that all my WINS queries are attempting to go across on port 138.  So, this explains why loading the nf_conntrack_netbios_ns module was not helping.  I've now taken to trying to write a conntrack module that will cover port 138, but this isn't so simple a task as I had first imagined.  Upon loading my newly written module, I start to see packets show up in the conntrack table, but no replies are ever registered.  Weird, but I'll keep working.

As far as the nf_conntrack_nat_netbios_ns module goes, no, it doesn't exist in the kernel, but I don't see any nf_conntrack_nat* modules their, either, so I'm thinking that the standard nf_conntrack modules are supposed to cover NAT in addition to standard routing.

The reason I'm resisting creating another subnet with proper routes is because there are only 6 machines on this subnet.  Sure I would save myself some time - it'd be done by now - but it' be nice to get this working, both to save myself another route/subnet and for future endeavors.

-Nick

