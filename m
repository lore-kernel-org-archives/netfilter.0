From: Alexandru Dragoi <alex@zoomnet.ro>
Subject: Re: Policy routing with mark not working.
Date: Thu, 11 May 2006 00:24:51 +0300
Message-ID: <44625A23.30606@zoomnet.ro>
References: <20060510202615.51988.qmail@web53303.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060510202615.51988.qmail@web53303.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Andre Kalamandeen <x_trodinary@yahoo.com>
Cc: netfilter@lists.netfilter.org

Andre Kalamandeen wrote:

>Hey all im trying to mark packets and use the kernel
>routing table to get the packets to go where i want.
>The problem that i have with this is that even though
>the packets are being marked (I checked using
>"iptables -t mangle -vnL") it doesnt seem to be going
>through the correct route. I;ve followed this guide : 
>
>http://edseek.com/archives/2006/05/01/configuring-multipath-routing-for-ports-without-balancing/
>
>but all traffic goes through the default route and not
>the marked one. 
>
># ip rule gives:
>0: from all lookup local
>200: from all fwmark 0x4 lookup 201
>32766: from all lookup main
>32767: from all lookup default
>
># ip route show table 201
>default via 192.168.77.2 dev eth3
>
>the iptables command i use to mark is:
># iptables -t mangle -A PREROUTING -m string --algo bm
>--string "yahoo.com" -j MARK --set-mark 0x4
>
>i've also flushed the route cache,....any help?
>
>Thanks.
>
>__________________________________________________
>Do You Yahoo!?
>Tired of spam?  Yahoo! Mail has the best spam protection around 
>http://mail.yahoo.com 
>
>  
>
That rule maybe routes only some packets of a connection, not the entire
stream. as a tip, it is good to put some static routes in table 201, like
# ip ro add 182.168.77.0/24 dev eth3 table 201
and so on with all local networks


