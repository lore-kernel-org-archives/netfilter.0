From: =?ISO-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= 
	<leolistas@solutti.com.br>
Subject: Re: Loopback security...
Date: Tue, 22 Apr 2008 08:01:04 -0300
Message-ID: <480DC570.80303@solutti.com.br>
References: <480D47F6.9080808@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <480D47F6.9080808@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>



Grant Taylor escreveu:
> It is my (mis)understanding that the Linux kernel treats the loopback=
=20
> interface and / or the 127.0.0.1/8 subnet as (in a word) "sacred" and=
=20
> as such secures it.  I believe I understand the mentality of this and=
=20
> do not have a problem with it.
    Are you sure you understand it right ??? What do you mean by 'linux=
=20
consider it secure' ?? do you mean it has no access control by default=20
???? This happens with ALL linux network (logical and phisical) ones. I=
f=20
you need access control on network level, then you got iptables !!!

> However after helping someone work around this problem (via rinetd) I=
=20
> find my self asking wondering is it possible to disable this security=
=20
> on the loopback interface.
    What was the problem solved/workarounded ???? Tell us what happened=
=20
and maybe we'll tell you if using rinetd was a smart solution and, if=20
it's not, maybe give you other better workaround tips.

> Is there a /proc and / or sys control entry that can be throbbed to=20
> allow traffic in to and / or out of the loopback interface?
>

    No seek and hide games .... tell us what's really your problem plea=
se.

    Do you mean loopback interface to throw/receive traffic on your=20
phisical network, ie, ethernet cables ??? If this is your idea, it goes=
=20
against the whole loopback idea and i think it certainly cant be done.


--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it




