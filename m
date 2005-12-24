From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: Help with a firewall script
Date: Sat, 24 Dec 2005 14:37:55 -0500
Message-ID: <1135453076.2584.7.camel@localhost>
References: <002701c608bc$92a9e740$6f64a8c0@langherd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002701c608bc$92a9e740$6f64a8c0@langherd.com>
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
To: "John P. Lang" <john@langherd.com>
Cc: netfilter@lists.netfilter.org

On Sat, 2005-12-24 at 11:02 -0800, John P. Lang wrote:
> Good Morning,
> 
> I am definitely not understanding something after reading a handful of
> tutorials and mail threads.  I though I'd ask the experts for a hand.
> 
> I have a web server that sits behind the firewall.  I need the web server to
> have access to the internet (http traffic).
> 
> I have a handful of dnat rules sending http traffic and a couple of others
> to our internal web server.
> The web server cannot access the internet. I believe that web requests are
> being sent back to the web server?
> 
> Are there any special rules that I would need to add to allow the web server
> access to DNS and HTTP?
> 
> Thanks,
> 
> John
> 
> 
> #=================================
> # Set some variables
> #=================================
> IPT=/sbin/iptables
> LOGOPT="--log-level=3 -m limit --limit 1/second --limit-burst 10"
> EXTIP="xxx.xxx.xxx.xxx"
> WEBIP="192.168.100.254"
> EXTNIC="eth2"
> INTNIC="eth0"
> SHUNIP=""
> echo "Done with variables"
> 
> #=================================
> #Load modules
> #=================================
> modprobe iptable_nat
> modprobe ip_conntrack
> modprobe ip_conntrack_ftp
> modprobe ip_nat_ftp
> echo 1 > /proc/sys/net/ipv4/ip_forward
> echo "Finished loading modules"
> 
> #=================================
> # Check if we can run iptables
> #=================================
> if [ ! -x $IPT ]
>         then
>         echo "firewall:  can't execute \IPTABLES"
>         exit 1
> fi
> 
> 
> #=================================
> # Flush and build chains
> #=================================
> 
> $IPT --flush
> $IPT --table nat --flush
> $IPT --delete-chain
> $IPT --table nat --delete-chain
> 
> # LOGGING CHAIN
> $IPT -N LDROP
> $IPT -A LDROP -j LOG --log-prefix "IPT Drop: " $LOGOPT
> $IPT -A LDROP -j DROP
> 
> $IPT -N LFLOOD
> $IPT -A LFLOOD -j LOG --log-prefix "IPT Flood: " $LOGOPT
> $IPT -A LFLOOD -j DROP
> 
> $IPT -N LFLAGS
> $IPT -A LFLAGS -j LOG --log-prefix "IPT Flags: " $LOGOPT
> $IPT -A LFLAGS -j DROP
> 
> $IPT -N LSHUN
> $IPT -A LSHUN -j LOG --log-prefix "IPT Shun: " $LOGOPT
> $IPT -A LSHUN -j DROP
> 
> 
> $IPT -N LPRE
> $IPT -A LPRE -j LOG --log-prefix "IPT PreRoute: " $LOGOPT
> echo "Chains flushed and created"
> 
> 
> 
> 
> #=================================
> #Take care of the shun'd IP's
> #=================================
> $IPT -N SHUN
> for ip in $SHUNIP; do
>         $IPT -A SHUN -s $ip -j LSHUN
>         $IPT -A SHUN -d $ip -j LSHUN
> done
> 
> $IPT -A INPUT -j SHUN
> $IPT -A INPUT -j ACCEPT
> 
> $IPT -A OUTPUT -j SHUN
> $IPT -A OUTPUT -j ACCEPT
> 
> $IPT --table nat --append POSTROUTING --out-interface $EXTNIC -j MASQUERADE
> 
> $IPT --append FORWARD --in-interface $INTNIC -j ACCEPT
> echo "Done with SHUN IP's"
> 
> #=================================
> # Forwards
> #=================================
> 
> #$IPT -t nat -A PREROUTING -p TCP --dport 80 -j REDIRECT --to-port 3128 #
> Put through squid
> $IPT -t nat -A PREROUTING -i $EXTNIC -p tcp -d $EXTIP --dport 3389 -j DNAT
> --to-destination $WEBIP # Term Svc
> $IPT -t nat -A PREROUTING -i $EXTNIC -p tcp -d $EXTIP --dport 80 -j DNAT
> --to-destination $WEBIP   # HTTP Traffic
> $IPT -t nat -A PREROUTING -i $EXTNIC -p tcp -d $EXTIP --dport 20 -j DNAT
> --to-destination $WEBIP   # FTP
> $IPT -t nat -A PREROUTING -i $EXTNIC -p tcp -d $EXTIP --dport 21 -j DNAT
> --to-destination $WEBIP   # FTP
> $IPT -t nat -A PREROUTING -i $EXTNIC -p tcp -d $EXTIP --dport 1755 -j DNAT
> --to-destination $WEBIP # Windows Media
> $IPT -t nat -A PREROUTING -i $EXTNIC -p udp -d $EXTIP --dport 1755 -j DNAT
> --to-destination $WEBIP # Windows Media
> 
> echo "Done with Forwards"
> echo "Firewall Complete"
> iptables-errors
> 
> 
> 
After a very quick look, it appears that you are allowing outbound
traffic from the internal NIC but where are you allowing the reply
packets? Do you have a RELATED,ESTABLISHED rule anywhere? - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

If you would like to participate in the development of an open source
enterprise class network security management system, please visit
http://iscs.sourceforge.net


