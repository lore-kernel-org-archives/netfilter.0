From: Jan Engelhardt <jengelh@medozas.de>
Subject: RE: Theoretical question: need for filter table in the POSTROUTING
 chain
Date: Fri, 26 Aug 2011 23:45:32 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1108262343380.24171@frira.zrqbmnf.qr>
References: <4E5634C3.80908@freemail.hu> <4E56617E.4040704@riverviewtech.net> <4E566A88.2040309@freemail.hu> <alpine.LNX.2.01.1108260954570.6835@frira.zrqbmnf.qr> <4E5763AB.10106@freemail.hu> <184D23435BECB444AB6B9D4630C8EC83026484CC@XMB-RCD-303.cisco.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <184D23435BECB444AB6B9D4630C8EC83026484CC@XMB-RCD-303.cisco.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Christian Benvenuti (benve)" <benve@cisco.com>
Cc: =?UTF-8?Q?G=C3=A1sp=C3=A1r_Lajos?= <swifty@freemail.hu>, netfilter list <netfilter@vger.kernel.org>


On Friday 2011-08-26 23:16, Christian Benvenuti (benve) wrote:
>> 
>> Yes, I can filter at the FORWARD and the OUTPUT chain... But why can't
>> I
>> at the POSTROUTING???
>
>By adding filtering support to the POSTROUTING hook you only get one
>benefit:
>
>  Rules that apply to both locally generated traffic (OUTPUT)
>  and forwarded traffic (FORWARD) do not need to be duplicated.
>
>Right?

Yeah, and the rule duplication can be solved by jumping to a 
shared user-defined chain from both OUTPUT and FORWARD.
