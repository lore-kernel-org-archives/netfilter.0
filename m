From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Prerouting fails no DNAT
Date: Sun, 18 Apr 2004 16:09:40 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404181609.40234.Alistair@nerdnet.ca>
References: <33044.64.81.147.25.1082316532.squirrel@home.schroedernet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <33044.64.81.147.25.1082316532.squirrel@home.schroedernet.net>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On April 18, 2004 07:28 pm, wschroed@schroedernet.net wrote:
> With the firewall configured like below:
> track_conn="1"
> ExtIP1="64.x.x.x" # External IP
> ExtIP2="64.x.x.y" # External IP eth4
> pss1="10.0.0.1" # eth3
> ns="IP" # master dns
> ns3="IP" #s ns2 slave dns
> ntp1="IP"
> loopback="127.0.0.0/8"
> class_a="10.0.0.0/8" #non routable networks
> class_b="172.16.0.0/12"
> class_c="192.168.0.0/16"
> class_d="224.0.0.0/5"
> privports="0:1023" # privildeged ports
> unprivports="1024:65535"
> xwindows="6000:6003" #Lets block access to X
> mysql="3306"
> #Set Default Policy
> iptables --policy INPUT DROP
> iptables --policy OUTPUT DROP
> iptables --policy FORWARD DROP
> # Pre-Routing Redirect for Web Server. in from public ip (eth4) to pss1
> (eth3)
> iptables -t nat -A PREROUTING -i eth4 -p tcp --sport $unprivports -d
> $ExtIP2 --dport 8080 -j DNAT --to-destination 10.0.0.57:8080
> iptables -A FORWARD -i eth4 -o eth3 -p tcp --sport $unprivports -d
> 10.0.0.57 --dport 8080 -m state --state NEW -j ACCEPT
> iptables -A FORWARD -i eth3 -o eth4 -m state --state ESTABLISHED,RELATED
> -j ACCEPT
> iptables -A FORWARD -i eth4 -o eth3 -m state --state ESTABLISHED,RELATED
> -j ACCEPT
>
> ###########################################################################
>############################## RULES for SSH in to INTERNAL, Handling ICMP
> NTP, and dropping and logging all traffic..blah blah
> ##############
> AT THE END I HAVE
> #Forward
> iptables -A FORWARD -o eth0 -m state --state NEW,ESTABLISHED,RELATED -j
> ACCEPT
> iptables -A FORWARD -o eth1 -m state --state NEW,ESTABLISHED,RELATED -j
> ACCEPT
> ###########################################################
> #Postrouting
> iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source $ExtIP1
> ###########################################################################
>#########################
>
> SNAT works but the DNAT is dropped as seen below. The drop is occuring
> inbound on the internal interface. I put a log rule on the PREROUTE and
> did not see anything. It seems that the forwards at the end I doung
> something bad... Any suggestions.
>
> Inbnd TCP Drp Internal IN=eth1 OUT=  SRC=10.10.10.2 DST=64.x.x.x PROTO=TCP
> SPT=32826 DPT=9001
> Additional info:
> SuSE 8.2
> iptables-1.2.7a-174
>
>
	The above packet came IN eth1 -- which doesn't match your prerouting rule  or
	your PREROUTING or FORWARD rules. 
	At a guess it should likely go back out eth4 -- you need to either alter the 
	two FORWARD ESTABLISHED,RELATED rules and open them up or add 
	one to handle the packets coming back from your webserver to the internet.

	Alistair Tonner
	
> Will

