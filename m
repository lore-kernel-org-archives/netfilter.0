From: Data Shock <datashock@hotmail.com>
Subject: RE: Is a match-all rule with jump to empty chain processed?
Date: Tue, 14 Sep 2010 16:34:45 -0400
Message-ID: <BLU124-W24B1E66C903ACCF11AF903A3780@phx.gbl>
References: <BLU124-W223DA5F1742B40AD5E2ABBA3780@phx.gbl>,<alpine.LNX.2.01.1009141954390.23103@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1009141954390.23103@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org


Thank you for your reply.


> Jumping to arbitrary tables is not within the design.

I'm not sure I understand this statement. Can you please elaborate?


> That is a chain, not a table.

Ooops!=A0 My mistake.=A0 I've been using iptables so much that I find m=
yself mistakenly calling chains "tables".=A0 I thought I had checked fo=
r that before sending my e-mail. :)


> And yes, it is processed including
> overhead, as is done in many other kernel subsystems. The kernel real=
ly
> is not responsible for the user's misdeeds. not use empty chains :)

OK.=A0 I thought that the code might optimize and ignore the jump if th=
e chain was empty, as if the rule was simply: "-t filter -A INPUT".=A0 =
This way it would just count the packet and data without needing to pro=
cess an empty chain, possibly avoiding call stack and other overhead fo=
r what is basically a no-op.=A0 I have not had a chance to trace the co=
de to find out exactly how it operates.



I appreciate the information.
 		 	   		  