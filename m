From: "Lars Nixdorf" <lars.nixdorf@genion.de>
Subject: netfilter .. (openswan) nat problem ..
Date: Tue, 6 Jun 2006 23:04:12 +0200
Message-ID: <01e201c689ac$c55351b0$c964a8c0@sol>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

i have to solv the following problem (debian 3.1, kernel 2.6.14 from kernel
org, no patches, openswan 2.x.x maybe important):

netA - gwA - gwB - netB - internet, where 

netA: 192.168.0.0/24
gwA: 192.168.0.1 + pppoe-ip-addr
gwB: 100.100.100.100 (static official ip)
netB: 100.100.100.100/32 (no real subnet)

gwA and gwB are both real gateways

tunnel works in the following way:

netA/gwA to netB/gwB and netB/gwB to netA/gwA, all I think .

now I want to forward a spezial port on gwB, perhaps 50000 to an address in
netA (192.168.0.100:50000), ok np from gwB, but ! I could not connect from
the internet over gwB to this spezial host

my nat rules, nothing else ..

iptables -t nat -A PREROUTING -j DNAT -p tcp -s 0/0 --dport 50000
--to-destination 192.168.0.100:50000 -i eth0 iptables -t nat -A POSTROUTING
-j SNAT -p tcp -d 192.168.0.100 --dport 50000 --to 100.100.100.100 -o eth0

tcpdump tell me that all nat works, but no traffic on gwA interfaces
received. gwB send it, but I have a [DF] in that lines, maybe important, I
doesn't know

any suggestions? someone could help?



regards, ji




