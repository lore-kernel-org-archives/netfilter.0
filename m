From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: host based redirect
Date: Sun, 4 May 2008 13:04:12 +0200
Message-ID: <004101c8add6$95899ed0$c09cdc70$@info>
References: <481D93B8.8050306@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <481D93B8.8050306@gmail.com>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> it is not possible to make netfilter parse http headers, redirect
> accordingly to Host header ?

No, Netfilter is a packetfilter.

> can someone please suggest me some software which could be used to
> achieve this ? > squid can, but i think it is likely very bloated.

I don't think Squid is "very bloated". But if redirecting is all you
want to do, you could take a look at pound (http://www.apsis.ch/pound/)
or search for "reverse http proxy" using Google.


Grts,
Rob


