From: Franck JONCOURT <franck.mail@dthconnex.com>
Subject: Re: Route packets by source IP
Date: Wed, 19 Mar 2008 19:21:46 +0100
Message-ID: <43cba8b55bae94158c0580f06e368ea4@localhost>
References: <47DFCF36.3060500@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47DFCF36.3060500@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


Hi,



On Tue, 18 Mar 2008 09:18:30 -0500, Grant Taylor

<gtaylor@riverviewtech.net> wrote:

> On 03/18/08 07:01, Steffen Heil wrote:

>> 2. At A: Route every packet "from A2:P" to B2.

>>  - otherwise A would try to route to the client via its gateway, which

>> would fail because of the private sender ip. -

> 

>> But I don't know how to do the second.

>>

>> Any hints?

> 

> You need to use policy based routing.  In short, set up an additional

> routing table very similar to the main routing table save for using B as

> the default gateway rather than A.  Then you use Traffic Control (tc)

> rules to direct the kernel to use the new routing table for the traffic

> that you want to manually route.



This is perhaps not a good way to do, but I was thinking about using the

__ip route__ command.



ip route add 192.168.2.0/24 via 192.168.0.2



where 192.168.2.0/24 would be the B1 network and 192.168.0.2

would be the B2 ip address.



Is that wrong ?



---

Franck Joncourt

http://www.debian.org/ - http://smhteam.info/wiki/



