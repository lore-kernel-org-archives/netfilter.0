From: Linus =?utf-8?Q?L=C3=BCssing?= <linus.luessing@c0d3.blue>
Subject: bridge-nf-call-iptables: checking bridge vs. IP context?
Date: Mon, 29 Mar 2021 20:08:27 +0200
Message-ID: <20210329180827.GE2742@otheros>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I'm wondering whether I'm currently overlooking a simple solution
for the following:

When setting bridge-nf-call-iptables = 1, is there a simple way to
check within one iptables rule whether it matched from a bridge
netfilter hook or from an IP netfilter hook?

"--physdev-is-bridged" seemingly is not quite what I'm looking
for, as it will only match after a bridging decision, in the
FORWARD or POSTROUTING chains.


If that does not exist yet, what would be the preferred,
upstreamable format: Adding a flag to "struct nf_bridge_info" or
are there some other, already existing fields I could use to
verify the context?

Regards, Linus
