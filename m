From: s sg <ssg2351@gmail.com>
Subject: ipt_reject.c --> ip_route_me_harder ... --> ip_route_output_slow: iif 
	is loopback device?
Date: Tue, 11 May 2010 18:28:53 +0800
Message-ID: <AANLkTimahQnqdaHEEB1UgkdG7mp9vysHZNvWKpPTcxI5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type:content-transfer-encoding;
        bh=67Mcr5tKxM3x1dro1NDi/FpZ70CcfYVaOpif+sFl5dI=;
        b=Yomk/Z/P43e/zRZNs/1ESX+qhtfmMn1g3orsfrffWQ0VU2gGIuflHnAQPFqfdUF9I/
         rYDg//Rpz3CaVBMkb5PgHogo5vbp0DysroFPQg1mAPARSKfUF6wovKn9wS+T5ijoREuT
         XfApYNBCF/HSWZ/KtSflvV559PXUSgdJz0Goc=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi,

I meet a routing issue when I try to use ipt_reject RST target in my
policy routing enabled linux box (please see below picture).

The linux box is configured to support policy routing, iif policy. The
policy is, if packet is from interface group1, then it will lookup
table 100, this table's default oif is wan1. And if packet is from
interface group2, then it will lookup table 101, this table's default
oif is wan2. The main table's default oif is wan1.

The issue is, one packet comes from group2 and then ipt_reject wants
to send RST, but the routing for the RST packet fail
(ip_route_me_harder fail).

I trace the code in ipt_REJECT.c. ipt_REJECT.c use ip_route_me_harder
to find the RST packet's destination. ip_route_me_harder will first
find the RST packet's reverse path using ip_route_output_key. The
trace of ip_route_output_key is like this:
ip_route_me_harder --> ip_route_output_key --> ip_route_output_flow
--> __ip_route_output_key --> ip_route_output_slow.

In ip_route_output_slow, before fib_lookup, the iif is set to lookback
device, not the real device where the packet comes. So the policy
finding in fib_lookup will fail to find table 101 but fall to main
table, so the oif is wan1 but not wan2.

I am confused why iif is hard-coded to loopback device but not the
real iif of the packet in ip_route_output_slow. I try to use the real
iif of the packet, then everything is fine: RST packet can be routed
correctly. But I am new to the routing stuff and not sure if this
solution is ok, can some one kindly explain a little on this? Thank
you in advance!


=A0=A0=A0=A0 group1\=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 /wan1
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0   /
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0   /
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 -|----------------|-
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | linux box=A0=A0|
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | ( 2.6.20 )=A0 |
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 -|----------------|-
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0  \
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0   \
=A0=A0=A0=A0=A0=A0 group2/=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 \wan2
