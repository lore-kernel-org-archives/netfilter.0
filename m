From: George Liu <George.Liu@noaa.gov>
Subject: block broadcast traffic
Date: Thu, 03 Mar 2005 09:19:06 -0600
Message-ID: <42272AEA.50008@noaa.gov>
Reply-To: George.Liu@noaa.gov
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

I tried to use iptables to block inbound and outbound netbios broadcast 
announcement traffic of a system with IP 10.1.1.76. It seems iptables 
doesn't work. Is this a limitation or rule wrong? Thanks.



*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:RH-Firewall-1-INPUT - [0:0]
-A INPUT -j RH-Firewall-1-INPUT
-A FORWARD -j RH-Firewall-1-INPUT

-A RH-Firewall-1-INPUT -s 10.1.1.0/22 -p udp -m multiport --ports 
135,136,237,138,139,445 -j REJECT
-A RH-Firewall-1-INPUT -d 10.1.1.0/22 -p udp -m multiport --ports 
135,136,237,138,139,445 -j REJECT
-A RH-Firewall-1-INPUT -p udp -m multiport --ports 
135,136,237,138,139,445 -j REJECT


