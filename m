From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Troubleshooting stability issue
Date: Thu, 11 Aug 2005 08:00:32 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0508110758020.28320@yvahk01.tjqt.qr>
References: <1123689748.21756.TMDA@mercury.zynet.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1123689748.21756.TMDA@mercury.zynet.net>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Waters <simonw@zynet.net>
Cc: netfilter@lists.netfilter.org


>Symptom is that by the time we get to it, the box is totally unresponsive to 
>local console, is not forwarding packets. In a word "hung".

Then there may be a memory leak. Calm all apps and periodically check the free 
ram or the slab cache sizes, respectively. (Yeah, it's unlikely.)

Check /var/log/messages if it says that a network card timed out.

>Memory isn't obviously leaking.
>
>The number of lines in "ip_conntrack" does appear to grow with time, but is 
>still way below (at around 3000) the maximum allowed of 32,000+, and isn't 
>growing monotonically. I think there may be clues here, if only to what is 
>wrong with the ruleset.

Reduce the maximum number of conntracks then.

>Apart from sshd, there is practically nothing running.
>atd
>crond
>inetd (this has nothing configured in /etc/inetd.conf, so I'll remove it).
>Postfix is listening on 127.0.0.1:25 in case anything local suddenly needs to 
>report anything to me.
>lpd (lpd was running and not listening on any ports, so I'll remove it).

Where's the ftpd?

>Just looking for some helpful pointers on how to investigate this issue 
>further.

/proc/net/ip_conntrack
/proc/net/stat/ip_conntrack

>The hardware doesn't seem to like the stock 2.6 kernels, and I don't have one 
>spare to spend time figuring out why.
Forgot a driver?



Jan Engelhardt
-- 
| Alphagate Systems, http://alphagate.hopto.org/

