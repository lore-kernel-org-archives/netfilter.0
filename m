From: "David Gutierrez" <david@bioinfo.cu>
Subject: Can not redirect  ssh
Date: Thu, 31 Jul 2003 11:46:10 -0400 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <33578.10.0.1.9.1059666370.squirrel@webmail.bioinfo.cu>
Reply-To: david@bioinfo.cu
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

Hi:

I want to redirect the ssh from the internet to a local machine in my
network The local machine have the ip 10.0.1.198 and have the ssh service
running.
My firewall have the ip--> FIREWALL_IP.

Besides I  cannot get the logs in /var/log/messages either.

Any clue?

David


*nat
:PREROUTING ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A PREROUTING -i eth0 -p tcp -d FIREWALL_IP --dport 2222 -j DNAT
--to-destination 10.0.1.198:22
-A POSTROUTING -o eth0 -p tcp -s 10.0.1.0/24  -d ! 10.0.1.0/24 -j MASQUERADE
COMMIT
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:RH-Lokkit-0-50-INPUT - [0:0]
:LOGGING - [0:0]
-A INPUT -j RH-Lokkit-0-50-INPUT
-A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 53 --syn -j ACCEPT
-A RH-Lokkit-0-50-INPUT -p udp -m udp --dport 53 -j ACCEPT
-A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 80 --syn -j ACCEPT
-A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 81 --syn -j ACCEPT
-A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 21 --syn -j ACCEPT
-A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 22 --syn -j ACCEPT
-A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 23 --syn -j ACCEPT
#
-A RH-Lokkit-0-50-INPUT -i lo -j ACCEPT
-A RH-Lokkit-0-50-INPUT -i eth0 -j ACCEPT
-A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 0:1023 --syn -j LOGGING
-A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 2049 --syn -j LOGGING
-A RH-Lokkit-0-50-INPUT -p udp -m udp --dport 0:1023 -j LOGGING
-A RH-Lokkit-0-50-INPUT -p udp -m udp --dport 2049 -j LOGGING
-A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 6000:6009 --syn -j LOGGING
-A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 7100 --syn -j LOGGING
-A LOGGING -j LOG --log-level info --log-prefix "DROPED_PACKETS:"
-A LOGGING -j DROP
COMMIT






