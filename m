From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: Re: MASQUERADE/SNAT before IPsec
Date: Mon, 4 Feb 2008 10:48:51 +0100
Message-ID: <BAY103-DAV11310E55CA4ED35DB98CE7B2330@phx.gbl>
References: <20080202220014.ab018f1d.rumi_ml@rtfm.hu><BAY103-DAV9E97CD56D54A10E4D90C4B2310@phx.gbl><20080203011009.14cf09ea.rumi_ml@rtfm.hu><BAY103-DAV2B2147898979C3A7FA314B2320@phx.gbl> <20080203191923.b146b7ed.rumi_ml@rtfm.hu>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: RUMI Szabolcs <rumi_ml@rtfm.hu>, netfilter@vger.kernel.org

RUMI Szabolcs wrote:

> iptables -t nat -A POSTROUTING -s 10.1.1.0/24 -d 164.99.192.0/22 -j
SNAT --to-source 164.99.195.8

> The IP address in --to-source 164.99.195.8  is the one that was
> dynamically allocated by the remote corporate VPN concentrator
> (not under my control) at the time I've tested the setup.

> I cannot make an iproute2 dump because I'm using the oldskool

which ike/ipsec implementation are you using?

> and goes through iptables and gets NATed in the POSTROUTING
> chain it goes straight out to eth0 and it does not get
> reevaluated whether it should be handled by IPsec.

mhhh which kernel version?


