From: Torsten Luettgert <ml-netfilter@enda.eu>
Subject: Re: Best kernel version
Date: Tue, 20 Nov 2012 10:13:28 +0100
Message-ID: <20121120101328.76e11aab@goldlack.enda.eu>
References: <CAFpD06RRrCJMQ-9Cqkb98fwj=bLYyPQf4m9OahuLSEFRernK=Q@mail.gmail.com>
	<alpine.LNX.2.01.1211172241450.24164@nerf07.vanv.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1211172241450.24164@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Jan Engelhardt <jengelh@inai.de>

On Sat, 17 Nov 2012 22:42:29 +0100 (CET)
Jan Engelhardt <jengelh@inai.de> wrote:

> On Saturday 2012-11-17 22:19, Giuseppe Longo wrote:
> 
> >Hi,
> >what is the best kernel version to utilize with netfilter module?
> 
> The ones from the future.

Jan,

it's perfectly ok for you to not like questions like these, or find
them ill-posed or even dumb. Still, sarcastic answers won't make anyone
happier and create a hostile, elitist climate. I'd suggest you just let
the less exalted listeners on this list - like me - handle this stuff
and concentrate on other questions.

@Giuseppe: that is a question with no simple answer. It all depends on
what you want to use. If you're after the most bleeding-edge features,
by all means use the latest kernels available.

If you're after more standard stuff, I'd suggest using one of the
"longtime support" kernels, like 3.0, 3.2 or 3.4. Bug fixes still enter
those trees, but potentially destabilizing new features don't, so
that's exactly what you'll want if you're after stability.

Hope that helps,
Torsten
