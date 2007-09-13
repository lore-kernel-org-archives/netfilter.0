From: Jorge Davila <davila@nicaraguaopensource.com>
Subject: Re: INPUT and uid-owner
Date: Thu, 13 Sep 2007 12:34:57 -0600
Message-ID: <web-24657908@bk3.webmaillogin.com>
References: <9ace7c010709130520l249e5952ib39dca1d601cd68c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9ace7c010709130520l249e5952ib39dca1d601cd68c@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <http://lists.netfilter.org/pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: SoFy DeNiro <sofy.guru@gmail.com>, netfilter@lists.netfilter.org

Sofy:

The uid-owner match is not longer supported.

Jorge D=E1vila.

On Thu, 13 Sep 2007 15:20:18 +0300
  "SoFy DeNiro" <sofy.guru@gmail.com> wrote:
> Hi,
>=20
> Is there's anyway to use INPUT chain with uid-owner ?
>=20
> something like that :
>=20
> iptables -A INPUT -p tcp -mowner --uid-owner root --dport 80 -j DROP
>=20
> Thanks,
> SoFy.
>=20
>=20

Jorge Isaac Davila Lopez
Nicaragua Open Source
+505 430 5462
davila@nicaraguaopensource.com

