From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Iptables stops working
Date: Wed, 25 Jun 2003 20:35:54 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200306252035.54537.Alistair@nerdnet.ca>
References: <NABBIDJPNCAGKGOFGHBFEEODPNAA.luba@assist.com.gt>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NABBIDJPNCAGKGOFGHBFEEODPNAA.luba@assist.com.gt>
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
To: Luis Fernando Barrera <luba@assist.com.gt>, netfilter@lists.netfilter.org


	Ummm ...
       eepro100 dual nic in there by any chance -- pointed at the 
	inside network?

	If so email me off list.


On June 25, 2003 02:52 pm, Luis Fernando Barrera wrote:
> Hi all,
>
> I have a strange problem with IPTables... I use
> iptables to protect the firewall itself and to allow all the
> users from the Local (private) network to the Internet.
>
> It works fine, except that after a while, the firewall (my linux box)
> stops forwarding packets from the local network to the Internet (i.e. the
> Forward chain)
> The Input and Output chains still work, after the problem.
>
> My solution has been to "restart" the iptables script.
>
> I'm using Red Hat 9, but I have this problem since Red Hat 7.3
>
> Is there maybe a buffer or counters or something that got full?
> Maybe some kernel parameter that produces this behavior?
>
> This is part of my script. Basically every time that is called,
> clean all the chains...
>
> In advance thank you very much
>
> Luis
>
> --------------------------------------
>
>       eth0 = private lan interface
>       eth1  = public interface
>
>         echo "----------------------------------"
>         echo "Starting NetFilter..."
>         echo "----------------------------------"
>         #
>         # loads FTP connection tracking module
>         #
>         modprobe ip_conntrack
>         modprobe ip_conntrack_ftp
>         #
>         # Gets the list of current tables
>         #
>         chains=`cat /proc/net/ip_tables_names 2>/dev/null`
>         #
>         # Flushes all the current tables
>         #
>         action $"Flushing all current rules and user defined chains:"
> iptables -F
>         action $"Clearing all current rules and user defined chains:"
> iptables -X
>         for i in $chains; do iptables -t $i -F; done && \
>             success $"Flushing all current rules and user defined chains:"
>
> || \
>
>             failure $"Flushing all current rules and user defined chains:"
>         for i in $chains; do iptables -t $i -X; done && \
>             success $"Clearing all current rules and user defined chains:"
>
> || \
>
>             failure $"Clearing all current rules and user defined chains:
>
>         #
>         # FW Sets to "0"  the packet counters
>         #
>         for i in $chains; do iptables -t $i -Z; done
>         #
>         # FW Resets the chains to default policy DROP
>         #
>         echo -n $"Setting default policy: DROP"
>         iftable filter -P INPUT      DROP && \
>         iftable filter -P FORWARD    DROP && \
>         iftable filter -P OUTPUT     DROP && \
>         iftable nat -P PREROUTING    ACCEPT && \
>         iftable nat -P POSTROUTING   ACCEPT && \
>         iftable nat -P OUTPUT        ACCEPT && \
>         iftable mangle -P PREROUTING ACCEPT && \
>         iftable mangle -P OUTPUT     ACCEPT && \
>             success $"Setting default policy: DROP" || \
>             failure $"Setting default policy: DROP"
>
>         #
>         # Kernel Flags
>         #
>         echo "----------------------------------"
>         echo "Setting Kernel Flags..."
>         echo "----------------------------------"
>         # Disable response to broadcasts.
>         echo "Disabling response to broadcasts..."
>         echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
>         # Don't accept source routed packets.
>         echo "Disabling source routed packets..."
>         echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route
>         # Disable ICMP redirect acceptance.
>         echo "Disabling ICMP rediret acceptance..."
>         echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects
>         # Enable bad error message protection.
>         echo "Enabling bad error message protection..."
>         echo 1 > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses
>         # Turn on reverse path filtering.
>         echo "Enabling Spoof protection ..."
>         for interface in /proc/sys/net/ipv4/conf/*/rp_filter; do
>            echo 1 > ${interface}
>         done
>         #Enable SYN Cookies
>         echo "Enabling SYN Cookies..."
>         echo 1 > /proc/sys/net/ipv4/tcp_syncookies
>         #Enable forwarding
>         echo "Enabling Forwarding..."
>         echo 1 >/proc/sys/net/ipv4/ip_forward
>
>        #
>        # USER CHAINS
>        # traffice from LOCAL lan to Internet (INET)
>        #
>         iptables -N LOCAL_TO_INET
>         #
>         # traffice from Internet to LOCAL lan
>         #
>         iptables -N INET_TO_LOCAL
>
>         #
>         # Enables All trafic from Intranet -> Internet
>         #
>         iptables -A LOCAL_TO_INET  -p tcp -m state --state
>     -j ACCEPT
>         iptables -A INET_TO_LOCAL  -p tcp -m state --state
> ESTABLISHED,RELATED         -j ACCEPT
>
>        #################################################
>        #
>         # Traffic Intranet -> Internet
>         #
>         iptables -A FORWARD -i eth0 -o eth1 -p udp -j DROP
>         iptables -A FORWARD -i eth0 -o eth1 -j LOCAL_TO_INET
>         iptables -A FORWARD -i eth0 -o eth1  -m limit --limit
> 1/minute --limit-burst 3 -j LOG --log-prefix "LOCAL_TO_INET DROP packet:"
>         #
>         # Traffic Internet -> Intranet
>         #
>         iptables -A FORWARD -i eth1 -o eth0 -p udp -j DROP
>         iptables -A FORWARD -i eth1 -o eth0 -j INET_TO_LOCAL
>          iptables -A FORWARD -i eth1 -o eth0  -m limit --limit
> 1/minute --limit-burst 3 -j LOG --log-prefix "INET_TO_LOCAL DROP packet:"
>
>         #enables NAT
>         iptables -t nat -A POSTROUTING -s 192.168.0.0/16 -d \!
> 192.168.0.0/16 -j SNAT --to-source <SOME IP>

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

