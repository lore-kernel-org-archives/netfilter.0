From: Mike Wright <mike.wright@mailinator.com>
Subject: Re: How do we arp for NAT?  Secondary IPs, proxy arp? something else?
Date: Sun, 24 May 2009 16:27:11 -0700
Message-ID: <4A19D7CF.4010002@mailinator.com>
References: <4A19235F.4070306@opendreams.net> <4A192D38.90008@redpill-linpro.com> <4A19B5F1.4080000@opendreams.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A19B5F1.4080000@opendreams.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jesse Molina <jesse@opendreams.net>
Cc: Tore Anderson <tore.anderson@redpill-linpro.com>, netfilter@vger.kernel.org

Jesse Molina wrote:
> 
> That's a pretty good suggestion, but it's more of a workaround than 
> something that actually addresses the issue at hand.  I'm looking for a 
> solution on the GNU/Linux host, not in the world around it.
> 
> To restate my question:  What alternative ways are there to make the 
> GNU/Linux system reply to ARP requests for an IP, without that IP being 
> an actual interface on the host, or that interface must not be used by 
> local services *in any way*, for the reasons of using it via SNAT/DNAT?

Hi Jesse,

Looking through the ebtables man pages this is found:

    arpreply
        The arpreply target can be used in the PREROUTING chain of the 
nat table.  If this target sees an ARP request it will automatically 
reply with an ARP reply. The used MAC address for the reply can be 
specified.

This is also available as a qualifier:
     --ip-destination   The destination IP address.

You'll need to catch the specified macs when the traffic comes in. 
Those targets are also available in ebtables.

Seems like all the pieces you want are available.

Hope that is useful in some way.

:m)
