From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Using interface name as a command line option to create a iptables
 rule
Date: Mon, 20 Jun 2011 18:09:44 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1106201809240.15411@frira.zrqbmnf.qr>
References: <BANLkTi=A5NWc3YR2fZk7Q6tw-xJ_BAz2Ug@mail.gmail.com> <BANLkTimcN_Jw6zOuxeKTEFg8yVvjLqMh0A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTimcN_Jw6zOuxeKTEFg8yVvjLqMh0A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "icukeng@gmail.com" <icukeng@gmail.com>
Cc: Adishesh M <adisheshsm@gmail.com>, netfilter@vger.kernel.org

On Monday 2011-06-20 17:39, icukeng@gmail.com wrote:

>if ssh listens only on 192.168.229.131 at port 22 these rules are equivalent.
>otherwise some user from another network (on another nic) can connect.
>
>Another nuance is possibility of ip/arp spoofing - you can get
>192.168.229.131 from eth1.

You can even get them without spoofing, by load-balancing, in which case 
the rules are not equivalent either.
