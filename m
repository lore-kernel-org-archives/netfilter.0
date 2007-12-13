From: Thomas Egerer <thomas.Egerer@secunet.com>
Subject: libipq NAT causes RSTs
Date: Thu, 13 Dec 2007 16:23:44 +0100
Message-ID: <47614E80.9050504@secunet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: RIPEMD160

Hello *,

first of all, I _know_ I should use netfilter_queue. I don't because libipq
actually has a quite nice documentation, being a set of man-pages. Unable to
find something comparable for netfilter_queue I to stick to using libipq (even
though having more than one queue sounds darn interesting to me)

But for the problem, maybe it's my bad. Most probably! Even in that case I'd be
glad if someone to pointed that out to me!
I'm currently (trying) to write a transparent proxy application, using
libipq to capture packets + iptables' redirect mechanism.
The basic idea works as follows:
+---+      +---+      +---+
| S |<---->| P |<---->| D |
+---+ (1)  +---+  (2) +---+

(1) uses iptables' REDIRECT target; the received data is then forwarded,
    using another socket connection (2)
(2) uses libipq to do some kind of SNAT and change the local source
    address to S's address and vice versa for the incoming packets
    from D

So far the theory. The application works fine, as long, as I do not
remap the source port (destination port, respectively) from P to D (2). Once
I enable the port remapping I get
a) syslog messages like the following:
   [ 7742.939471] ip_rt_bug: [S' IP] -> [P's IP at (2)], ?
b) RST packets from P towards D, using exactly all the correct TCP
   settings, except for the destination port, (being 1, sometimes 2, or 3,
   I couldn't figure out, why)

The three-way-handshake works fine, the RSTs are generated
for the _first_ packet to contain a _TCP-payload_. Also netstat tells me,
there is an established connection between P and D, but somehow (I
assume that this might be the trouble) looking for the corresponding
socket connection on P fails.
I'm totally puzzled why that happens. libipq reinjects the packets with
properly changed checksums and whatnot, yet the RSTs are generated.
I've also tried NF_REPEAT, instead of the NF_ACCEPT verdict. The
behavior remains identically.

Any ideas, anyone?

Thanks in advance

Thomas
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFHYU6AUGqFG0l5Kr0RA3DMAJ91LfFI2rkjx5Q80XG1paLg49PRAQCgvPQ3
eAu14RJDYpgiLS03lpSthDU=
=gGsR
-----END PGP SIGNATURE-----
