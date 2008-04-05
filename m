From: =?ISO-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= 
	<leolistas@solutti.com.br>
Subject: Re: iptables equivalent of ssh local port forward.
Date: Fri, 04 Apr 2008 21:12:15 -0300
Message-ID: <47F6C3DF.2040805@solutti.com.br>
References: <bac5fd1b0804041635g768b214bq38535a328d81bf7e@mail.gmail.com> <alpine.LNX.1.10.0804050205390.26881@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0804050205390.26881@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: ML netfilter <netfilter@vger.kernel.org>



Jan Engelhardt escreveu:
>
> On Saturday 2008-04-05 01:35, Joel Pearson wrote:
>>
>> I can get iptables forwarding to work fine if the source address is
>> from the internet, well a different interface anyway.  Using a DNAT
>> works fine in these circumstances.  But a DNAT doesn't work to forwa=
rd
>> within the same subnet/interface it seems.
>>
>> Can someone point me in the right direction?
>
> http://jengelh.hopto.org/images/dnat-mistake.png
>

    graph shows clearly the problem, but doesnt gives the solution.

    the host with DNAT rule, when forwarding to a source machine on the=
=20
same subnet of the DNATted machine, should do a SNAT too. DNAT redirect=
s=20
the packet, SNAT changes the source address to the host with DNAT rule=20
address. So, replies will go to the host with DNAT rule and everything=20
will work.

    The big problem of this setup is that the DNATted machine will loos=
e=20
capacity of logging original source address, because it was SNATted.

    On these situations, you could think on a DNS setup with views and=20
replying with internal address for your internal network, avoiding the=20
use of this setup, altough it works completly fine.

--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it




