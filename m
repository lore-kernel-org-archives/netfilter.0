From: "hare ram" <hareram@sol.net.in>
Subject: Re: Help in IPTABLES
Date: Sat, 11 Jan 2003 12:11:56 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <103901c2b93c$8a28c820$13fcc5cb@Housecall>
References: <20030111054656.20063.qmail@web40711.mail.yahoo.com>
Reply-To: "hare ram" <hareram@sol.net.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: Mohammad Shakir <shakirz1@yahoo.com>, netfilter@lists.netfilter.org

Hi

yes thats works fine
instead of that, you can also try routing your block of local ip's rather
interface..

iptables -t nat -A PREROUTING -s 192.168.20.0/24 -p tcp --dport 80 -j
REDIRECT --to-port 3128

good luck

hare
----- Original Message -----
From: "Mohammad Shakir" <shakirz1@yahoo.com>
To: <netfilter@lists.netfilter.org>
Sent: Saturday, January 11, 2003 11:16 AM
Subject: Help in IPTABLES


> Dear Friends,
>
> I have Installed Red Hat Linux 7.3 with hostname
> SERVER1 ipaddress 192.168.0.1 and also configure
> squid, DHCP, DNS services all are running well. I have
> also 30 PCs of windows 98 as a client with auto ip and
> set their gateway,dns,dhcpserver and so on from DHCP
> 192.168.0.1.
> Now I want that any request for browsing come from
> client automatically forward to my squid which is
> running on 3128 port and all others request go on
> direct ppp0 for this I configured one script which is
> given below.
>
> Is this script correct or not ?
>
> echo 1 > /proc/sys/net/ipv4/ip_forward
> /sbin/iptables --flush
> /sbin/iptables --table nat --flush
> /sbin/iptables --delete-chain
> /sbin/iptables --table nat --delete-chain
>
> /sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp
> --dport 80 -j REDIRECT --to-port 3128
> /sbin/iptables --table nat --append POSTROUTING -s
> 192.168.0.1/24 --out-interface ppp0 -j MASQUERADE
> /sbin/iptables --append FORWARD --in-interface eth0 -j
> ACCEPT
>
> This is other setup.
>
> I have setup two servers hostname server1 ip address
> 192.168.0.1 and hostname server2 ipaddress 192.168.0.2
> both servers are connected with dialup sepratly and
> also configure squid, DHCP, DNS services. I have also
> 100 PCs of windows 98 as a client with auto ip and set
> their gateway,dns,dhcpserver and so on from DHCP
> 192.168.0.1.
>
> Now I want that any request for browsing come from
> client automatically forward to my squid which is
> running on 3128 port on server 192.168.0.2 and all
> others request go on direct ppp0 of 192.168.0.1.
> Please help my what script I make for this.
>
> I hope you will help me in this regard.
>
> Thanks
>
> MOHAMMAD SHAKIR
>
>
> ___________________________________________________________
> Sent by ePrompter, the premier email notification
> software.
> Free download at http://www.ePrompter.com.
>
> __________________________________________________
> Do you Yahoo!?
> Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
> http://mailplus.yahoo.com
>
>


