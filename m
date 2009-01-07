From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Bastille/netfilter with Linux 2.6.28 blocks connections
Date: Wed, 07 Jan 2009 16:16:49 +0100
Message-ID: <4964C761.9060909@chello.at>
References: <664670418@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <664670418@web.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Roland H=E4der wrote:
> First here is the requested logfile (syslog) with the relevant ports:
> http://www.mxchange.org/downloads/firebox/tor-drops_syslog.log
>
> Okay, two thinks I was mentioning before where wrong, sorry about tha=
t. :( First INPUT DROP 8 is dropping the packets and second they came f=
rom outside as you can see in the logs

Hello,

in iptables-save output you supplied:
http://www.mxchange.org/downloads/firebox/iptables.list

there is no 'INPUT DROP 8' rule.

greets

Mart


