From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: locally access server behind firewall
Date: Wed, 1 Sep 2004 14:17:29 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409011417.29061.Alistair@nerdnet.ca>
References: <41360CA0.6090109@tomdp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41360CA0.6090109@tomdp.com>
Content-Disposition: inline
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

On September 1, 2004 01:53 pm, Tom wrote:
> Hi,
>
> I have a linux firewall (iptables), and a linux server with apache
> behind that firewall. My provider blocks ports below 1024, so I have a
> prerouting-rule that redirects traffic like this:
>
> $IPTABLES -A PREROUTING -t nat -i $WWW p tcp -d $EXTIP --dport 8888 -j
> DNAT --to $SERVER:80
>
> I also have 2 forward-rules:
>
> $IPTABLES -A FORWARD -i $WWW -o $LAN -p tcp --dport 80 -j ACCEPT
> $IPTABLES -A FORWARD -i $LAN -o $WWW -p tcp --sport 80 -j ACCEPT
>
> and I have these two lines to allow my local pc's to connect to the
> firewall with ssh and stuff like that:
> $IPTABLES -A INPUT -i $LAN -s $INTLAN -j ACCEPT
> $IPTABLES -A OUTPUT -o $LAN -d $INTLAN -j ACCEPT
>
>
> where:
>   $EXTIP = my external IP address
>   $WWW is eth1
>   $LAN is eth0
>   $SERVER = my server's internal IP address.
>   $INTLAN = "192.168.0.0/24"
>
> This works really well when I try to connect from the outside to my
> webserver. But, if I try to connect to http://myserver.com:8888 from the
> internal network (or from my server itself), I always get 'connection
> refused'. I'm pretty sure I need some other rules, but can someone
> please help me in the good direction here? Thanks a lot!!
	
	Your inbound DNAT rule doesn't translate connections from the LAN.
	 (-i $WWW)
	
	IF you want to do this without a DMZ (*not a good thing*) you will need to 
both DNAT and SNAT the connections from the LAN to the webserver. i.e. DNAT 
the connection from the LAN to the webserver as in the (-i $WWW rule) AND 
SNAT the connection on the way to the webserver to come back to the LAN ip of 
the firewall.

	Better to follow Jason's advise, create a virtual DMZ and route through to 
that.

>
>
>
> PS: Here's a little drawing of the situation:
>
> SERVER (eth0) <----> (eth0) GATEWAY-PC (eth1) <----> internet

