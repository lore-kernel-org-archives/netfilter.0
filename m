From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: IP Tables slows network response times
Date: Mon, 15 Aug 2005 08:14:54 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0508150813400.24339@yvahk01.tjqt.qr>
References: <200508142133.57867.michael@networkstuff.co.nz>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200508142133.57867.michael@networkstuff.co.nz>
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
To: Michael Hallager <michael@networkstuff.co.nz>
Cc: netfilter@lists.netfilter.org


>iptables -P INPUT DROP
>iptables -A INPUT -p tcp --destination-port 53 -j ACCEPT
>iptables -A INPUT -p udp --destination-port 53 -j ACCEPT

"Think before you rule."

If your NAMED makes a query to the outside world, its _DEFAULT configuration 
will NOT use_ 53 as source port, so --destination-port 53 cannot match.

(Use -m state --state ESTABLISHED)

