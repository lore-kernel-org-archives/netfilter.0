From: Thomas Jacob <jacob@internet24.de>
Subject: Re: isp like shaping with tc
Date: Tue, 18 Nov 2008 18:04:46 +0100
Message-ID: <1227027886.24883.21.camel@enterprise.ims-firmen.de>
References: <4922D159.10608@krediidiinfo.ee>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4922D159.10608@krediidiinfo.ee>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Aleksander Kamenik <aleksander@krediidiinfo.ee>
Cc: netfilter@vger.kernel.org


> The current solution where I have 19 groups does not scale to 19*256 groups.

> What solutions exist for linux to make linux into a ISP like bandwidth 
> limiting router?

I haven't tried this myself but: 

Have you looked into the IPMARK iptables extension (in
pom/xtables-addons):

http://www.netfilter.org/projects/patch-o-matic/pom-external.html#pom-external-IPMARK

Their basic usage example seems to be doing more or less what you
want to achieve. 

So its a netfilter list related question after all :-)


