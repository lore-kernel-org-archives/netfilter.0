From: zynkx <skydive@megamail.pt>
Subject: Re: (no subject)
Date: Wed, 26 Nov 2003 20:31:40 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1069878700.3fc50dac4e6f3@paris-hme1>
References: <1069853846.3fc4ac966be15@paris-hme1>
 <3FC4B435.5010805@Loudoun-Fairfax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <3FC4B435.5010805@Loudoun-Fairfax.com>
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
To: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Cc: netfilter@lists.netfilter.org

C=F3pia Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>:

> zynkx wrote:
>
> >yahoo and hotmail ip ranges? does anyone knows
> this ip
> >ranges? need to allow them in my smtp
> prerouting
> >rulez  :))
> >
> >
> >
>
> I don't know the answer and I'd be surprised if
> anyone else here does.
> You can probably get that info from
> http://www.iana.org/ but it may be
> easier to contact Yahoo and Hotmail and ask
> them directly. Out of
> curiosity, why are you filtering smtp in your
> PREROUTING chain? Are you
> DNATing mail based on the sender's domain?
>
> Jeff
>
>
>
>=20

hi jeff!

you're right...! here's what it's gonna be and sorry=20
for my lack of clarity ;))  [][] **

i have an smtp running, and i just made a ruleset so i=20
can only allow portuguese traffic incoming. i now=20
would need the list of ip ranges from yahoo and=20
hotmail so i can allow them in my forward chain, since=20
i already made the por forwarding in my prerouting=20
chain! since i put forward chain on DROP, i now need=20
to allow the ip ranges i need to have the hotmail keep=20
on coming! i'm doing fine with the portuguese MX's :)

all i need id to allow those two.=20

just thought anyone here might know that

again i apologise for not being clear enough


:)))

[][][] * * *

unix is user friendly. it's just selective when=20
choosing=20
friends.

-------------------------------------------------
Email Enviado utilizando o servi=E7o MegaMail


