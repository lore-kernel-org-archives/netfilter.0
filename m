From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: External IP addresses on internal network
Date: Thu, 28 Aug 2003 11:43:30 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F4E2322.9070905@Loudoun-Fairfax.com>
References: <09B04A55822EFF4DA48D2E0BB2941D4A15C1B5@wardrive.citadelcomputer.com.au> <3F4C0519.8000109@Loudoun-Fairfax.com> <Pine.LNX.4.53.0308270944480.7868@simba.math.ucla.edu> <3F4CFD8C.5020404@Loudoun-Fairfax.com> <3F4E0F7D.8030507@chrisbrenton.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F4E0F7D.8030507@chrisbrenton.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Brenton <cbrenton@chrisbrenton.org>
Cc: netfilter@lists.netfilter.org

Morning all-

>
> I've seen this before. An internal client goes to access a Web site 
> (say www.fubar.org) and the authoritative NS is actually a load 
> balancer. It spews suspicious looking traffic at the requesting NS in 
> order to generate performance metrics to figure out what IP to serve 
> back (assumption being the client is close to the NS).
>
> So if this is the case, you should see a query for a host within the 
> AOL domain (owner of the address space) just prior to this traffic. 

I haven't logged that traffic, but the user is generally checking an AOL 
mail account and could be following links or browsing.

>
>
> As for seeing the firewall's private IP in the log entry, are you 
> running DNAT on the reply traffic? If so that would explain why it 
> shows up as private.

I run SNAT on POSTROUTING to masq the internal LAN but don't do any DNAT.

>
> As mentioned I would verify by capturing the traffic. Something like:
>
> windump -nn -s 1500 -w weird-dns.cap "src port 137 and dst port 53"
>
> from a system inside of your firewall. If you get the log entry but no 
> capture, you know its received from outside. 

I'm a cup of coffee short of a full pot today. I'll have to work on this 
later :-)

>
> I *totally* agree. I write the material and teach SANS perimeter 
> security track and one thing I am uber big on is filtering outbound as 
> well. Stuff like echo-replies, type 3's, type 11's, NetBIOS/IP, SNMP, 
> TFTP, etc. etc. should never be allowed to leave your network. Defense 
> in-depth and all of that. If the attacker's stimulus gets in, at least 
> you have a shot at blocking the reply.
>
Since I'm an IT lightweight, I generally use sample scripts and default 
configs whenever I can. I knew from a philosophical standpoint that I 
wanted outbound filtering. I didn't really know how to do it and I 
didn't find any examples that could help me, so I used the brute force 
method: reject everything and see what it breaks, then open those ports 
only. This method works, sort of, but it can be a problem since many 
programs assign ports dynamically. Anyway, I caught me a big ole worm 
this way so I must be doing something right.


