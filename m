From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: iptables rules for cups printer discovery
Date: Thu, 14 Aug 2008 20:35:04 -0500
Message-ID: <48A4DD48.3080004@riverviewtech.net>
References: <19894-78618@sneakemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <19894-78618@sneakemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 8/14/2008 1:51 PM, Stephen Isard wrote:
> I'm wondering whether there are iptables rules that will permit cups 
> snmp printer discovery to operate without creating a serious security risk.

I wonder if you could not use the "recent" match extension to ""remember 
when a cups broadcast has gone through.  If there is a reply packet from 
a unicast IP going back to a unicast host that has recently sent a 
broadcast packet.

I suppose you would have to set / update a recent list every time a 
unicast source sends a broadcast (high -> low port) to the service in 
question.  That way you could allow the reply (low -> high port) from a 
unicast source to the unicast destination that recently sent a broadcast.

This type of rule should help by not having to allow all traffic from 
the source port through.



Grant. . . .
