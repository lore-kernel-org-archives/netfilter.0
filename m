From: =?iso-8859-15?Q?=22Mart=EDn_P._Fiumara=22?= <martin@familia-fiumara.com.ar>
Subject: Re: Fwd: Re: Ports closed in spite of opening them?
Date: Fri, 02 Apr 2004 12:37:36 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <opr5t5oyf01w9p8w@familia-fiumara.com.ar>
References: <200404021628.38527.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404021628.38527.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="flowed"; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

iptables DOES NOT open ports in the strict sense. What iptables does is=20
allow/deny (redirect, etc) traffic THROUGH the port
You need an aplicacion, a service, listening so a port es to be open.



En Fri, 2 Apr 2004 16:28:38 +0100, Antony Stone=20
<Antony@Soft-Solutions.co.uk> escribi=F3:

> On Friday 02 April 2004 4:09 pm, Hurley, Michael wrote:
>
>> Trying to write an iptables script to open ports 22, 25, 80, and 443 on =

>> a
>> little testing box. The problem is, when I scan for open ports, 25 and=20
>> 443
>> report they are *closed*. Any idea what might be going on here?
>
> Do you have services actually listening on those ports?   Can you=20
> connect to
> them from a suitable client running on the machine you did the port scan
> from?
>
> Regards,
>
> Antony.
>
> --
> RTFM may be the appropriate reply, but please specify exactly which FM=20
> to R.
>
>                                                      Please reply to the =

> list;
>                                                      please don't CC me.
>
>
>
>



--=20
Usando M2, el revolucionario cliente de correo: http://www.opera.com/m2/

