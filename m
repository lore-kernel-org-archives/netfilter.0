From: "John Paul" <john@pinoylinux.sytes.net>
Subject: Re: Problem Found! - Firewall Rule (Solved!)
Date: Mon, 9 Jun 2003 12:44:28 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <008c01c32e41$d8189ef0$1500a8c0@expi>
References: <09B04A55822EFF4DA48D2E0BB2941D4A019269@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: George Vieira <georgev@citadelcomputer.com.au>, netfilter@lists.netfilter.org

Success George!!! All in a sudden, machines came up in Network Neighborhood
when I tried to map one machine using its IP. Saves a lot!

cheers!

----- Original Message -----
From: "George Vieira" <georgev@citadelcomputer.com.au>
To: "John Paul" <john@pinoylinux.sytes.net>; <netfilter@lists.netfilter.org>
Sent: Monday, June 09, 2003 12:22 PM
Subject: RE: Problem Found! - Firewall Rule


> The only solution to this is to make the VPN server or the other network
be the master browser of that network.. so it handles all the netbios
broadcasts and all.
>
> Once this is done, setup samba on the remote firewall to do a "remote
announce = 10.10.255.255" onto your network... something like that.. it's
been a while since I've done this..
>
> Though this must be the VPN server that runs the master browser because
broadcasts DO NOT ROUTE so it can't be done with a server inside the VPN
servers network..
>
> give that a try. static mappings should work though as long as you know
what your looking for.
>
>
> -----Original Message-----
> From: John Paul [mailto:john@pinoylinux.sytes.net]
> Sent: Mon 09-Jun-03 1:35 PM
> To: George Vieira; netfilter@lists.netfilter.org
> Cc:
> Subject: Re: Problem Found! - Firewall Rule
>
>
>
>
>


