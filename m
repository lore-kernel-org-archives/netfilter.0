From: Devaraj Das <ddas@india.hp.com>
Subject: iptables issue (udp -> esp)??
Date: Tue, 20 Apr 2004 12:46:19 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4084CE43.306546C8@india.hp.com>
References: <010601c4263a$1268c030$68892090@grouse> <40841917.7060501@rocksteady.com>
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
To: netfilter@lists.netfilter.org

Hi,
I am trying to set up a NAT for VPN access. The clients are in a private
network. To start with, I added just one (and only one) iptables rule in the
gateway (for one particular client-ip-addr):
iptables -t nat -I POSTROUTING 1 -o eth0 -s 10.0.1.2  -j SNAT --to
15.76.97.136

10.0.1.2 can talk (telnet, ping) to any host in 15.76.* network. However, the
communication is problematic when the key-exchange negotiation (using racoon,
version ipsec-tools-0.3) happens. I doubt that the issue has anything to do
with racoon. What happens is that the VPN server 15.76.98.218 receives the
ISAKMP packet in perfect condition and responds back with another. However,
what reaches the client is an ESP packet!!
All port information seems to be lost!

In the tcpdump output below, read ebnt136 as the gateway, lx98218 as the VPN
server.

Here is the tcpdump output on the vpn server machine (when the client starts
the isakmp exchange):
ebnt136.india.hp.com.4500 > lx98218.india.hp.com.isakmp: isakmp: phase 1
I ident: [|sa] (DF)
lx98218.india.hp.com.isakmp > ebnt136.india.hp.com.4500: isakmp: phase 1
R ident: [|sa] (DF)

Here is the output on the client (10.0.1.2):
10.0.1.2:4500 > lx98218.india.hp.com.isakmp: isakmp: phase 1 I ident:
[|sa] (DF)
10.0.1.2:4500 > lx98218.india.hp.com.isakmp: isakmp: phase 1 I ident:
[|sa] (DF)
lx98218.india.hp.com > 10.0.1.2: ESP(spi=0x..., seq=0x...)
lx98218.india.hp.com > 10.0.1.2: ESP(spi=0x..., seq=0x...)

The response packets never reaches racoon on the client.

I am using Linux Kernel 2.6.0 on the client and the server and Linux Kernel
2.4.6 on the gateway. The version of iptables on the gateway is 1.2.2.

Is this an iptables/kernel (on the gateway) issue? Would really appreciate
any help in this regard.

Thanks,
Devaraj.


