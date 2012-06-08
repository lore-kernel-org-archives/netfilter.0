From: Jean-Philippe Menil <jean-philippe.menil@univ-nantes.fr>
Subject: Re: Virtual packet tracer for iptables
Date: Fri, 08 Jun 2012 13:56:44 +0200
Message-ID: <4FD1E87C.5020004@univ-nantes.fr>
References: <4FD1E2B1.80801@open.ch>
Reply-To: jean-philippe.menil@univ-nantes.fr
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4FD1E2B1.80801@open.ch>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Stefan Keller <sk@open.ch>
Cc: netfilter@vger.kernel.org

Le 08/06/2012 13:32, Stefan Keller a =E9crit :
> Hi
>
> I'm quite sure that I'm not the first guy asking for such a
> functionality but I could not find anything in the Internet
> nor in the netfilter mailing list.
>
> Is there any tool or iptables extension to query the iptables
> rule base? What I mean is something that needs input parameters
> such as
>
> - source IP address
> - destination IP address
> - source Port
> - destination Port
> - incoming interface
> - outgoing interface
> - ToS
> - FWMARK
> - ...
>
> and the output is the matching rules of all tables (mangle, raw,
> nat and filter table).
> I know that the output only shows half of the truth for traffic that
> needs a helper such as FTP and SIP but it would be perfect for
> off-line analysis and for debugging purposes of our large environment=
=2E
>
> Thank you for sharing your experiences!
>
> Best regards
> Stefan Keller
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
Hi,

not sure to understand what you mean.
But you have the TRACE target who can help you.
"This target marks packets so that the kernel will log every rule which=
=20
match the packets as those traverse the tables, chains, rules."

Hope this help.

--=20
Jean-Philippe Menil - P=F4le r=E9seau Service IRTS
DSI Universit=E9 de Nantes
jean-philippe.menil@univ-nantes.fr
Tel : 02.53.48.49.27 - Fax : 02.53.48.49.09

