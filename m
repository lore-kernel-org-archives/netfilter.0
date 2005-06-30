From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: connection tracking and DNS
Date: Thu, 30 Jun 2005 13:02:16 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0506301301001.3095@yvahk01.tjqt.qr>
References: <20050630004337.OEHG11566.amsfep12-int.chello.nl@localhost>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050630004337.OEHG11566.amsfep12-int.chello.nl@localhost>
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
To: vincent.panel@chello.be
Cc: netfilter@lists.netfilter.org

>Hi !
>
>I had a look at the site and did not find a lot of documentation about 
>connection tracking. I only found modules for ftp, mms, talk, sip, quake and 
>a few others : does it mean that other protocols are not conntracked ?

There's not much to conntrack with UDP for it's a connectionless protocol.
For bigger DNS queries, TCP is used nonetheless, so you can match the 
connection.

>Then, I'm wondering how connection tracking is dealing with DNS (and more 
>generally UDP) requests and replies : is it based on ports (when a connection 
>from port 3350 to 53 occurs, iptables expect an answer from port 53 to port 
>3350) ? is it based on any magical number inside the packet header ?

DNS query: localhost:12345 -> dnsserver:53
DNS reply: dnsserver:53 -> localhost:12345

If the reply happens within 30 seconds to the query, netfilter will handle it 
without problems.


Jan Engelhardt                                                               
--                                                                            
| Gesellschaft fuer Wissenschaftliche Datenverarbeitung Goettingen,
| Am Fassberg, 37077 Goettingen, www.gwdg.de

