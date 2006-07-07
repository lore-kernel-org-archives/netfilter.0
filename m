From: Rene Mayrhofer <rene.mayrhofer@gibraltar.at>
Subject: do_IRQ: stack overflow
Date: Fri, 7 Jul 2006 15:47:50 +0100
Message-ID: <200607071547.51437.rene.mayrhofer@gibraltar.at>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1933641.grOH8AvMXC";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org

--nextPart1933641.grOH8AvMXC
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi all,

[Please CC me in replies, I am not subscribed to the list.]

Since a few days, we have a serious kernel problem on one of our production=
=20
firewalls. It seems to be a problem in the interaction between openswan's=20
KLIPS, netfilter, and routing code, at least as fas as I see it. This probl=
em=20
is reproducible on one system (we have not yet managed to figure out how to=
=20
reproduce it on another system) running kernel 2.4.32 with KLIPS 2.4.5 (and=
=20
pluto 2.4.5):

do_IRdo_IRQ: stack overflow: 292
c0252788 00000124 00000120 c028e000 61776bb8 644a8a78 c4562900 c0120da3
       00000000 000000e4 00000080 61776bb8 644a8a78 c4562900 0000003c 00000=
018
       c0280018 ffffff12 e0364a81 00000010 00000206 00000008 c028e764 c4562=
880
Call Trace:    [<c0120da3>] [<e0364a81>] [<e0365388>] [<e036576f>]=20
[<e03604d0>]
  [<e038f620>] [<e035edec>] [<e038f620>] [<e0350361>] [<e038f620>]=20
[<e0347d75>]
  [<e038d580>] [<e0351f91>] [<e034a040>] [<c01e4bab>] [<e034d5fb>]=20
[<e034e3f1>]
  [<c01f6748>] [<c01e8fdd>] [<c0205800>] [<c01f2c0b>] [<c0205db7>]=20
[<c0205800>]
  [<c0205650>] [<c020565b>] [<c01f2c0b>] [<c0206a1d>] [<c0205650>]=20
[<c0206ee8>]
  [<c02294e0>] [<c0229a1b>] [<c02294e0>] [<e0347d75>] [<e038d580>]=20
[<e03524c7>]
  [<e034a040>] [<c01e4bab>] [<e034d5fb>] [<e034e3f1>] [<c01f6748>]=20
[<c01e8fdd>]
  [<c0205800>] [<c01f2c0b>] [<c0205db7>] [<c0205800>] [<c0205650>]=20
[<c020565b>]
  [<c01f2c0b>] [<c0206a1d>] [<c0205650>] [<c0206ee8>] [<c02294e0>]=20
[<c0229a1b>]
  [<c02294e0>] [<e0347d75>] [<e038d580>] [<e03524c7>] [<e034a040>]=20
[<c01e4bab>]
  [<e034d5fb>] [<e034e3f1>] [<c01f6748>] [<c01e8fdd>] [<c0205800>]=20
[<c01f2c0b>]
  [<c0205db7>] [<c0205800>] [<c0205650>] [<c020565b>] [<c01f2c0b>]=20
[<c0206a1d>]
  [<c0205650>] [<c0206ee8>] [<c02294e0>] [<c0229a1b>] [<c02294e0>]=20
[<e0347d75>]
  [<e038d580>] [<e03524c7>] [<e034a040>] [<c01e4bab>] [<e034d5fb>]=20
[<e034e3f1>]
  [<c01f6748>] [<c01e95fd>] [<c01356af>] [<c011e861>] [<c0120da3>]=20
[<c011b280>]
  [<c011b2a3>] [<c011b332>] [<c011918c>]

messages appear as fast as the console can print them. ksymoops decodes the=
m=20
to

=2E...
Trace; c011e861 <do_IRQ+e1/120>
Trace; c0120da3 <call_do_IRQ+5/12>
Trace; c011b280 <default_idle+0/50>
Trace; c011b2a3 <default_idle+23/50>
Trace; c011b332 <cpu_idle+42/70>
Trace; c011918c <L6+0/2>
Trace; c0120da3 <call_do_IRQ+5/12>
Trace; e0364a81 <[ipsec]aes_encrypt+8d1/f40>
Trace; e0365388 <[ipsec]aes_decrypt+298/f60>
Trace; e036576f <[ipsec]aes_decrypt+67f/f60>
Trace; e03604d0 <[ipsec]ipsec_rcv_esp_decrypt_setup+50/80>
Trace; e038f620 <[ipsec]SHA1Final+18830/25270>
Trace; e035edec <[ipsec]pfkey_msg_interp+8c/337>
Trace; e038f620 <[ipsec]SHA1Final+18830/25270>
Trace; e0350361 <[ipsec].text.lock.ipsec_proc+2c/3b>
Trace; e038f620 <[ipsec]SHA1Final+18830/25270>
Trace; e0347d75 <[ipx].text.lock.af_ipx+115/150>
Trace; e038d580 <[ipsec]SHA1Final+16790/25270>
Trace; e0351f91 <[ipsec]ipsec_tunnel_ioctl+51/240>
Trace; e034a040 <[ipx]ipx_unregister_sysctl+2270/2290>
Trace; c01e4bab <kfree_skbmem+b/70>
Trace; e034d5fb <[ipsec]rj_refines+ab/c0>
Trace; e034e3f1 <[ipsec]rj_walktree+d1/200>
Trace; c01f6748 <qdisc_restart+c8/160>
Trace; c01e8fdd <dev_queue_xmit+18d/430>
Trace; c0205800 <ip_finish_output2+0/150>
Trace; c01f2c0b <nf_hook_slow+15b/1c0>
Trace; c0205db7 <ip_output+137/1e0>
Trace; c0205800 <ip_finish_output2+0/150>
Trace; c0205650 <output_maybe_reroute+0/10>
Trace; c020565b <output_maybe_reroute+b/10>
Trace; c01f2c0b <nf_hook_slow+15b/1c0>
Trace; c0206a1d <ip_build_xmit_slow+3ad/5b0>
Trace; c0205650 <output_maybe_reroute+0/10>
Trace; c0206ee8 <ip_build_xmit+2c8/420>
Trace; c02294e0 <icmp_glue_bits+0/d0>
Trace; c0229a1b <icmp_send+2db/390>
Trace; c02294e0 <icmp_glue_bits+0/d0>
Trace; e0347d75 <[ipx].text.lock.af_ipx+115/150>
Trace; e038d580 <[ipsec]SHA1Final+16790/25270>
Trace; e03524c7 <[ipsec]ipsec_tunnel_init+f7/140>
Trace; e034a040 <[ipx]ipx_unregister_sysctl+2270/2290>
Trace; c01e4bab <kfree_skbmem+b/70>
Trace; e034d5fb <[ipsec]rj_refines+ab/c0>
Trace; e034e3f1 <[ipsec]rj_walktree+d1/200>
Trace; c01f6748 <qdisc_restart+c8/160>
Trace; c01e8fdd <dev_queue_xmit+18d/430>
Trace; c0205800 <ip_finish_output2+0/150>
Trace; c01f2c0b <nf_hook_slow+15b/1c0>
Trace; c0205db7 <ip_output+137/1e0>
Trace; c0205800 <ip_finish_output2+0/150>
Trace; c0205650 <output_maybe_reroute+0/10>
Trace; c020565b <output_maybe_reroute+b/10>
Trace; c01f2c0b <nf_hook_slow+15b/1c0>
Trace; c0206a1d <ip_build_xmit_slow+3ad/5b0>
Trace; c0205650 <output_maybe_reroute+0/10>
Trace; c0206ee8 <ip_build_xmit+2c8/420>
Trace; c02294e0 <icmp_glue_bits+0/d0>
Trace; c0229a1b <icmp_send+2db/390>
Trace; c02294e0 <icmp_glue_bits+0/d0>
Trace; e0347d75 <[ipx].text.lock.af_ipx+115/150>
Trace; e038d580 <[ipsec]SHA1Final+16790/25270>
Trace; e03524c7 <[ipsec]ipsec_tunnel_init+f7/140>
Trace; e034a040 <[ipx]ipx_unregister_sysctl+2270/2290>
=2E..

etc. The only unusual bit on this machine seems to be that there are SNAT=20
rules for traffic going into ipsec interfaces, i.e. with -A POSTROUTING -o=
=20
ipsec0. It runs 10 IPSec tunnels on 2 interfaces, 5 tunnels on each=20
interface.=20

Any ideas what might be wrong? Right now this is a critical problem for us,=
=20
and I would be happy about any pointer what to try. I can spare some time t=
o=20
try and track it down. Currently, we try to remove the SNAT rules and work=
=20
around that, but as we can not trigger the problem (just wait for it to=20
happen, usually a few times a day), we can not reliably check if that fixes=
=20
it.

with best regards,
Rene

=2D-=20
=2D------------------------------------------------
Gibraltar firewall       http://www.gibraltar.at/

--nextPart1933641.grOH8AvMXC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQBErnQXq7SPDcPCS94RAqiqAJ9GPqsQTiwY+X+kiDeSXTLbZle1OACgqYmb
BEB565mh4xH75SX61ZDbyJQ=
=OAUC
-----END PGP SIGNATURE-----

--nextPart1933641.grOH8AvMXC--

