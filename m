From: "John Black" <black@arbbs.net>
Subject: Re: ip alias
Date: Mon, 27 Sep 2004 23:44:26 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <006901c4a515$d617d980$936ffea9@alpha>
References: <002a01c4a509$74f94b40$936ffea9@alpha>
	<Pine.NEB.4.60.0409280439060.15502@sdf.lonestar.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


> > ifconfig eth0:0 192.168.1.23 netmask 255.255.255.0
> 
> not this:
> 
> > iptables -t nat -A PREROUTING -d 192.168.1.23 -i eth0 \
> >                -j DNAT --to-destination 161.31.31.23

but i want eth0:0 to be asigned that particular address to the internet.  


