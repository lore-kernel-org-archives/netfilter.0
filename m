From: <abirvalg@lavabit.com>
Subject: nfqueue stuck on queue length >299
Date: Thu, 13 Oct 2011 12:29:38 +0000
Message-ID: <20111013122938.1535fcc9@wwwwww-701SD>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

In my app one thread sends packets to NFQUEUE and another thread processes that NFQUEUE at the rate of 10 packets per second.
I watch the state of NFQUEUEs using watch -n 1 'cat /proc/netnetfilter/nfnetlink_queue'
I noticed that if I nfq_set_queue_maxlen to 299, then when the queue fills up to 299 (3rd column), the overflow gets dropped. As soon as new packets cease to arrive, dequeuing begins at the rate of 10 per second until the 3rd columnn reaches 0. All as expected.

But as soon as I set NFQUEUE maxlen to 300, the following happens - the overflow gets dropped; but when I stop generating new packets, no dequeuing is taking place, the 3rd column seems to be stuck on 299 and from then on packets for that NFQUEUE don't get queued anymore but are dropped instead. The NFQUEUE still processes packets at the rate of 10 per second, but instead of queuing the overflow, it simply drops it.

Is this a bug or a feature? Sure seems like a bug to me.

