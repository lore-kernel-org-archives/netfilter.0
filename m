From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Single-NIC Traffic Shaping
Date: Sun, 02 Nov 2008 15:00:40 -0600
Message-ID: <490E14F8.6020402@riverviewtech.net>
References: <490DDA76.5030600@amfes.com> <490DF590.3010507@amfes.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <490DF590.3010507@amfes.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/2/2008 12:46 PM, Daniel L. Miller wrote:
> Since tc acts on an interface basis - can I perhaps setup a bridge with 
> a single interface in it?  So address the physical interface eth0 for my 
> LAN, set the bridge for the Internet modem, and then use tc on the 
> bridge but not on the ethernet interface?

Unless you have a good reason, I would strongly suggest that you add a 
second NIC to the box and put your internet connection on that second NIC.

Technically I /believe/ you can do it with a single NIC, but it is 
extremely complex to do in such as you have to take in to account both 
internal (LAN), external (Internet), inbound, and outbound traffic all 
on the same interface and in the same tree structure.  Where as if you 
have separate NICs you can separate your interfaces and tree structures 
such that internet reply traffic is processed as traffic going out the 
internal interface and internet request traffic is processed as traffic 
going out the external interface.  Usually people do not want to rate 
limit / QoS their internal LAN traffic, requests or replies.

Further, if someone is on the same network segment as your internet 
connection, (with Static IP or DHCP) it may be possible for them to do 
some nefarious things (think MAC addresses) to be able to connect 
directly in to your systems across the internet bypassing your router 
all together.



Grant. . . .
