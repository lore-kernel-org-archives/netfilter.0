From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: DNAT rule requires extra firewall pinhole
Date: Sat, 26 May 2007 15:44:04 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0705261542250.7344@yvahk01.tjqt.qr>
References: <200705251717.27252.jweber@amsuper.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200705251717.27252.jweber@amsuper.com>
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
To: Jeff Weber <jweber@amsuper.com>
Cc: netfilter@lists.netfilter.org


On May 25 2007 17:17, Jeff Weber wrote:
>
>I've added a firewall rule to block external requests to forward through the 
>gateway:
>
>$IPTABLES -A FORWARD -p tcp -i $DAS_SCADA_IF --syn -j DROP

Well that sounds a little broken, because the first packet of a TCP
connection _is_ SYN.

So you might want

 -p tcp ! -d destaddr ! --dport destport --syn -j DROP here...

Alternatively ...

 -p tcp --syn -m conntrack --ctstate DNAT -j ACCEPT
 -p tcp --syn -j DROP


	Jan
-- 

