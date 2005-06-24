From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: bolcking gmail in squid
Date: Fri, 24 Jun 2005 05:35:47 -0400
Message-ID: <3063e50506240235521d12a0@mail.gmail.com>
References: <WorldClient-F200506241403.AA03490554@ckarsystems.com>
Reply-To: George Alexandru Dragoi <waruiinu@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <WorldClient-F200506241403.AA03490554@ckarsystems.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: "Sreenivasa Rao.K" <sreenivask@ckarsystems.com>
Cc: netfilter@lists.netfilter.org

acl gmail dstdomain .mail.google.com
acl gmail dstdomain .gmail.com
acl gmail dstdomain .gmail.google.com


And a very first rule like this:

http_access deny gmail

On 6/24/05, Sreenivasa Rao.K <sreenivask@ckarsystems.com> wrote:
>=20
>=20
> HI,
>=20
> Can anyone help me how to block giving access to gmail by allowing
> google.com website in squid.
>=20
>=20
> Regards,
> Sreenivasa Rao.K
>=20
>=20
>=20


--=20
Bla bla

