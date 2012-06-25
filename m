From: richard lucassen <mailinglists@lucassen.org>
Subject: Re: netmask 255.248.255.0
Date: Mon, 25 Jun 2012 15:36:44 +0200
Message-ID: <20120625153644.c5819099b63cfe2e56c1d227@lucassen.org>
References: <20120625124545.273ae920b609bc0b0da20e9b@lucassen.org>
	<alpine.LNX.2.01.1206251415310.24120@frira.zrqbmnf.qr>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1206251415310.24120@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Mon, 25 Jun 2012 14:15:52 +0200 (CEST)
Jan Engelhardt <jengelh@inai.de> wrote:

> >This can of course be achieved by adding 8 seperate rules using a /24
> >netmask. I tried to catch it in 1 rule and indeed, this seems to work
> >well:
> >
> >10.32.0.0/255.248.255.0
> >
> >but AFAIK this is not documented anywhere. Is this a legitmate way to
> >do this?
> 
> It's documented in Towards The Perfect Ruleset at least ;-)

Ok, I didn't know that doc! Thanks Jan!

R.

-- 
___________________________________________________________________
It is better to remain silent and be thought a fool, than to speak
aloud and remove all doubt.

+------------------------------------------------------------------+
| Richard Lucassen, Utrecht                                        |
| Public key and email address:                                    |
| http://www.lucassen.org/mail-pubkey.html                         |
+------------------------------------------------------------------+
