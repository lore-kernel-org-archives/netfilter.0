From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: DNAT, SNAT, Portforward
Date: Fri, 1 Nov 2002 09:45:42 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211010945.42719.netfilter@newkirk.us>
References: <34BE59D9.590F1486.03240133@netscape.net> <200211010108.18555.netfilter@newkirk.us> <20021101085825.SDDP292.mta03-svc.ntlworld.com@there>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021101085825.SDDP292.mta03-svc.ntlworld.com@there>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Friday 01 November 2002 03:58 am, Antony Stone wrote:
> On Friday 01 November 2002 6:08 am, Joel Newkirk wrote:
> > Question to list:  At what point in its own travels does the returnin=
g
> > packet get automatically un-DNATed?  Prerouting again?
>
> No, it happens in POSTROUTING - because it is then a SNAT operation.
>
> Useful rule of thumb - in the FORWARD chain, all packets have their "re=
al"
> IP addresses.
>
> That's because DNAT rules have already happened in PREROUTING, so packe=
ts
> now have the destination address of the machine they're really being se=
nt
> on to, and SNAT rules have not yet happened in POSTROUTING, so packets
> still have the source address of the machine they really came in from.

Is there any chance then of interference from a masquerade rule in postro=
uting?
Or do the automatic reversals take precedence?

j

