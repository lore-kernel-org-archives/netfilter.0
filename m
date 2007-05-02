From: "Elvir Kuric" <omasnjak@gmail.com>
Subject: Re: Port forwarding question
Date: Wed, 2 May 2007 14:00:51 +0200
Message-ID: <1814bfe70705020500m24c58888y4bb9fcb595cfafa2@mail.gmail.com>
References: <4636295F.7040202@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=B3b8oRUQwjb4ZOe4BXwXVKnMoC/nAaH2cog8Gh2cRghc/AdEF1yL/rJJYRkivSbqhPSwGoS6MeSakiiVLo0sMgH1FN5WcBhYDfUh91gE0szGu+p8f7ddFKuKpmANUJN70WbTCzCFTzNCwhmwsC2EHXNXpjvkD2zCFinoAXeBf6I=
In-Reply-To: <4636295F.7040202@gmail.com>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David <shadoweyez@gmail.com>
Cc: netfilter@lists.netfilter.org

Hi all,
maybe you can try this
 iptables -t nat -A PREROUTING -p tcp --dport 10000 -i ppp0 -m iprange
--dst-range 192.168.0.2-192.168.0.254 -j DNAT --to-destination
192.168.0.2-192.168..254

or check
http://iptables-tutorial.frozentux.net/iptables-tutorial.html#IPRANGEMATCH

Regards

Elvir Kuric



On 4/30/07, David <shadoweyez@gmail.com> wrote:
> Hi all - first post, should be a simple question but google and the docs are not
> helping
>
> I want to forward port 10000 from internal hosts to the internet and it works with:
>
> iptables -t nat -A PREROUTING -p tcp --dport 10000 -i ppp0 -j DNAT --to 192.168.0.2
>
> for the host with ip 192.168.0.2, but how do I forward it for a range of hosts,
> ie 192.168.0.2-192.168.0.254
>
> I try
>
> iptables -t nat -A PREROUTING -p tcp --dport 10000 -i ppp0 -j DNAT --to
> 192.168.0.2-192.168.0.254
>
> but it does not work for any other hosts
>
> iptables -L -v -t nat
> gives the range, but does not actually forward the port in any apps
> tcp dpt:10000 to:192.168.0.2-192.168.0.254
>
> How do I forward the range of ports?
> TIA,
> David
>
> ==============================================
> Running gentoo 2.16.18.4, iptables 1.3.5
>
>

