From: "Galiatsis Sokratis" <sokratisg@optusclub.gr>
Subject: problem with nmap
Date: Mon, 16 Feb 2004 16:08:24 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001901c3f496$5feac900$7b00000a@optusclub.gr>
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

I want to know if there is a "special" rule which blocks all nmap scanning
methods. I have something here for fragments, xmas, nmap etc but whenever i
try to test it my server ports are always shown as open instead of stealth.
I tried Online Symantec Security Scan and nmapping from another host from an
external network. Both show the same results.

Thanx in advance.

P.S: First submission in this mailing-list and I am a little confused to
find answers in the emailed digest i receive. In addition to the
mailing-list please email me for any suggestion you may have.
sokratisg@optusclub.gr

Here are the rules i use for filtering all incoming traffic from ports 0 -
1024. Above 1025 port any incoming (RELATED, ESTABLISHED) is allowed. These
custom chains are inserted first from all in both INPUT and OUTPUT so that
anything incoming not acceptable gets DROPed emmediately.

#BAD_PACKETS CHAIN
$iptables -A bad_packets -p tcp ! --syn -m state --state NEW -j
LOG --log-level crit
$iptables -A bad_packets -p tcp ! --syn -m state --state NEW -m
limit --limit 6/h --limit-burst 5 -j DROP
#SYNFLOOD CHAIN
$iptables -A synflood -m limit --limit 1/s --limit-burst 4 -j RETURN
$iptables -A synflood -j DROP
#FRAGMENTS
$iptables -A INPUT -i $ADSLIF -f  -m limit --limit 6/h -j LOG
$iptables -A INPUT -i $ADSLIF -f -j REJECT
#INVALID TCP PACKETS
$iptables -A bad_packets -p tcp -m state --state INVALID -j LOG --log-level
crit
$iptables -A bad_packets -p tcp -m state --state NEW -m limit --limit
6/h --limit-burst 5 -j DROP

##PORTSCANS CHAIN
# ** FIN **
$iptables -A portscans -p tcp -m tcp --tcp-flags ALL,FIN FIN -j DROP
# ** XMAS Tree **
$iptables -A portscans -p tcp -m tcp --tcp-flags ALL FIN,URG,PSH -j DROP
# ** Fin/Syn **
$iptables -A portscans -p tcp -m tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
# ** ACK **
$iptables -A portscans -p tcp -m tcp --tcp-flags ALL,ACK  ACK -j DROP
# ** NULL **
$iptables -A portscans -p tcp -m tcp --tcp-flags ALL NONE -j DROP



