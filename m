From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Bastille/netfilter with Linux 2.6.28 blocks connections
Date: Wed, 07 Jan 2009 23:16:47 +0100
Message-ID: <496529CF.1060208@chello.at>
References: <669246551@web.de>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <669246551@web.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Roland H=E4der wrote:
> Here is the logfile for POP3 connections:
> http://www.mxchange.org/downloads/firebox/pop3-drops.log
>
> Greetings,
> Roland
>  =20
-A FORWARD -s 192.168.1.0/24 -o eth0 -j ACCEPT

in your rule the output device is eth0, but it should again be ppp0.
same same but different... this time for the FORWARD chain.

advice 1: double check your data before posting.

advice 2: make yourself familiar with iptables.


greets


mart


