From: Carlos Ble <carlosble@terra.es>
Subject: new tcp connections, without SYN
Date: Wed, 9 Apr 2003 12:16:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304091216.28528.carlosble@terra.es>
Reply-To: carlosble@terra.es
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

Hi all. Two days ago, i added the policy that drops all new tcp connections
that starts without SYN to prevent port scaners and other attacks:

iptables -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j LOG \
--log-prefix "NEW tcp try no SYN:"
iptables -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DROP

Now the system is registering this event every minute from diferents ip. 
Is this usual?. What kind of programs tries to start a new tcp connection 
without a SYN ?. 
Im no so worried because scaning the ports of my server from another computer 
in the internet, using nmap , the answer is that all ports al filtered. 

Another question: I had disabled the icmp answers :
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_all
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
to try to be "invisible" for some wicked programs .
will i have problems with some other programas that makes ping 
before establish a connection? 

Thanks in advance

