From: Aleksander Kamenik <aleksander@krediidiinfo.ee>
Subject: Re: isp like shaping with tc
Date: Wed, 19 Nov 2008 14:51:32 +0200
Message-ID: <49240BD4.8000206@krediidiinfo.ee>
References: <4922D159.10608@krediidiinfo.ee> <1227027886.24883.21.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1227027886.24883.21.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Thomas Jacob wrote:

> Have you looked into the IPMARK iptables extension (in
> pom/xtables-addons):
> 
> http://www.netfilter.org/projects/patch-o-matic/pom-external.html#pom-external-IPMARK
> 
> Their basic usage example seems to be doing more or less what you
> want to achieve. 

This solves the marking the connections and assigning them to a queue 
part, but there would still have to about 6000 qdisc leafs created (One 
for each possible IP). Don't know whether this scales, but will test. 
Looks promising anyhow.

So I'm at least half way there, thanks!

Nevertheless, what would be the correct list/group to discuss tc queue 
disciplines?

Regards,

-- 

Aleksander Kamenik
System Administrator
Krediidiinfo AS
an Experian Company
Phone: +372 665 9649
Email: aleksander@krediidiinfo.ee

http://www.krediidiinfo.ee/
http://www.experiangroup.com/
