From: Susan Hinrichs <shinrich@thought-mesh.net>
Subject: Re: tc problems
Date: Tue, 14 Jul 2009 12:22:01 -0500
Message-ID: <1247592121.2769.601.camel@chichi>
References: <4A5C99BB.4080405@duet.it>
Reply-To: shinrich@ieee.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A5C99BB.4080405@duet.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fabio Marcone <fabio.marcone@duet.it>
Cc: netfilter@vger.kernel.org

You can indeed use the MAC addess in a u32 match by using negative
offsets.  See the faq article for details.
http://www.docum.org/docum.org/faq/cache/62.html

This will work to enforce your w1/w2 based download limits on the LAN
interface.

However, when your upload packets leave the WAN interface, the original
workstation MACs will be long gone before the TC processing occurs.  You
could use the mac source tests in iptables and marks to propagate the
information to the TC phase.

Susan

On Tue, 2009-07-14 at 16:44 +0200, Fabio Marcone wrote:
> Hi!
> I have a problem setting traffic shaping rules for routing packets.
> 
> scenario:
> I have a linux router and two workstation that generate traffic to web 
> server in Internet.
> I need to limit:
>   - w1 to 100Kb/s in upload and 1MB/s in download
>   - w2 to 200 Kb/s in upload and 2 MB/s in download
> 
> I know that I have to set upload limit on wan interface and download 
> limit on lan interface.
> The problem is in download: how can I setup tc filter to recognize 
> response packets to w1 and to w2? only by ip? and if I use dhcp? Does 
> exist a way to use mac address?
> 
> Thanks in advance,
> Fabio
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

