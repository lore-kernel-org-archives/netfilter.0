From: "dsrat" <dsrat@yandex.ru>
Subject: checkpoint vpn through nat
Date: Fri, 3 Dec 2004 11:32:10 +0300 (MSK)
Message-ID: <41B0248A.00000C.07178@soapbox.yandex.ru>
Reply-To: dsrat@yandex.ru
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

I'm trying to connect to Checkpoint VPN-1 through linux box which acts as a nat. It runs Gentoo 2004.2 with kernel 2.4.26.
Tcpdump output looks like that:
...
First isakmp:
19:27:29.279231 IP linux_ext_ip.500 > remote_fw1_ip.500: [|isakmp]
19:27:29.685994 IP remote_fw1_ip.500 > linux_ext_ip.500: [|isakmp]
19:27:29.815693 IP linux_ext_ip.500 > remote_fw1_ip.500: [|isakmp]
19:27:31.813875 IP linux_ext_ip.500 > remote_fw1_ip.500: [|isakmp]
19:27:31.912521 IP remote_fw1_ip.500 > linux_ext_ip.500: [|isakmp]
19:27:31.967242 IP linux_ext_ip.500 > remote_fw1_ip.500: [|isakmp]
19:27:32.088548 IP remote_fw1_ip.500 > linux_ext_ip.500: [|isakmp]
19:27:32.196831 IP remote_fw1_ip.500 > linux_ext_ip.500: [|isakmp]
19:27:32.297091 IP remote_fw1_ip.500 > linux_ext_ip.500: [|isakmp]
19:27:32.550870 IP remote_fw1_ip.500 > linux_ext_ip.500: [|isakmp]
19:27:32.625134 IP linux_ext_ip.500 > remote_fw1_ip.500: [|isakmp]
19:27:32.737604 IP remote_fw1_ip.500 > linux_ext_ip.500: [|isakmp]
19:27:34.758025 IP remote_fw1_ip.500 > linux_ext_ip.500: [|isakmp]
19:27:36.747373 IP remote_fw1_ip.500 > linux_ext_ip.500: [|isakmp]
19:27:38.759928 IP remote_fw1_ip.500 > linux_ext_ip.500: [|isakmp]
19:27:40.750191 IP remote_fw1_ip.500 > linux_ext_ip.500: [|isakmp]
19:27:42.758176 IP remote_fw1_ip.500 > linux_ext_ip.500: [|isakmp]
19:27:44.764491 IP remote_fw1_ip.500 > linux_ext_ip.500: [|isakmp]
19:27:52.763549 IP remote_fw1_ip.500 > linux_ext_ip.500: [|isakmp]
19:27:56.759205 IP remote_fw1_ip.500 > linux_ext_ip.500: [|isakmp]
19:28:00.797307 IP remote_fw1_ip.500 > linux_ext_ip.500: [|isakmp]

I never get messages like "isakmp: phase 1"

Seems strange but it works when connecting through another linux box. This one is slackware with 2.4.21 kernel and it has no iptables rules special to ipsec.

All suggestions about checkpoint vpn and nat look similar and change nothing in isakmp behavior in my case:
iptables -A INPUT -i eth0 -p ah -j ACCEPT
iptables -A INPUT -i eth0 -p esp -j ACCEPT
iptables -A INPUT -i eth0 -p udp -m udp --dport 500 -j ACCEPT
iptables -A INPUT -i eth0 -p udp -m udp --dport 2746 -j ACCEPT
iptables -A FORWARD -i eth0 -p ah -d 172.16.0.0/16 -j ACCEPT
iptables -A FORWARD -i eth0 -p esp -d 172.16.0.0/16 -j ACCEPT
iptables -A FORWARD -i eth0 -p udp -d 172.16.0.0/16 -m udp \
	--dport 500 -j ACCEPT
iptables -A FORWARD -i eth0 -p udp -d 172.16.0.0/16 -m udp \
	--dport 2746 -j ACCEPT
(this one from https://lists.netfilter.org/pipermail/netfilter/2002-September/038697.html)

I've checked that iptables loads the same modules on both linuxes.
I've turned on and off Checkpoint SecureClient options "Force UDP encapsulation" and "Support IKE over TCP" - it always works through Slackware box and never through Gentoo box.
I've tried different client versions - 55, 66 and 4.1.sp5.

Am I missing something ? How can I diagnose problem more thoroughly ?
Or may be my tcpdump output is enough to get right answer ? :)

Thanks in advance.

