From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: BROUTING VLANS
Date: Mon, 15 Nov 2010 10:43:27 -0600
Message-ID: <4CE1632F.1080104@riverviewtech.net>
References: <0619127E-C439-4A2D-A720-30C5B1FD25FA@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <0619127E-C439-4A2D-A720-30C5B1FD25FA@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/15/10 05:02, Asher Awelan wrote:
> QUESTION:
> Is there a way to broute the vlans to the eth1 interface and not have 
> to create every interface and register every vlan... or perhaps strip 
> the vlan id (after logging of course)...

It /might/ be possible to strip the VLAN tags and send the traffic on 
it's way with out the need for all the vlan interfaces.  But, I don't 
know that it will be possible (at least as easily) to re-tag the 
returning traffic.

Something you might consider doing is moving the (un)tagging / trunking 
in to a user space application that can dynamically add and remove the 
VLAN tags with out needing kernel support or vlan interfaces.  -  I'm 
just typing raw theories out my (you know what) and would have to give 
this quite a bit more thought.



Grant. . . .
