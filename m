From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: mangle squid packets
Date: Tue, 5 Jul 2005 22:32:39 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507052231460.16235@yvahk01.tjqt.qr>
References: <42C5A815.8040301@lanhelp.com.br>
	<Pine.LNX.4.61.0507051347060.28524@yvahk01.tjqt.qr>
	<a0f69e5050705111820d01eb5@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a0f69e5050705111820d01eb5@mail.gmail.com>
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
To: Askar <askarali@gmail.com>
Cc: netfilter@lists.netfilter.org

>Before marking squid packets you have to define route with "ip"
>iproute2 command more info could be find on www.lartc.org , below is
>an example of iproute + iptables for your firewall machine.

As for my part, I (plan to) go with an ebtables solution, which does not 
involve all the bothering with routing. Of course, you need to need to know 
etherbridges :)

