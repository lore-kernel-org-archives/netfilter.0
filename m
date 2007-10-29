From: "Chris Aseltine" <ophidian@newsnation.com>
Subject: Re: trouble with DNAT on linux 2.6.23.1 and iptables 1.4.0rc1
Date: Mon, 29 Oct 2007 08:11:41 -0500
Message-ID: <001501c81a2d$3f355750$0902a8c0@mystery1>
References: <002101c8191b$72204cf0$0902a8c0@mystery1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

"Chris Aseltine" <ophidian@newsnation.com> writes:

> I'm trying to forward a TCP port from my public IP address to a private IP
> address on my LAN, with a command like this: <snip>
>
> I upgraded to 1.4.0rc1, and now I get:
>
> iptables: No chain/target/match by that name

Sorry, I've since realized I was missing xt_tcpudp.

