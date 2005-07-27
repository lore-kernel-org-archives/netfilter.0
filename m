From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: RE: not solve yet!!!
Date: Wed, 27 Jul 2005 08:27:28 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507270826530.10780@yvahk01.tjqt.qr>
References: <200507261217.j6QCHbEN024479@linux01.gwdg.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200507261217.j6QCHbEN024479@linux01.gwdg.de>
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
To: Anthony Sadler <anthonys@faredge.com.au>
Cc: netfilter@lists.netfilter.org

>This is the rule I use on our servers:
>
>"iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j REDIRECT
>--to-port 3128"
>
>The only difference I can see is in the order... I don't know if that
>matters.

Order is a little more important than on most posixy apps. You can't, for 
example, specify --dport without giving -p tcp beforehand.



Jan Engelhardt
-- 
| Alphagate Systems, http://alphagate.hopto.org/

