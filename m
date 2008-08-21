From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Regarding iptables mac matching
Date: Thu, 21 Aug 2008 09:41:38 -0500
Message-ID: <48AD7EA2.9050106@riverviewtech.net>
References: <48AD7CAA.8020205@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48AD7CAA.8020205@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 08/21/08 09:33, Abhishek Singh wrote:
> I like to block the access of that host to other hosts, the gateway 
> and the internet as well. But I'm unable to do that using the above 
> mentioned rules. I'm quite optimistic that someone help me with this 
> problem.

In short I am fairly certain that you will not (reliably) be able to 
block host to host communications on your LAN.  Here's a quick synopsis 
of a very similar discussion on the EBTables mailing list.

Consider your LAN a small room with multiple people in it, all of which 
are in ear shot of each other.  So when one person tries to talk to 
another person they can do it with out a problem because it is directly 
between each other.  Your firewall only enters the picture when someone 
tries to leave the room to go out to the world.  With out shouting at 
everyone, there is very little that you can do to prevent each other 
from talking between them selves.

> Thanks in advance.

*nod*



Grant. . . .


P.S.  This assumes that all the systems are on the same subnet.  If they 
are on different subnets and have to pass through the router to get 
between subnets you can do something if you want to.
