From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Theoretical question: need for filter table in the POSTROUTING
 chain
Date: Fri, 26 Aug 2011 11:51:37 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1108261144550.19453@frira.zrqbmnf.qr>
References: <4E5634C3.80908@freemail.hu> <4E56617E.4040704@riverviewtech.net> <4E566A88.2040309@freemail.hu> <alpine.LNX.2.01.1108260954570.6835@frira.zrqbmnf.qr> <4E5763AB.10106@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E5763AB.10106@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: =?UTF-8?Q?G=C3=A1sp=C3=A1r_Lajos?= <swifty@freemail.hu>
Cc: netfilter list <netfilter@vger.kernel.org>


On Friday 2011-08-26 11:13, G=C3=A1sp=C3=A1r Lajos wrote:
>>>
>>> The main question is: Why do not we have such a table in the POSTRO=
UTING
>>> chain?
>>
>>If they did not go through nat, the packet's computed state was most
>>likely INVALID or UNTRACKED to begin with. And that you can already
>>filter for in FORWARD.
>
>I do not get it... If a packet comes from the network then it is
>either goes [...] to FORWARD And there we have nat... If a packet
>comes from the local computer then it leaves out on the OUTPUT
>chain... And there we have nat again... So every packet should be
>tracked at the POSTROUTING chain...

Not every packet is tracked (cf. INVALID/UNTRACKED as I said above).

>Yes, I can filter at the FORWARD and the OUTPUT chain... But why
>can't I at the POSTROUTING??? I do not seek alternatives... (I found
>them... :D) I want to know why it is not "enabled" ???

Nobody needed it so far, because people can filter in FORWARD, and
active hooks have an associated runtime cost.
