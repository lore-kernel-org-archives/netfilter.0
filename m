From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: iptables - Trying to understand "no longer support implicit 
  source local NAT"
Date: Fri, 24 Apr 2009 16:38:44 +0200
Message-ID: <49F1CEF4.9070706@plouf.fr.eu.org>
References: <BLU149-W20F12BA9B98E9D4E82C7CBA3960@phx.gbl> <49C2A535.1040700@kis.keele.ac.uk>     <BLU149-W849B5068E4BA2E436CB5E8A3960@phx.gbl>    <BLU149-W19F71A94268C5665748337A3910@phx.gbl>   <BLU149-W50503F474EE1377D0A838A3840@phx.gbl>  <BLU149-W698B4E09B730ADF7B6660A3840@phx.gbl> <49DA7962.6050600@chello.at>  <BLU149-W217A490D4492B6FD80862BA3840@phx.gbl> <BLU149-W79AC0311DCF953433463CA3750@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BLU149-W79AC0311DCF953433463CA3750@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Data Shock a =E9crit :
>=20
> It is unfortunate that nobody seems to know why this message is there=
,
> or really what it means.

It is just a warning and remainder. As you saw, it would occur at most=20
once after the DNAT module is loaded. So I do not understand why so muc=
h=20
complain for a message happening mostly once a boot at most.

In 2.4 kernels and 2.6 kernels older that 2.6.11, the DNAT target used=20
to implicitly change the source address to reflect the new output=20
interface. Kernels 2.6.11 and above do not do it any more, possibliy=20
causing a loss of connectivy in some special cases. This is the reason=20
of this message, giving the opportunity to add an explicit SNAT rule=20
when required. The given reason for removing explicit source NAT is tha=
t=20
the submitter believed it was not strictly necessary.

The REDIRECT target never changed the source address, so it does not=20
produce the message.

Note that it should not be necessary to explicitly change the source=20
address with a SNAT rule anyway. Don't you have too restrictive=20
filtering rules on the loopback interface ?
