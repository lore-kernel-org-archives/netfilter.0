From: Jean-Philippe Menil <jean-philippe.menil@univ-nantes.fr>
Subject: Re: Virtual packet tracer for iptables
Date: Fri, 08 Jun 2012 14:59:20 +0200
Message-ID: <4FD1F728.8050107@univ-nantes.fr>
References: <4FD1E2B1.80801@open.ch> <4FD1E87C.5020004@univ-nantes.fr> <4FD1F102.2010609@open.ch>
Reply-To: jean-philippe.menil@univ-nantes.fr
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4FD1F102.2010609@open.ch>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Stefan Keller <sk@open.ch>
Cc: netfilter@vger.kernel.org

Le 08/06/2012 14:33, Stefan Keller a =E9crit :
>> not sure to understand what you mean.
>> But you have the TRACE target who can help you.
>> "This target marks packets so that the kernel will log every rule wh=
ich
>> match the packets as those traverse the tables, chains, rules."
>>
>> Hope this help.
>>
> Hi Jean-Philippe
>
> Thanks for your reply!
> We did some tests with the TRACE target. But if you use
> this target, then you need real traffic that matches the
> rule base - meaning an off-line analysis is not possible.
> Further, we realized that it is quite hard to simulate
> a packet that would match the FORWARD chain (we did not
> make it that it was accepted by the system).
>
> As a side note:
> We run systems with up to 50,000 concurrent sessions
> and an iptables rule base with few thousands of lines.
> If we activate the TRACE target, we will get a huge
> number of log entries!
>
> I look for a tool that could provide the matching rules
> without real traffic - just with the information how the
> packet would look like (a virtual packet).
> For this purpose, one could use the output of iptables-save
> or there might be an interface I'm not aware of provided
> by netfilter.
> This tool would not show me what rules currently match.
> It is more a hypothetical question: What rule(s) would match
> if I had a packet like this?
>
> Hope this helps to clarify my request.
>
> Best regards
> Stefan Keller
>
>
Hi,

i understand better what you mean by "virtual".
I'm not aware of such tool or target for iptables.

But you do not have to enable TRACE for all your sessions, only
the informations you are looking for.

Regards.

--=20
Jean-Philippe Menil - P=F4le r=E9seau Service IRTS
DSI Universit=E9 de Nantes
jean-philippe.menil@univ-nantes.fr
Tel : 02.53.48.49.27 - Fax : 02.53.48.49.09

