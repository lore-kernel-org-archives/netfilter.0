From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Basic Routing
Date: Wed, 5 Nov 2008 20:49:53 +0100
Message-ID: <018301c93f7f$ac4cf190$04e6d4b0$@info>
References: <490DD23F.7060406@amfes.com> <013f01c93d0c$f4a47410$dded5c30$@info> <490DF4CA.1010808@amfes.com> <490E12DF.6090602@riverviewtech.net> <490E597B.50400@amfes.com> <490E633D.20103@riverviewtech.net> <490F5103.8070409@amfes.com> <490F537B.7070506@amfes.com> <490F5E8E.1050505@riverviewtech.net> <4910E22A.4070705@amfes.com> <018001c93f06$6d8869e0$48993da0$@info> <4911C21F.5000907@riverviewtech.net> <9C4B6E684A354E9B8C325F30A70EC501@dcyb.net> <4911E661.2030505@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4911E661.2030505@riverviewtech.net>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> +---+         +---+         +---+         +---+
> | A +---(x)---+ C +---(y)---+ D +---(z)---+ B |
> +---+         +---+         +---+         +---+
> 
> A knows about network x.
> C knows about networks x and y.
> D knows about networks y and z.
> B knows about network z.
> 
> C does /not/ know about network z.
> D does /not/ know about network x.

Yes you're correct.. I should stop assuming things that I already
figured out in my head but don't write down when replying. (Actually, a
"few" emails ago I wrote an email that describes the exact same as the
above -including art- but I discarded it when I saw your answer which
was even more complete.)

> We have already covered the IP forwarding in another email.  As far
> as the firewalling is concerned, you are correct.  However I believe
> Daniel said that there was no firewalling (yet).

Nope, there was no word about firewalling, just NAT and routing.

> Agreed.  I think both are likely good ways to learn about
> firewalling, specifically IPTables.  Seeing as how this
> discussion is about routing...

We started with NAT, which is something that netfilter can do and what
the tutorial also describes, and routing. I was hoping that Daniel would
see why he didn't need NAT by reading it.

Daniel, this is getting lengthy and I think everything that needed to be
said has been said about NAT and routing. I hope things are (more) clear
now.


Grts,
Rob


