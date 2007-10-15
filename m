From: Morphal <morphal@libertysurf.fr>
Subject: programming rules with libiptc
Date: Mon, 15 Oct 2007 11:39:10 +0200
Message-ID: <4713353E.7050508@libertysurf.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I am trying to code a specific rule in C.
I read this howto 
http://www.faqs.org/docs/Linux-HOWTO/Querying-libiptc-HOWTO.html.
But it is not totally clear, especially for the target info.

Let's say I want to do the equivalent of "iptables -t nat -A OUTPUT -d 
192.168.0.1 -j DNAT --to-destination 192.168.0.2"

here is briefly what I got so far
-------------
struct in_addr dest;
struct in_addr real;
inet_aton("192.168.0.1", &dest);
inet_aton("192.168.0.2", &real);
const char *chain = "OUTPUT";
const char *tablename = "nat";
const char *targetname = "DNAT";

iptc_handle_t h;
struct ipt_entry e;

h = iptc_init(tablename);
e.ip.dst = dest;

//missing some stuff here!!

iptc_append_entry(chain, &e, &h);
iptc_commit(&h);
--------------

Can anyone can help me setting a target for this rule?
I am going through iptables source code, but it is not really easy..

Thanks
