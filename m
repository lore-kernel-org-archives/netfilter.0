From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: --iif unrecognised in ROUTE target
Date: Tue, 3 Apr 2007 07:45:35 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0704030745100.18387@yvahk01.tjqt.qr>
References: <3511.196.25.255.195.1175542625.squirrel@mail.darwinistic.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3511.196.25.255.195.1175542625.squirrel@mail.darwinistic.com>
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
To: Andi Reinbrech <andi@darwinistic.com>
Cc: netfilter@lists.netfilter.org


On Apr 2 2007 21:37, Andi Reinbrech wrote:
>
>I am trying to route packets from ppp0 or eth0 to lo, and it seems that
>the only way to do this is to mangle the packet and rewrite it's if with a
>"-j ROUTE --iif lo" route.
>
>When I configure the following rule, I get an error:
>
>iptables -t mangle -A PREROUTING -d 192.168.0.1 -p tcp --dport 9898 -j
>ROUTE --iif lo
>
>returns:
>
>iptables v1.3.7: Unknown arg `--iif'

Besides that it works for me, just what are you trying to accomplish
that you need to rewrite it to "lo"?


Jan
-- 

