From: Erik =?iso-8859-1?Q?Wikstr=F6m?= <eriwik@itstud.chalmers.se>
Subject: Re: MASQUERADE
Date: Fri, 9 Jul 2004 12:35:13 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040709103513.GA18894@itstud.chalmers.se>
References: <f51b72bc040708204912ab0cc7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <f51b72bc040708204912ab0cc7@mail.gmail.com>
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

On Fri, Jul 09, 2004 at 09:19:58AM +0530, Payal Rathod wrote:

> Hi,
> Is there any different way to do MASQUERADE in kernel 2.6.3-7  with
> iptables v1.2.9?
> I get,
>=20
> # iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
> iptables: Invalid argument
>=20
> A quick look at the man page did not suggest anything.
> Any ideas to what is missing?
>=20
> With warm regards,
> -Payal
>=20
First of all I'd like to say that I'm in no way an expert but are you
sure that you have the right stuff compiled in kernel or as modules? In
2.6.7 I had to select to compile MASQUERADE in the kernel, same thing
with the mangle table if I remember correctly.

--
Erik Wikstr=F6m

