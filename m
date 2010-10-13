From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: sudo /sbin/iptables -v -t filter -A INPUT -p tcp --dport 22 -s
 124.225.122.167 -j REJECT does not stop ssh attack
Date: Wed, 13 Oct 2010 20:42:41 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1010132041210.7897@obet.zrqbmnf.qr>
References: <AANLkTimbhPn+S63HvtvhOMZemGY5tGyzk-b1gjQUg_K5@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimbhPn+S63HvtvhOMZemGY5tGyzk-b1gjQUg_K5@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Red Cricket <red.cricket.blog@gmail.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2010-10-13 19:59, Red Cricket wrote:

>Sorry for the long subject.
>
>But I execute this on my system ...
>
>sudo /sbin/iptables -v -t filter -A INPUT -p tcp --dport 22 -s
>124.225.122.167 -j REJECT does not stop ssh attack

Standard user problem: -A appends, and most likely in a place
(namely, at the end, by the very definition of append) where
no further rules have effect because all packets have been
handled by previous ones.

>Is there something wrong with my version of iptables or is my iptables
>command no good?

The latter, I suspect.
