From: Michal =?utf-8?B?S3ViZcSNZWs=?= <mkubecek@suse.cz>
Subject: Re: ipv6 rule icmp bug maybe
Date: Thu, 04 Apr 2013 07:50:09 +0200
Message-ID: <5293489.MPThhE2Fke@alaris>
References: <CAMD-=VJU3PesmF7P4c0nQuk1Nw_XdoUf559h8tXfbEGXEv=2dQ@mail.gmail.com>
Reply-To: mkubecek@suse.cz
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAMD-=VJU3PesmF7P4c0nQuk1Nw_XdoUf559h8tXfbEGXEv=2dQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org
Cc: Nick Edwards <nick.z.edwards@gmail.com>

On Thursday 04 of April 2013 10:02EN, Nick Edwards wrote:
> with ipv4 we have been able to
> -P INPUT DROP
> loopback accepts etc...
> 
> -A INPUT -s 192.168.1.0/24 -j ACCEPT
> 
> hitting this, means allow all from 192.168.1.1/2/3/4.... etc  - tcp.
> udp. icmp whatever..
> 
> But with ip6tables this same approach does not seem to work, it
> permits tcp/udp, but it does not allow icmp, bug?

Hard to say unless you tell us what do your rules look like and what 
packets are dropped (and you think they shouldn't be).

                                                      Michal Kubecek

