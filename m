From: Matt Domsch <matt@domsch.com>
Subject: ip_nat_pptp ICMP rejected failures
Date: Wed, 5 Oct 2005 10:13:09 -0500
Message-ID: <20051005151309.GA28129@domsch.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: Harald Welte <laforge@netfilter.org>
Cc: netfilter@lists.netfilter.org

Harald, thanks much for your efforts on the ip_nat_pptp helper.  I've
been using a 2.2 kernel on my firewall for years simply because it had
this functionality.

I have this problem with 2.6.14-rc3.  With ip_nat_pptp loaded,
through a NAT, I get this behavior:

No.     Time        Source                Destination           Protocol Info
      1 0.000000    NAT-CLIENT          PPTP-SERVER         TCP      3347 > 1723 [SYN] Seq=0 Ack=0 Win=64512 Len=0 MSS=1460
      2 0.000237    FW-PUBLIC-IP        PPTP-SERVER         TCP      3347 > 1723 [SYN] Seq=0 Ack=0 Win=64512 Len=0 MSS=1460
      3 0.026441    PPTP-SERVER         FW-PUBLIC-IP        TCP      1723 > 3347 [SYN, ACK] Seq=0 Ack=1 Win=16384 Len=0 MSS=1460
      4 0.026574    PPTP-SERVER         NAT-CLIENT           TCP      1723 > 3347 [SYN, ACK] Seq=0 Ack=1 Win=16384 Len=0 MSS=1460
      5 0.027555    NAT-CLIENT          PPTP-SERVER         PPTP     Start-Control-Connection-Request
      6 0.027652    FW-PUBLIC-IP        PPTP-SERVER         PPTP     Start-Control-Connection-Request
      7 0.051931    PPTP-SERVER         FW-PUBLIC-IP        PPTP     Start-Control-Connection-Reply
      8 0.052072    PPTP-SERVER         NAT-CLIENT          PPTP     Start-Control-Connection-Reply
      9 0.063546    NAT-CLIENT          PPTP-SERVER         PPTP     Outgoing-Call-Request
     10 0.063654    FW-PUBLIC-IP        PPTP-SERVER         PPTP     Outgoing-Call-Request
     11 0.090422    PPTP-SERVER         FW-PUBLIC-IP        PPTP     Outgoing-Call-Reply
     12 0.090565    PPTP-SERVER         NAT-CLIENT          PPTP     Outgoing-Call-Reply
     13 0.096314    NAT-CLIENT          PPTP-SERVER         PPTP     Set-Link-Info
     14 0.096397    FW-PUBLIC-IP        PPTP-SERVER         PPTP     Set-Link-Info
     15 0.096428    NAT-CLIENT          PPTP-SERVER         PPP LCP  Configuration Request
     16 0.096527    FW-PUBLIC-IP        PPTP-SERVER         PPP LCP  Configuration Request
     17 0.126681    PPTP-SERVER         FW-PUBLIC-IP        PPP LCP  Configuration Request
     18 0.127033    FW-PUBLIC-IP        PPTP-SERVER         ICMP     Destination unreachable (Protocol unreachable)
     19 0.127074    PPTP-SERVER         FW-PUBLIC-IP        PPP LCP  Configuration Ack
     20 0.127177    FW-PUBLIC-IP        PPTP-SERVER         ICMP     Destination unreachable (Protocol unreachable)
     21 0.312610    PPTP-SERVER         FW-PUBLIC-IP        TCP      1723 > 3347 [ACK] Seq=189 Ack=349 Win=17172 Len=0
     22 0.312723    PPTP-SERVER         NAT-CLIENT          TCP      1723 > 3347 [ACK] Seq=189 Ack=349 Win=17172 Len=0
     23 1.937329    PPTP-SERVER         FW-PUBLIC-IP        PPP LCP  Configuration Request
     24 1.937557    FW-PUBLIC-IP        PPTP-SERVER         ICMP     Destination unreachable (Protocol unreachable)
     25 2.098675    NAT-CLIENT          PPTP-SERVER         PPP LCP  Configuration Request
     26 2.098788    FW-PUBLIC-IP        PPTP-SERVER         PPP LCP  Configuration Request
     27 2.122375    PPTP-SERVER         FW-PUBLIC-IP        PPP LCP  Configuration Ack
     28 2.122580    FW-PUBLIC-IP        PPTP-SERVER         ICMP     Destination unreachable (Protocol unreachable)
     29 4.937426    PPTP-SERVER         FW-PUBLIC-IP        PPP LCP  Configuration Request
     30 4.937632    FW-PUBLIC-IP        PPTP-SERVER         ICMP     Destination unreachable (Protocol unreachable)
     31 5.108775    NAT-CLIENT          PPTP-SERVER         PPP LCP  Configuration Request
     32 5.108878    FW-PUBLIC-IP        PPTP-SERVER         PPP LCP  Configuration Request
     33 5.133111    PPTP-SERVER         FW-PUBLIC-IP        PPP LCP  Configuration Ack
     34 5.133317    FW-PUBLIC-IP        PPTP-SERVER         ICMP     Destination unreachable (Protocol unreachable)
     35 7.549272    NAT-CLIENT          PPTP-SERVER         PPTP     Set-Link-Info
     36 7.549405    FW-PUBLIC-IP        PPTP-SERVER         PPTP     Set-Link-Info
     37 7.549444    NAT-CLIENT          PPTP-SERVER         PPP LCP  Termination Request
     38 7.549510    FW-PUBLIC-IP        PPTP-SERVER         PPP LCP  Termination Request
     39 7.572922    PPTP-SERVER         FW-PUBLIC-IP        PPP LCP  Termination Ack
     40 7.573142    FW-PUBLIC-IP        PPTP-SERVER         ICMP     Destination unreachable (Protocol unreachable)
     41 7.748978    PPTP-SERVER         FW-PUBLIC-IP        TCP      1723 > 3347 [ACK] Seq=189 Ack=373 Win=17148 Len=0
     42 7.749092    PPTP-SERVER         NAT-CLIENT          TCP      1723 > 3347 [ACK] Seq=189 Ack=373 Win=17148 Len=0


and no PPP authentication ever succeeds.

If I don't have ip_nat_pptp and ip_conntrack_pptp loaded, I don't get
the ICMP messages, and authentication succeeds, though I can only have
on PPTP session between any of my clients and the server.

My iptables firewall rules, generated by a Fedora Core 4 system, look like:

# Firewall configuration written by system-config-securitylevel
# Manual customization of this file is not recommended.
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:RH-Firewall-1-INPUT - [0:0]
-A INPUT -j RH-Firewall-1-INPUT
-A FORWARD -j RH-Firewall-1-INPUT
-A RH-Firewall-1-INPUT -i lo -j ACCEPT
-A RH-Firewall-1-INPUT -i eth1 -j ACCEPT
-A RH-Firewall-1-INPUT -p icmp --icmp-type any -j ACCEPT
-A RH-Firewall-1-INPUT -p 50 -j ACCEPT
-A RH-Firewall-1-INPUT -p 51 -j ACCEPT
-A RH-Firewall-1-INPUT -p udp --dport 5353 -d 224.0.0.251 -j ACCEPT
-A RH-Firewall-1-INPUT -p udp -m udp --dport 53 -j ACCEPT
-A RH-Firewall-1-INPUT -p tcp -m tcp --dport 53 -j ACCEPT
-A RH-Firewall-1-INPUT --protocol gre  -j ACCEPT
-A RH-Firewall-1-INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A RH-Firewall-1-INPUT -j REJECT --reject-with icmp-host-prohibited
COMMIT
*mangle
:PREROUTING ACCEPT [0:0]
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
-A PREROUTING -i eth1 -j MARK --set-mark 0x9
COMMIT
*nat
:PREROUTING ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
-A POSTROUTING -m mark --mark 0x9 -j MASQUERADE
COMMIT


though I've tried both with and without the REJECT rule.

I'd appreciate any advice you can provide.

Thanks,
Matt

