From: Florian Westphal <fw@strlen.de>
Subject: Re: flowtable breaks masquerade for dnat flows
Date: Mon, 14 Oct 2019 22:53:05 +0200
Message-ID: <20191014205305.GO25052@breakpoint.cc>
References: <66954409-3fcc-4319-a691-d65e80e2648f@www.fastmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <66954409-3fcc-4319-a691-d65e80e2648f@www.fastmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Rudenberg <jonathan@titanous.com>
Cc: netfilter@vger.kernel.org

Jonathan Rudenberg <jonathan@titanous.com> wrote:
> I'm on kernel 5.3.5 with nftables v0.9.2 using I211-AT NICs.
> 
> I set up a very basic routing/NAT setup with masquerade SNAT and DNAT for a single port. With no flowtable, everything works as expected. When the flowtable is enabled, the egress packets for flows associated with the DNAT port (source 172.17.2.128:32400 in the example config below) do not have their source address rewritten by the masquerade rule and are emitted onto enp1s0 with the IP 172.17.2.128 instead of the IP of enp1s0. Regular SNAT/masquerade flows work fine with the flowtable on.
> 
> A minimized example is below, let me know if there's any other information I can provide.

[..]

Can you modify/send a patch for

https://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf-next.git/tree/tools/testing/selftests/netfilter/nft_flowtable.sh

That demonstrates the bug?

I made following patch but it works for me (possible i made a stupid
mistake and its now even being offloaded or i misunderstood the problem,
etc) but i don't have time to follow up right now.

diff --git a/tools/testing/selftests/netfilter/nft_flowtable.sh b/tools/testing/selftests/netfilter/nft_flowtable.sh
--- a/tools/testing/selftests/netfilter/nft_flowtable.sh
+++ b/tools/testing/selftests/netfilter/nft_flowtable.sh
@@ -226,17 +226,19 @@ check_transfer()
 	return 0
 }
 
-test_tcp_forwarding()
+test_tcp_forwarding_ip()
 {
 	local nsa=$1
 	local nsb=$2
+	local dstip=$3
+	local dstport=$4
 	local lret=0
 
 	ip netns exec $nsb nc -w 5 -l -p 12345 < "$ns2in" > "$ns2out" &
 	lpid=$!
 
 	sleep 1
-	ip netns exec $nsa nc -w 4 10.0.2.99 12345 < "$ns1in" > "$ns1out" &
+	ip netns exec $nsa nc -w 4 "$dstip" "$dstport" < "$ns1in" > "$ns1out" &
 	cpid=$!
 
 	sleep 3
@@ -258,6 +260,28 @@ test_tcp_forwarding()
 	return $lret
 }
 
+test_tcp_forwarding()
+{
+	test_tcp_forwarding_ip "$1" "$2" 10.0.2.99 12345
+
+	return $?
+}
+
+test_tcp_forwarding_nat()
+{
+	local lret
+
+	test_tcp_forwarding_ip "$1" "$2" 10.0.2.99 12345
+	lret=$?
+
+	if [ $lret -eq 0 ] ; then
+		test_tcp_forwarding_ip "$1" "$2" 10.6.6.6 1666
+		lret=$?
+	fi
+
+	return $lret
+}
+
 make_file "$ns1in" "ns1"
 make_file "$ns2in" "ns2"
 
@@ -283,14 +307,19 @@ ip -net ns2 route add 192.168.10.1 via 10.0.2.1
 # Same, but with NAT enabled.
 ip netns exec nsr1 nft -f - <<EOF
 table ip nat {
+   chain prerouting {
+      type nat hook prerouting priority 0; policy accept;
+      meta iif "veth0" ip daddr 10.6.6.6 tcp dport 1666 counter dnat ip to 10.0.2.99:12345
+   }
+
    chain postrouting {
       type nat hook postrouting priority 0; policy accept;
-      meta oifname "veth1" masquerade
+      meta oifname "veth1" counter masquerade
    }
 }
 EOF
 
-test_tcp_forwarding ns1 ns2
+test_tcp_forwarding_nat ns1 ns2
 
 if [ $? -eq 0 ] ;then
 	echo "PASS: flow offloaded for ns1/ns2 with NAT"
@@ -313,7 +342,7 @@ fi
 ip netns exec ns1 sysctl net.ipv4.ip_no_pmtu_disc=0 > /dev/null
 ip netns exec ns2 sysctl net.ipv4.ip_no_pmtu_disc=0 > /dev/null
 
-test_tcp_forwarding ns1 ns2
+test_tcp_forwarding_nat ns1 ns2
 if [ $? -eq 0 ] ;then
 	echo "PASS: flow offloaded for ns1/ns2 with NAT and pmtu discovery"
 else
