From: Daniel Lopes <lopsch@lopsch.com>
Subject: Re: (no subject)
Date: Thu, 03 Mar 2005 18:17:29 +0100
Message-ID: <422746A9.4060409@lopsch.com>
References: <20686C579479DC438276A726FE80CDAA0294C777@INEXCH1>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20686C579479DC438276A726FE80CDAA0294C777@INEXCH1>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Pmishra@in.safenet-inc.com schrieb:
> Hi Team,
> My requirement is Use SingleIP and different port with different web ba=
sed
> application .
> Requirement :-
> 1.Access all the request from client with PORT 80.
> 2.Check the socket filter or net filet and forward different port as pe=
r
> hint send by client.
> Is it possible in Linux ?
>=20
> Please give me some some technical procedure and help me understand=20
>=20
> Thanks
> Pradeep
>=20
> The information contained in this electronic mail transmission may be
> privileged and confidential, and therefore, protected from disclosure. =
If
> you have received this communication in error, please notify us immedia=
tely
> by replying to this message and deleting it from your computer without
> copying or disclosing it.
>=20
>=20
>=20
If you have only one webserver serving more than one domain, it=B4s usual=
=20
to use the Apache and it=B4s named virtual hosting capabilities, as it is=
=20
used by alot of hosting providers. Then the Apache looks at the client=20
header and serves the request from the DocumentRoot of the domain request=
ed.

