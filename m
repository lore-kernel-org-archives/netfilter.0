From: Patrick Leslie Polzer <leslie.polzer@gmx.net>
Subject: Re: invalid argument
Date: Mon, 5 Jul 2004 14:24:49 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040705142449.23a1bbfe.leslie.polzer@gmx.net>
References: <20040705115954.75329.qmail@web50209.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040705115954.75329.qmail@web50209.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Mon, 5 Jul 2004 08:59:54 -0300 (ART)
Luis GUSTAVO <lgpcf@yahoo.com.br> wrote:

> i=B4m using the follow rule:
> iptables -t nat -A POSTROUTING -o eth0 -J MASQUERADE
> invalid argument
>=20
> what is this... my rule is ok.
No. It has to be a lower-case 'j'.

Leslie

