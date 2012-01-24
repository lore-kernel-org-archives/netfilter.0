From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [xtables-addons] memory usage in module geoip (probably)
Date: Tue, 24 Jan 2012 13:04:04 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1201241303001.26126@frira.zrqbmnf.qr>
References: <4F19928A.7050005@mejor.pl> <alpine.LNX.2.01.1201201800150.29700@frira.zrqbmnf.qr> <8b53c851c9391f9bc9ce3427acdbab4c@mejor.pl> <alpine.LNX.2.01.1201202156410.13241@frira.zrqbmnf.qr> <4F1C73DB.5060503@mejor.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F1C73DB.5060503@mejor.pl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="windows-1252"
To: =?UTF-8?Q?Marcin_Miros=C5=82aw?= <marcin@mejor.pl>
Cc: netfilter@vger.kernel.org

On Sunday 2012-01-22 21:38, Marcin Miros=C5=82aw wrote:

> W dniu 2012-01-20 22:00, Jan Engelhardt pisze:
>> TARPIT does not have much of a use for random ports without any serv=
ices
>> because it is specific to clients sending data. You should use DELUD=
E at
>> the end of the chain, also because it does not keep any connections
>> around like tarpit.
>
> Hello Jan.
> Meseems TARPIT is what i need, i'd like to slow down (a little) bots =
looking
> for mssql and other MS specific soft.

Then you should use
 -t raw -A PREROUTING -p tcp --dport ms-sql-s -j CT --notrack
if your service is not exposed to the internet.

> How can i track down what is the reason of such situation?

Also compare output of `ss -at`.
