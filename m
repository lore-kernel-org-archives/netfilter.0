From: Rai Ou <ourai@cybercash.co.jp>
Subject: FTP trouble at the iptables firewall of the Redhat Linux.
Date: Tue, 10 Dec 2002 10:22:59 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1BB05D8ED959D311930D009027866A9D010A69DE@cych.softbank.co.jp>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

> My gateway(firewall) is Redhat Linux 7.1 and I can only get 1 dynamic ip
> from my provider.
> So I create the IP-MASQURADE using iptables for my home-lan.
> 
> My target is "creating a FTP server at one of my home-lan machine(Redhat
> 7.2)". but now
> I found it can be run as a FTP client but can't be run as a FTP server for
> the Data Connection Error.
> 
> I know the FTP protocol need 2 connections (Control connectin & Data
> connection) so I loaded this
> modules at my firewall linux box:
> ----------------------------------------------------------
> ip_nat_irc              4320   0  (unused)
> ip_nat_ftp              3760   0  (unused)
> ip_conntrack_irc     3040   0  (unused)
> ip_conntrack_ftp     2480   0  (unused)
> ipt_MASQUERADE     1712   1  (autoclean)
> ipt_state             1200   3  (autoclean)
> iptable_nat          16160   2  (autoclean) [ip_nat_irc ip_nat_ftp
> ipt_MASQUERADE]
> ip_conntrack       15824   4  (autoclean) [ip_nat_irc ip_nat_ftp
> ip_conntrack_irc ip_conntrack_ftp 
>      ipt_MASQUERADE ipt_state iptable_nat]
> iptable_filter         2304   0  (autoclean) (unused)
> ip_tables             11072   6  [ipt_MASQUERADE ipt_state iptable_nat
> iptable_filter]
> ---------------------------------------------------------
> 
> and let me attache my firewall setting here:
> #-------------------------------
> # default INPUT/FORWARD policy
> #-------------------------------
> iptables -P INPUT DROP
> iptables -P FORWARD DROP
> #---------------------
> # clear the chains
> #---------------------
> iptables -F
> iptables -F -t nat
> iptables -X
> iptables -X -t nat
> #---------------------
> # make rule & chains
> #---------------------
> # Difene the default INPUT/FORWARD rule.
> iptables -N default
> iptables -A default -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A default -m state --state NEW -i eth0 -j ACCEPT
> iptables -A default -m state --state NEW -i ! eth0 -j ACCEPT
> iptables -A default -j DROP
> # Use the defaule rule to the INPUT/FORWARD chains.
> iptables -A INPUT -j default
> iptables -A FORWARD -j default
> 
> # Defile the pass chain and insert it to the FORWARD.
> # - telnet -
> iptables -t nat -A PREROUTING -i eth0 -d 219.105.XXX.XXX -p tcp --dport
> 10023 
>   -j DNAT --to 192.168.0.128:23
> # - ftp -
> iptables -t nat -A PREROUTING -i eth0 -d 219.105.XXX.XXX -p tcp --dport
> 10021 
>   -j DNAT --to 192.168.0.128:21
> iptables -N pass
> iptables -A pass -d 192.168.0.128 -p tcp --dport 23 -j ACCEPT
> iptables -A pass -d 192.168.0.128 -p tcp --dport 21 -j ACCEPT
> iptables -I FORWARD 1 -j pass
> 
> # Using the ipMASQUERADE at the POSTROUTING chain.
> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
> 
> 
> 
> Now I want to know the reason of why I can't make the FTP data connection
> to
> the home-lan FTP Server. or...... maybe it is the Impossible mission ???
> 
> Rai
> 
> 
> 

