From: Radek Kanovsky <rk@dat.cz>
Subject: Re: iptables rules in comparable form
Date: Tue, 1 Jun 2010 18:47:57 +0200
Message-ID: <20100601164757.GC15745@q.uh.cz>
References: <20100601081053.GA13943@q.uh.cz> <alpine.LSU.2.01.1006011043190.3431@obet.zrqbmnf.qr> <4C04D07F.6040702@chello.at> <20100601112552.GA15745@q.uh.cz> <4C050ADE.60403@chello.at>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4C050ADE.60403@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Tue, Jun 01, 2010 at 03:27:58PM +0200, Mart Frauenlob wrote:

> > are small but frequent. But primarily both solutions reset couters if
> > used and it is not good for me now. So I ended with script that does
> > incremental updates.
> 
> iptables[-save/restore] have a -c switch to save/restore counters.

There is some ISP DB that produces XML config for router. XML config
is transformed to iptables-restore rules and stored in some /etc file.
There are also some hand writen rules in /etc files controlled by admins.
I take all these files and prepare one big file which can be feed to
iptables-restore. Obviously without counters. So I take snapshot
of current ruleset via "iptables-save -c" command. Now I have
two ruleset but I am not able to compare them because some writes
destination ports with service names some with port numbers.
Some versions of iptables-save produces "-j MARK 0x2f" some
"-j MARK --set-mark 0x2f". So "iptables-save -c" is useles for me
unless I have some normalization utility that transforms all rules
to some common comparable form. I have it and I am doing it right this
way. I am asking if someone doesn't do this already or if there is some
more clever solution.

Regards

Radek Kanovsky
