From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Modify packet without NAT
Date: Sun, 18 Jun 2023 11:14:59 +0200
Message-ID: <68081ede-21a0-48be-aecc-d959f317bcb5@thelounge.net>
References: <GYTTaXkbSkEr3VAyArWUUy2ZOCgqBJ91AiJN2WBVdBUQrUJaHAUkn42u5EVDlPZXwlUJW49u1XMxGnJku_TPIRqLB4KXyBWUsEnw2LWef-k=@proton.me>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <GYTTaXkbSkEr3VAyArWUUy2ZOCgqBJ91AiJN2WBVdBUQrUJaHAUkn42u5EVDlPZXwlUJW49u1XMxGnJku_TPIRqLB4KXyBWUsEnw2LWef-k=@proton.me>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: public1020 <public1020@proton.me>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>



Am 17.06.23 um 05:22 schrieb public1020:
> I have a simple nat configuration to forward certain access to a gateway:
> 
> iptables -t nat -A PREROUTING -p tcp -m set --match-set http_port dst,dst -j DNAT --to-destination XXX:80
> iptables -t nat -A POSTROUTING -j MASQUERADE
> 
> Can I do that without nat? Just trying to avoid the "conntrack table full" issue.
> Is there a non-stateful solution?

conntrack don't depend on NAT at all but nearly any useful setup depends 
on conntrack

i can't think of a useful ruleset without RELATED,ESTABLISHED rules and 
ctstate *is* conntrack

in other words: without explicit "CT notrack" in the RAW-table there is 
*always* conntrack

fix your config instead trying to work aorund it

[root@firewall:~]$  cat /etc/modprobe.d/iptables-conntrack.conf
options nf_conntrack hashsize=524288 expect_hashsize=2048
