From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Synflood filtering and Conntrack
Date: Wed, 28 Jul 2010 07:24:38 +0200
Message-ID: <4C4FBF16.50203@chello.at>
References: <4C4F5DCE.2060304@conversis.de>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C4F5DCE.2060304@conversis.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 28.07.2010 00:50, dennisml@conversis.de wrote:
> Hi,
> today I ran into a problem where several IPs where syn-flooding one of
> our webservers. The first issue was that the conntrack table was filled
> up on the firewall and I had to put a NOTRACK rule into the raw table to
> get that "fixed". Once we got a better picture of the situation we
> blocked the offending IPs and things wend back to normal on the web server.
>
> My question is how do I handle this case in a more scalable fashion in
> the future. I found the following rules on the net and they seem to do
> what is needed (namely blocking IPs that create an excessive number of
> syn connections):
>
> iptables -A INPUT -m state --state NEW -p tcp -m tcp --syn \
> -m recent --name synflood --set
> iptables -A INPUT -m state --state NEW -p tcp -m tcp --syn \
> -m recent --name synflood --update --seconds 1 --hitcount 30 -j DROP
>
> What I'm wondering about is the "--state NEW" part. If I re-enable
> connection tracking again for the above rules to work wouldn't these
> fill up again and basically make these rules useless? Or can I
> essentially remove the state module bits and just use the plain packets
> for this since the syn flag is only used in establishing a new
> connection anyway which makes the "--state NEW" bit not necessary?

afaik, the (according) ct entries are destroyed on DROP.

asking the other way round:
what should it remember? - bad packet dropped, awaiting next invalid?

best regards

Mart

