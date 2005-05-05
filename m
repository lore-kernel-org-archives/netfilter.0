From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Iptables, php , realtime bandwidth usage
Date: Thu, 05 May 2005 10:39:08 -0500
Message-ID: <427A3E1C.3070803@riverviewtech.net>
References: <000e01c5515e$b0b62570$1701a8c0@info2000256>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000e01c5515e$b0b62570$1701a8c0@info2000256>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

>  I wonder if someone could help me find something similiar to this :
> 
>  -can monitor bandwidthd usage in real time (php maybe...)
> 
>  -if possible it could resolve ip address to dns name ? ( I have setup my own dynamicdns dhcp server combo )

You may want to look in to some of the SNMP monitoring tools (two come to mind MRTG and Cacti) as they will do a lot of the graphics and graphical web access for you.  However to do this you will either need a manged + SNMP capable switch to watch which port each computer is plugged in to or you will need to set up some sort of rules for counting on your router / firewall and then set up some sort of SNMP package on the router / firewall to point your SNMP monitoring app at.

As far as getting close to real time stats you could set up some iptables rules to easily count what passes through the router in each direction for each client.  You may want to look at the accounting matches as they are designed explicitly for this or just basic packet matching rules will work too.  One word to the wise (unless there is a way to defeat this) the bytes and packet counters on iptables output will start rounding at some point, I'm not sure where, so you may want to pass the -Z option to zero out the counters periodically (each polling cycle) to make sure that you get all packets and not loose them to rounding.



Grant. . . .

