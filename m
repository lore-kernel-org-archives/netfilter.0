From: alain sabban <alain.sabban@wanadoo.fr>
Subject: status of SNAT
Date: Sat, 14 May 2005 10:30:43 +0200
Message-ID: <200505141030.43375.alain.sabban@wanadoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Hello,

Sorry if this is a basic question. I've googled but can't figure out if SNAT 
should work or not.

To connect from home to my office I've to use IPSEC. To have full access to my 
company's network I've to SNAT all packets to a certain IP address. I did 
this with an iptables rule like :

iptables -t nat -A POSTROUTING  -d x.y.0.0/16 -j SNAT --to-source 172.a.b.c
where x.y.0.0 is the class B network of my company's network, and 172.a.b.c is 
an IP address routed in this company's network.

Now what is working and what is not : At home on the same box, I've SuSE 9.2 
and SuSE 9.3. (Note with both, I use the same ipsec.conf file)

1/ SuSE 9.2 is based on kernel 2.6.8 + 4 netfilter/ipsec patches. When I 
establish the IPSEC tunnel, everything works. No problem.

2/ SuSE 9.3 is based on kernel 2.6.11 + 4 netfilter/ipsec patches. With this, 
I have no problem to establish the IPSEC tunnel, but I can't do anything. If 
I ping x.y.1.1 here is what tcpdump shows :

09:33:09.555732 IP 192.168.1.100 > 194.t.u.v : ESP(spi=0x03dbfaed,seq=0x2b)
09:33:09.629801 IP 194.t.u.v > 192.168.1.100: ESP(spi=0xce9c61eb,seq=0x2b)
09:33:09.629801 IP x.y.1.1 > 172.a.b.c: icmp 64: echo reply seq 14
09:33:09.629801 IP x.y.1.1 > 172.a.b.c: icmp 64: echo reply seq 14

192.168.1.100 is the local IP address of the SuSE box.
194.t.u.v is the public address of the IPSEC gateway of the company
x.y.1.1 is an internal host in company's network
172.a.b.c is the IP address that I've to use to have full access in company's 
network.

As you can see ping replies are coming to the SuSE box, but they are not 
passed to the ping application which indicates 100% packet loss.

With SuSE 9.2, the tcpdump shows exactly the same packets, but it works. I've 
compiled 2.6.11.7 from kernel.org + 4 netfilter/ipsec patches. It gives same 
failed result : IPSEC tunnel ok but nothing works.

Is it a known problem or have I missed something ?
Thanks for your help
Rgds / AS


