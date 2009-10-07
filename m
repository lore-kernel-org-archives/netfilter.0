From: Robin Wood <robin@digininja.org>
Subject: Re: transparent proxy and iptables failing
Date: Wed, 7 Oct 2009 17:35:42 +0100
Message-ID: <7de411230910070935k2f2ee0c1r6238f3773bf3b4b2@mail.gmail.com>
References: <7de411230910070245s23552d36v66496187db666440@mail.gmail.com> 
	<7de411230910070444u50e7c638m968350c6da1ce6e1@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <7de411230910070444u50e7c638m968350c6da1ce6e1@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

2009/10/7 Robin Wood <robin@digininja.org>:
> Hi
> I'm trying to setup a transparent proxy so I've got a linux device
> with two NICs which are bridged using brctl. Traffic flows happily
> across the bridge so I know it is working fine.
>
> Now when I try to setup the iptables rules they are being ignored. The
> rule I want to use is:
>
> iptables -t nat -A PREROUTING -i br-lan -p tcp --dport 80 -j REDIRECT
> --to-port 3128
>
> but nothing gets redirected. I've also tried changing 3128 to a port
> that is closed to see what would happen, nothing, the packets kept
> flowing.

Various people have suggested using ebtables rather than iptables
because I want to act on traffic over the bridge rather than between
interfaces. If this is correct, how would I rewrite the above rule in
ebtables speak?

Robin
