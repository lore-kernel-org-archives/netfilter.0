From: "Adi" <adi@nettek.pl>
Subject: RE: Port FWD via 2 NAT
Date: Thu, 22 May 2003 10:47:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030522084715.E0B97256DFD@ip.sec.artur.pl>
Reply-To: "Adi" <adi@nettek.pl>
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
Content-Type: text/plain; charset="us-ascii"; 
To: George Vieira <georgev@citadelcomputer.com.au>, Adi <adi@nettek.pl>, "netfilter@lists.netfilter.org"@sec.artur.pl
Cc: netfilter@lists.netfilter.org

> Err... did you label your picture right according to what you said??
> POSTROUTING should be done on linux1 according to your graphs.
> PREROUTING should be done on linux2
>
> Also, we need to see all your rules as you may have a -j DROP somewhere
that might be blocking it ie. ( -P FORWARD -j DROP )

My all rules on Linux1:
iptables -t nat -A POSTROUTING -s 10.0.2.2/32 -o eth0 -j SNAT --to (public
address)
iptables -A PREROUTING -t nat -p tcp -d (public address) --dport 23 -j DNAT
--to 10.0.2.2:23

On linux2:
iptables -t nat -A POSTROUTING -s 10.0.5.0/24 -o eth0 -j SNAT --to 10.0.2.2
iptables -A PREROUTING -t nat -p tcp -d 10.0.2.2 --dport 23 -j DNAT --to
10.0.5.13:23

Port 23 is only an example. Please, help :(

Adi


