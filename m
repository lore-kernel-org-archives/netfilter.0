From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: PPPoE on a bridge, nat sees bridge as incoming interface
Date: Thu, 6 Mar 2008 23:05:37 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0803062303270.26142@fbirervta.pbzchgretzou.qr>
References: <20080306172218.GA14566@possum.gg3.net> <47D069BF.9080208@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47D069BF.9080208@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>


On Mar 6 2008 16:01, Grant Taylor wrote:
> On 3/6/2008 11:22 AM, Georgi Georgiev wrote:
>> I am having trouble understaning how bridging and iptables fit together. The
>> situation that bugs me is: if I do a PPPoE connection over a bridge with a
>> single physical port, my nat table will see any incoming packet as coming
>> from the bridge interface, and not the ppp interface. Why?

Without having it seen in practice, I am convinced that pppoe packets
being sent into a bridge or received from it will only ever appear in
ebtables and not iptables nor arptables, logically because they
are pppoe and not ipv4 nor arp, respectively.
Hence it will not show up in the ip_tables nat table either.

