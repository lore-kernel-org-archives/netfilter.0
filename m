From: Marc Haber <mh+netfilter@zugschlus.de>
Subject: mixed address family sets and rules in nft
Date: Sat, 4 Jun 2022 15:45:48 +0200
Message-ID: <YptiDLW0raHPYCgg@torres.zugschlus.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,

I am somewhat a newbie to nft, but I have been doing Linux packet
filtering for way more than 20 years, starting with ipfwadm back in 1997
or 1998.

In nft, I would like to be able to write something along the lines of

|@@def $host = (85.214.160.151 2a01:238:42bc:a101::2:100)
|
|chain INPUT saddr $host proto tcp dport 22 ACCEPT

(this is code from ferm, iptables' macro assembler I have been using for
the last decade, the code will result in one rule in the IPv4 INPUT
chain and one rule in the IPv6 INPUT chain, implcitly doing exactly
what I mean it to do.).

Is there a way to write this in nft? So far, both using a define and a
set, I haven't been able to do it any easier than to write dedicated
definitions and rules for IPv4 and IPv6, which is ugly. I thought I
would have left problems like this behind ten years ago.

This thing is not mentioned in the wiki and it is also not in the FAQ.
Is there an easier way to write this?

Please note that while it seems trivial and not-so-ugly when dealing
with single IP addresses, but having an access list of tens or hundreds
of addresses becomes an issue of manageability once one is no longer
able to write IPv4 and IPv6 addresses belonging together in adjacent
places.

I think the nicest way to have this would be a way to write "inet"
rules:

|define host = { 85.214.160.151, 2a01:238:42bc:a101::2:100 }
|table inet filter {
|  chain INPUT {
|                inet  saddr $host tcp dport ssh accept
|  }
|}

or the respective code using sets. I don't know enough about nft and
nftables inner works to be able to judge whether this should be
expanded/solved inside the front-end, filtering the list and creating
dedicated rules for IPv4 and IPv6, or whether the kernel code should be
able to handle inet codes and mixed address-family rules itself, or
whether one should have a preprocessor for this.

I am sure this has been discussed a gazillion of times, but I was not
able yet to find the discusions and their result. Pointers would be
appreciated. Thanks for helping.

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Leimen, Germany    |  lose things."    Winona Ryder | Fon: *49 6224 1600402
Nordisch by Nature |  How to make an American Quilt | Fax: *49 6224 1600421
