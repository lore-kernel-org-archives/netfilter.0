From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: still =?iso-8859-1?q?can=B4t=20FORWARD=20tcp=20on=2025=20port=20to=20another=20?=
  destination...
Date: Fri, 12 Mar 2004 17:13:18 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403121713.18380.Antony@Soft-Solutions.co.uk>
References: <4051CF98.1020008@seznam.cz> <4051EB52.1000609@seznam.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4051EB52.1000609@seznam.cz>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Friday 12 March 2004 4:54 pm, Stanislav Puffler DiS. wrote:

> Stanislav Puffler DiS. wrote:

> Could it be a problem, that I don=B4t have any modules in kernel to
> forward these packets or make masquerade ? Is it possible to install
> iptables if I haven=B4t got any modules or functions compiled in kernel=
 ?

This could be your problem, yes.

In order to do nat, you *must* have nat support either compiled in or loa=
ded=20
as a module - otherwise your netfilter setup just can't do it.

Do you get any errors when you enter the nat rules?

Antony.

--=20
You can spend the whole of your life trying to be popular,
but at the end of the day the size of the crowd at your funeral
will be largely dictated by the weather.

 - Frank Skinner

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


