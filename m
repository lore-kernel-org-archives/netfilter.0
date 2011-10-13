From: <abirvalg@lavabit.com>
Subject: limit module timer precision issue
Date: Thu, 13 Oct 2011 01:43:10 +0000
Message-ID: <20111013014310.4369d65e@wwwwww-701SD>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi, it seems to me that limit module has issues with timer precision.
The only iptables rules i have are: 

iptables  -I OUTPUT 1 -m state --state NEW -m limit --limit 2000/sec --limit-burst 1  -j NFQUEUE --queue-num 11220
iptables -I OUTPUT 2 -m state --state NEW -j NFQUEUE --queue-num 11222

iptables  -I INPUT 1 -m state --state NEW -m limit --limit 2000/sec --limit-burst  1 -j NFQUEUE --queue-num 11221
iptables -I INPUT 2 -m state --state NEW -j NFQUEUE --queue-num 11222

(Both NFQUEUE 11220 and 11221 pass only NF_ACCEPT or NF_DROP verdicts.)

If I understand -m limit correctly, only if there is more than 2000 NEW connections going in or out, NFQUEUE 11222 will trigger.
When I seed a torrent, I hardly get 30 NEW connections per second and yet NFQUEUE 11222 triggers every now and then. I tried to lower the bar to --limit 100/sec and it still triggers ocasionally.
The way that I know that it triggers is that my app uses libnetfilter_queue and printf()s whenever it gets triggered, also watching
/proc/net/netfilter/nfnetlink_queue shows a steady growth for NFQ11222 in the column next to the last.

My hunch is that -m limit can't deal with such high precision timing. Could somebody please comment?

