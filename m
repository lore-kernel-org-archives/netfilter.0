From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: netmask 255.248.255.0
Date: Mon, 25 Jun 2012 14:15:52 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1206251415310.24120@frira.zrqbmnf.qr>
References: <20120625124545.273ae920b609bc0b0da20e9b@lucassen.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120625124545.273ae920b609bc0b0da20e9b@lucassen.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Monday 2012-06-25 12:45, richard lucassen wrote:

>This can of course be achieved by adding 8 seperate rules using a /24
>netmask. I tried to catch it in 1 rule and indeed, this seems to work
>well:
>
>10.32.0.0/255.248.255.0
>
>but AFAIK this is not documented anywhere. Is this a legitmate way to
>do this?

It's documented in Towards The Perfect Ruleset at least ;-)
