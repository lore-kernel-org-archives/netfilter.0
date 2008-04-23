From: =?ISO-8859-15?Q?Leonardo_Rodrigues_Magalh=E3es?= 
	<leolistas@solutti.com.br>
Subject: Re: Loopback security...
Date: Wed, 23 Apr 2008 06:45:00 -0300
Message-ID: <480F051C.6020908@solutti.com.br>
References: <480D47F6.9080808@riverviewtech.net> <480DC570.80303@solutti.com.br> <480DF156.5060801@riverviewtech.net> <480E0CA2.2030902@plouf.fr.eu.org> <slrng0sju6.dhr.petr.pisar@album.ics.muni.cz> <480F0209.4070902@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <480F0209.4070902@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: ML netfilter <netfilter@vger.kernel.org>



Pascal Hambourg escreveu:
> Petr Pisar a =E9crit :
>>
>> No. Loopback interface is just another dummy interface to be able to
>> assign node scope adresses from 127.0.0.0/8 block. The reason for
>> loopback is somobedy wants to have (node scoped) IP socket on machin=
e=20
>> with
>> no real interfaces. It's just a historical relict because IP address
>> needs an interface in Linux.
>
> I disagree. The loopback interface is very different from a dummy=20
> interface. A dummy interface is just a black hole, it cannot do what=20
> the loopback interface does. The loopback interface loops the traffic=
=20
> back to the host and the kernel knows about it, this is what makes it=
=20
> unique.
>
>> E.g. I know about people running IPv6 networks where each router has
>> globally routable addresses on loopaback interface, real ethernet
>> interfaces between routers have only link scope addresses and a
>> dynamic routing protocol (e.g, OSPF) is used to solve routing via
>> network. And of course it works.
>
> So what ? You can do the same with IPv4 and it will work too, at leas=
t=20
> on Linux.

    This thread has gone faaar beyond what's supposed to be this mailin=
g=20
list purpose in my opinion. Seem it's time to accept the fact that=20
loopback interface in linux is NOT a normal interface and, thus, cannot=
=20
be used for things 'normal' interfaces are used. It's time to accept, a=
s=20
well, that routers, as well as all other non-linux OSs, can have anothe=
r=20
approach on their loopback interfaces.

  =20

--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it




