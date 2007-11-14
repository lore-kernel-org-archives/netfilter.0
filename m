From: Olivier Sessink <lists@olivier.pk.wau.nl>
Subject: Re: Can someone guide me on "kernel: nf_conntrack: table full, dropping
 packet"?
Date: Wed, 14 Nov 2007 23:39:58 +0100
Message-ID: <473B793E.3070308@olivier.pk.wau.nl>
References: <e3b0905d0711130931w4991e196w32567cbfc0abc214@mail.gmail.com> <e3b0905d0711132229j7063b35bs3cbab071fceca0f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <e3b0905d0711132229j7063b35bs3cbab071fceca0f@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Goke Aruna <goksie@gmail.com>
Cc: netfilter@vger.kernel.org

Goke Aruna wrote:
> Hi all,
> 
> I am running linux bridge using iptables version 1.3.5 on FC5 with
> kernel 2.6.20-1.2320.fc5smp
> 
> However, after running it for almost 3 months, I just discovered the
> error below in my message log and all the traffic will drop and later
> comes up again.

some ideas:

check if ASSURED connections in conntrack (/proc/net/ip*something*) are
also shown in netstat. If there is a large difference you have clients
that drop dead in the middle of a connection. You could decrease the
timeout for those connections (/proc/sys/net/ipv4/netfilter/*something*)

if the number of connections is simply very high, you can increase the
conntract table size (somewhere in the manual how to do that).

regards,
	Olivier
