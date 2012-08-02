From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Netfilter and Iptables talk at AWeber
Date: Thu, 2 Aug 2012 17:46:55 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1208021742120.10019@frira.zrqbmnf.qr>
References: <0191896170a6fdc7c917390b79464804@linuxwall.info>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <0191896170a6fdc7c917390b79464804@linuxwall.info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julien <julien@linuxwall.info>
Cc: netfilter <netfilter@vger.kernel.org>

On Wednesday 2012-08-01 23:34, julien wrote:
>
>I figured it would of interest to this list. I am also curious to get 
>feedback from the community, as I will be holding a Netfilter workshop 
>at Fosscon Philadelphia on August 11th. So if you have any comment, 
>please reply here, or to me directly.
>
>http://jve.linuxwall.info/blog/index.php?post/2012/08/01/Netfilter-and-Iptables-talk-at-AWeber

For geoip blocking, there is also -m geoip from Xtables-addons.

AFW is not using -m conntrack though you used it earlier.


And a big grin for the christmas example.
