From: "Martin Djernaes" <martin@djernaes.dk>
Subject: (newbie) SNAT woes
Date: Thu, 7 Aug 2003 16:14:56 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <16448.128.107.253.37.1060265696.squirrel@mail.djernaes.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

I realise that you have seen mails like mine lots of time before, but I
have spend hours reading howtos and googling for some hint as to why my
very simple setup doesn't work.

I have a simple box which just is suppose to do normal NATing of outgoing
traffic so it uses the public IP address.

I thought that I had it all setup right (that was at least what I
understood from everything I read), so here is my nat table:

# iptables -t nat -v -L
Chain PREROUTING (policy ACCEPT 1774 packets, 193K bytes)
 pkts bytes target     prot opt in     out     source              
destination

Chain POSTROUTING (policy ACCEPT 1443 packets, 77156 bytes)
 pkts bytes target     prot opt in     out     source              
destination
    0     0 SNAT       all  --  any    eth1    anywhere            
anywhere           to:11.22.33.44

Chain OUTPUT (policy ACCEPT 317 packets, 23092 bytes)
 pkts bytes target     prot opt in     out     source              
destination

Now if I ping an external IP address from another box on the "inside" and
run "tcpdump -ni eth1" on the gateway box, I will see the source address
being unchanged! (and I don't get an icmp echo reply back).

So what did I miss? Isn't it just a oneliner to turn SNAT on?

Martin



