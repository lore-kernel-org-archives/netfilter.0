From: =?ISO-8859-1?Q?Ricardo_J=2E_M=E9ndez?= <mendezster@gmail.com>
Subject: Re: IP forwarding
Date: Thu, 4 Aug 2005 16:20:30 -0600
Message-ID: <286cf08205080415204aed815@mail.gmail.com>
References: <286cf082050803183749d1f514@mail.gmail.com>
	<200508040415.j744FBjF040033@fenyo.mail.t-online.hu>
	<5d2f3791050803220225ab8670@mail.gmail.com>
	<286cf082050804114220fcca1f@mail.gmail.com>
	<5d2f3791050804143370a332d8@mail.gmail.com>
Reply-To: =?ISO-8859-1?Q?Ricardo_J=2E_M=E9ndez?= <mendezster@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5d2f3791050804143370a332d8@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Thanks for the pointer, it's working now.  It was indeed the SNAT that
was missing.


-- R.

On 8/4/05, curby . <curby.public@gmail.com> wrote:
> On 8/4/05, Ricardo J. M=E9ndez <mendezster@gmail.com> wrote:
> > But I 'm testing this from a desktop on the network, not the firewall
> > itself. PREROUTING should apply to those packets, correct?
>=20
> In that case, the problem you're seeing is exactly that which is
> discussed in the HOWTO link I posted last time.  It's also explained
> by Jason's link.  The idea is that packets TO the server are indeed
> being correctly mangled by the router, but return packets go directly
> from server to client.  The client expects the reply from the router,
> sees some spurious traffic from the server, and drops the traffic.
>=20
> The netfilter list sees some variation of this question once every
> week or so.  You're definitely not alone. =3D)
>=20
> Another attempt to explain it:
> https://lists.netfilter.org/pipermail/netfilter/2005-July/061636.html
>=20


--=20


Ricardo J. M=E9ndez
http://ricardo.strangevistas.net/

