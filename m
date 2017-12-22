From: Robert White <rwhite@pobox.com>
Subject: Re: limit + log + tcp not working ?
Date: Fri, 22 Dec 2017 19:45:49 +0000
Message-ID: <64babe0d-7b38-1f6f-e192-1f4aa79a0fd6@pobox.com>
References: <CANSGRxTJHLttrZw6Oy+mfxN07ow_fq9yuO=X=JsJv6wuLDgSjg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CANSGRxTJHLttrZw6Oy+mfxN07ow_fq9yuO=X=JsJv6wuLDgSjg@mail.gmail.com>
Content-Language: en-CA
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: paulo bruck <paulobruck1@gmail.com>, netfilter@vger.kernel.org, pauloric <pauloric@contatogs.com.br>

On 12/21/2017 02:03 PM, paulo bruck wrote:
> counter packets 7077 bytes 690164 tcp sport http counter packets 54
> bytes 15716 log prefix "acesso a porta 80" flags all counter packets
> 54 bytes 15716 limit rate 10 bytes/minute counter packets 0 bytes 0
> 
> counter packets 7077 bytes 690164 tcp sport http counter packets 54
> bytes 15716 limit rate 10 bytes/minute counter packets 0 bytes 0 log
> prefix "acesso a porta 80" flags all counter packets 0 bytes 0

Read those limits again...

limit rate 10 _bytes_ per _minute_.

That rate limit will _always_ fail as it is too short to even admit a
single HTTP request header. "GET / HTTP/1.1" is already 14 bytes before
the CR/LF that ends the line.

If you want ten _packets_ a minute you need to use "limit rate
10/minute" not "limit rate 10 bytes/minute"

So the limit is a test expression, and it is failing as it should, and
that ends the rule evaluation so none of the subsequent elements of the
rule take effect.

--Rob.
