From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ip6tables redirect
Date: Thu, 2 Dec 2010 14:34:48 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1012021433430.5361@obet.zrqbmnf.qr>
References: <26D8DC6230C54AACAA60179B4D5E132C@WINDOWS.KVI.NL>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <26D8DC6230C54AACAA60179B4D5E132C@WINDOWS.KVI.NL>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fred Zwarts <F.Zwarts@KVI.nl>
Cc: netfilter@vger.kernel.org

On Thursday 2010-12-02 13:15, Fred Zwarts wrote:

>We are moving from an IPv4 only environment to a mixed IPv4/IPv6 environment.
>On this server, we use for iptables a REDIRECT for the nat table.
>This does not work for ip6tables. It complains that it does not know the option --to-port.
>My question is how to do such a port redirect with ip6tables.

Using -j TPROXY and appropriate local routing, I would say.
