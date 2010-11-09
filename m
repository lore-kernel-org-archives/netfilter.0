From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Redirecting flows among one machine's interfaces
Date: Wed, 10 Nov 2010 00:33:51 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1011100033030.7017@obet.zrqbmnf.qr>
References: <764497.89064.qm@web31604.mail.mud.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <764497.89064.qm@web31604.mail.mud.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kostas Pelechrinis <kpele_ntua@yahoo.com>
Cc: netfilter@vger.kernel.org

On Tuesday 2010-11-09 23:59, Kostas Pelechrinis wrote:

>Hi all,
>
>I am not very familiar with iptables, but what I am trying to achieve 
>is the following:
>
>I have a machine with two interfaces (let's say if1 -- with ip address 
>a.b.c.d -- and if2 -- with ip address x.y.z.w) both connected to the 
>internet. One of the two interfaces is the default interface (e.g., 
>if1).  Whatever flow is initiated towards a destination in the Internet 
>is going out if1.  I want to use iptables in order to redirect some of 
>the flows to if2.  Is there a way to do this using iptables?

Using -j MARK and iproute2 policy routing.

>I have tried some rules (e.g., iptables -A FORWARD -d k.l.m.n -o if2 -j 
>ACCEPT // where k.l.m.n is the destination ip address of the flow I 
>want to redirect) but with no luck.

Well guess why: it _tests_ whether the outgoing interface is (already) 
if2.
