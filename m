From: Ville Mattila <vm@iki.fi>
Subject: Skipping connection tracking for certain traffic types?
Date: Tue, 27 May 2003 22:49:56 +0300 (EET DST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030527192155.V20519@poliisi.iki.fi>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org
Cc: Ville Mattila <vm@iki.fi>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello all,


Correct me on this if I'm wrong: It is a feature of
Netfilter that whenever conntrack is registered in
kernel, then for example any UDP packet passing through
the firewall causes the state table to be consulted
resulting in either update of an old state entry if
found or creation of a new state.

Now if the description above holds we have a slight problem.

At our site, connection tracking would be the nice way to
handle the classic case of allowing responses to UDP
requests initating from our internal network. The problem
is that in the internal network there are several standalone
(a.k.a. non-forwarding) caching nameservers sending about 100
dns queries per second through the firewall in the worst case.
For us the default ip_conntrack_proto_udp.c timeout setting
of 30 seconds for unreplied UDP requests and 180 seconds
for assured streams could mean from 3 000 up to 18 000 state
entries for these dns requests alone.

This problem would be solved if it was possible with
Netfilter/iptables to skip connection tracking for some
rules (servers sending dns queries and replies to them in
our case), or better yet, not to track every connection by
default but only when requested per rule. Is this kind
of selective connection tracking possible already or will
it possibly become supported in future conntrack versions?


Best regards,
Ville

- -- 
Mr. Ville Mattila, vm@iki.fi, http://iki.fi/vm/

-----BEGIN PGP SIGNATURE-----

iD8DBQE+08FytUJlHUfTfMERAoqUAJ9IVa+SDTSH0RBpw62MQennyu2LfACgtbG0
xlVPrOV87drR5C4KidXjOgI=
=Me43
-----END PGP SIGNATURE-----

