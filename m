From: "Stanislav Puffler DiS." <stanislav.puffler@seznam.cz>
Subject: Re: still =?ISO-8859-1?Q?can=B4t_FORWARD_tcp_on_25_por?=
 =?ISO-8859-1?Q?t_to_another___destination=2E=2E=2E?=
Date: Fri, 12 Mar 2004 18:34:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4051F4AA.9060505@seznam.cz>
References: <4051CF98.1020008@seznam.cz> <4051EB52.1000609@seznam.cz> <200403121713.18380.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403121713.18380.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Antony Stone wrote:

>On Friday 12 March 2004 4:54 pm, Stanislav Puffler DiS. wrote:
>
> =20
>
>>Stanislav Puffler DiS. wrote:
>>   =20
>>
>
> =20
>
>>Could it be a problem, that I don=B4t have any modules in kernel to
>>forward these packets or make masquerade ? Is it possible to install
>>iptables if I haven=B4t got any modules or functions compiled in kernel ?
>>   =20
>>
>
>This could be your problem, yes.
>
>In order to do nat, you *must* have nat support either compiled in or load=
ed=20
>as a module - otherwise your netfilter setup just can't do it.
>
>Do you get any errors when you enter the nat rules?
>
>Antony.
> =20
>
The problem is, that I don=B4t get any errors when entering the nat rules=20
:o( Don=B4t know where is it ...

