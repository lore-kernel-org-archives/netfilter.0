From: Valdis.Kletnieks@vt.edu
Subject: kernel: ipt_hook: happy cracking.
Date: Fri, 07 Nov 2003 01:48:27 -0500
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <200311070648.hA76mRe8007990@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-1686567374P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
List-Id: <netfilter.vger.kernel.org>
To: linux-kernel@vger.kernel.org, netfilter@lists.netfilter.org

--==_Exmh_-1686567374P
Content-Type: text/plain; charset=us-ascii

So I look in my syslogs, and I find a lot of:

Nov  6 14:36:37 turing-police kernel: ipt_hook: happy cracking.

messages. A quick grep finds it's ipv4/netfilter/iptable_filter.c:

        /* root is playing with raw sockets. */
        if ((*pskb)->len < sizeof(struct iphdr)
            || (*pskb)->nh.iph->ihl * 4 < sizeof(struct iphdr)) {
                if (net_ratelimit())
                        printk("ipt_hook: happy cracking.\n");
                return NF_ACCEPT;
        }

The only problem is that root wasn't doing any playing at the time. The real
culprit was an iptables filter with '-j REJECT'. (Yes, usually a '-j DROP' is
my preference, but I get SYN packets from some places on our net where sending
an RST is more polite than waiting for retransmits).

I admit not being positively clear on how this manages to trigger, as
I'm not sure who's supposed to set the ->len field on the new pskb
allocated by ipt_REJECT.c:send_reset() (AFAICT, ->ihl should be OK
after skb_copy_bits() gets called).

Hardly 'cracking' - but after yesterday's CVS scare, I had to double
check this code was in 2.4.18 too before my pulse came down.. :)



--==_Exmh_-1686567374P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE/q0A7cC3lWbTT17ARArLXAJ97FvI9hFFBYcl7DevQhy1tTuQCjACdEW0N
t3Hpgyn1Ga9kQh8NQC86f+w=
=7bAP
-----END PGP SIGNATURE-----

--==_Exmh_-1686567374P--
