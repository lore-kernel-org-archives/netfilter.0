From: SBlaze <dagent.geo@yahoo.com>
Subject: state matching vrs prerouting.... ???
Date: Fri, 21 Mar 2003 06:53:11 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030321145311.14296.qmail@web40203.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Firewall Snipet

# Experimental UDP Filters
#
# iptables -A INPUT -p udp -i eth0 -m state --state NEW,INVALID -j DROP
# iptables -A INPUT -p udp -i eth0 -m state --state ESTABLISHED,RELATED -j
ACCEPT

# CounterStrike NAT Line
#
iptables -t nat -A PREROUTING -p udp --dport 27015 -i eth0 -j DNAT
--to-destination 192.168.1.25:27015

Ok the UDP filters physically come before my CounterStrike line. In reading
Oskar's tutorial I as under the impression that the nat tables rules took
precedence before the filter tables.... However the UDP rules drop the incoming
CS       
requests before they are prerouted... What gives? 

=====
"No touchy NO TOUCHY! Emperor Kuzko -=Emperor's New Groove=-"

__________________________________________________
Do you Yahoo!?
Yahoo! Platinum - Watch CBS' NCAA March Madness, live on your desktop!
http://platinum.yahoo.com

