From: Atle Solbakken <atle@goliathdns.no>
Subject: Re: When does NAT processing actually takes place?
Date: Thu, 17 Mar 2011 01:48:04 +0100
Message-ID: <4D815A44.9040103@goliathdns.no>
References: <AANLkTi=8aYepwRCxcCpo+syL4xjX6HkEFtPVbepZDf05@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=8aYepwRCxcCpo+syL4xjX6HkEFtPVbepZDf05@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pandu Poluan <pandu@poluan.info>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Den 17. mars 2011 01:20, skrev Pandu Poluan:
> When does the actual NAT process (i.e., swapping addresses) take place
> for DNAT and SNAT/MASQUERADE? And when does the reciprocal NAT (i.e.,
> reverse NAT, that should happen for instance to process a reply to a
> packet that's been SNAT-ed) take place?
Take a look at this diagram. Explains iptables packet flow (simplified).

http://www.linuxhomenetworking.com/wiki/images/f/f0/Iptables.gif.pagespeed.ce.WDSY-MDA4o.gif


Atle.
