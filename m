From: Alan Ezust <alan.ezust@presinet.com>
Subject: conntrack -e filter by ethernet addr?
Date: Thu, 3 May 2007 10:51:51 -0700
Message-ID: <200705031051.53718.alan.ezust@presinet.com>
References: <200705021656.45401.alan.ezust@presinet.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2860031.dCnfp9aR5O";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200705021656.45401.alan.ezust@presinet.com>
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

--nextPart2860031.dCnfp9aR5O
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

=46irst, please ignore my previous message about the missing conntrack dest=
roy=20
events. I was distracted by another problem that was causing me grief and=20
looking in the wrong place.

I had another question about conntrack - is there an easy way to tell=20
conntrack -e to only report conntrack entries for one ethernet address?

Alternately, I see that I can supply src_mask and a dest_mask, but i'm not=
=20
sure how to specify inverse masks there. For example, I want to specify tha=
t=20
conntrack -e shows me the entries with src or dest which are not in the=20
ranges of  127.127.0.1/24 and 192.168.1.0/24. can I specify multiple invers=
e=20
masks?=20


On Wednesday 02 May 2007 16:56, Alan Ezust wrote:
> I was just wondering, has anyone else observed that conntrack -e (running
> in events mode) sometimes shows me DESTROY events and sometimes does not,
> even for TCP protocol packets. Why would this be?

=2D-=20
Alan Ezust            www.presinet.com
Presinet, inc         alan.ezust@presinet.com
           Victoria, BC, Canada

--nextPart2860031.dCnfp9aR5O
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBGOiE5sJbtw6GURksRAlUCAKCV7Wo3vbhrDbSdbgocsSfXoyG1ZwCgnrzw
mhy7NOvsxu3GfzOV25yXqdE=
=YI60
-----END PGP SIGNATURE-----

--nextPart2860031.dCnfp9aR5O--

