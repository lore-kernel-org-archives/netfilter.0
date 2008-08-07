From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: NETMAP of destination *after* routing
Date: Thu, 07 Aug 2008 10:16:58 -0500
Message-ID: <489B11EA.6020700@riverviewtech.net>
References: <g7da9g$21r$1@ger.gmane.org> <alpine.DEB.1.10.0808071340480.31237@mercury.sdinet.de> <g7f2ch$tbm$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <g7f2ch$tbm$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 08/07/08 09:55, Charles Duffy wrote:
> Perhaps I could also also add a rule setting an appropriate mark in 
> OUTPUT. Not being able to communicate with the hosts from the local 
> system is a showstopper, however, and I'd prefer to avoid munging the 
> routing tables if possible to keep the patch to libvirt implementing 
> this functionality minimal. (Robust infrastructure is already in place 
> for modifying iptables rules for libvirt-managed networks; routing, not 
> so much).

If you did get the rules in the PREROUTING and OUTPUT to work and they 
were the same, I'd suggest you put them in a common sub-chain and jump 
to it from both the PREROUTING and OUTPUT chains.  This will make 
maintenance much easier down the road.

Have you considered doing this on layer 2, doing so would allow your 
systems to have the same IP address.  You would in effect be altering 
the destination MAC address of the ethernet frames.  In fact, except for 
ARPing, you could easily have an unlimited number of hosts with the same 
address on the same physical network.  You will just need to translate 
IPs to the proper MAC at the time you want to communicate with them.

This will work from a traditional routing point of view.  However this 
does not take in to account that the target systems may see an IP 
conflict on the network.  To resolve this, you may want to put each 
system on its own micro network and bridge micro networks together as 
you see fit.



Grant. . . .
