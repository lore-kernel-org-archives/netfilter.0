From: David T-G <davidtg-netfilter@justpickone.org>
Subject: Re: is forwarding compiled in? (was "Re: SuSEfirewall2 and NAT ...")
Date: Mon, 19 May 2003 10:49:13 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030519144913.GA57271@justpickone.org>
References: <20030515203925.GA48230@justpickone.org> <200305161449.29544.faide@alphacent.com> <20030516151617.GC53289@justpickone.org> <200305161954.18096.pc-secure@home.nl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200305161954.18096.pc-secure@home.nl>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: NetFilter Users' List <netfilter@lists.netfilter.org>
Cc: "P.Italiaander" <pc-secure@home.nl>


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Pascal, et al --

=2E..and then P.Italiaander said...
%=20
=2E..
% At first I thought somebody would notice ,but you have a hugh hole in you=
r=20
% firewall :
% so you do:
%=20
% Chain INPUT (policy DROP)
% target     prot opt source               destination
% ACCEPT     all  --  anywhere             anywhere
% ACCEPT     all  --  anywhere             anywhere           state=20
% RELATED,ESTABLISHED

Hmmm...  Yes, now that you've pointed it out I see that :-)

At this point I don't actually care, because I'm having so much trouble
trying to get NATting to work.  But I certainly don't want to stick with
this!

I've decided to give up on the SuSEfirewall2 front end and write the
rules myself.  For one thing, I *don't* have a ppp interface; I use eth0
and eth1!

I wonder if I even have forwarding compiled into the kernel, though.  Per
the 'Masqerading Made Simple' HOWTO I tried

  linux:~ #modprobe ipt_MASQERADE
  modprobe: Can't locate module ipt_MASQERADE

so it isn't a module and yet forwarding doesn't seem to work.  For a last
try (before starting over completely) I will try your


% iptables -A FORWARD -m state --state NEW -i $int_if -o $ext_if -j ACCEPT

suggestion as well.


Thanks a bunch & HAND

:-D
--=20
David T-G                      * There is too much animal courage in=20
(play) davidtg@justpickone.org * society and not sufficient moral courage.
(work) davidtgwork@justpickone.org  -- Mary Baker Eddy, "Science and Health"
http://justpickone.org/davidtg/      Shpx gur Pbzzhavpngvbaf Qrprapl Npg!


--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (FreeBSD)

iD8DBQE+yO7pGb7uCXufRwARAkG1AJ9uuY9+DSsIDRU0HbFeV0eXuok23wCfVQJv
L1Ra/UIj/1rO2ARbvRLh/CE=
=PtSV
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--

