From: "Paul F. Bernal B. - EasyTeck" <pbernal@easyteck.com>
Subject: NAT question (forwarding with subdomains)
Date: Thu, 13 May 2004 12:52:21 -0500 (ECT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <55621.200.107.22.222.1084470741.squirrel@www.easyteck.com>
References: <20040513172702.17791.51996.Mailman@vishnu.netfilter.org>
Reply-To: pbernal@easyteck.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040513172702.17791.51996.Mailman@vishnu.netfilter.org>
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

Hi!,

I got an internal 192.168.0.0/24 LAN with about 5 web servers including
the one which has iptables running and internet output ...

in the firewall script:
* INTERNALIF="eth1"
* INTERNALNET="192.168.0.0/24"
* INTERNALBCAST="192.168.0.255"
* EXTERNALIF="eth0"
* MYADDR="200.107.XXX.XXX"

got a rule that works fine that forwards the mail packets to the
192.168.0.2 machine:
$IPTABLES -A PREROUTING -t nat -i $EXTERNALIF -p tcp -d $MYADDR --dport 25 \
                      -j DNAT --to 192.168.0.2:25
$IPTABLES -A FORWARD -i $EXTERNALIF -p tcp -d 192.168.0.2 --dport 25 -j
ACCEPT

I have a couple subdomains pointing to MYADDR sub1.mydomain.com,
sub2.mydomain.com, etc...

What I need to do is:

When someone in the Internet asks for http://sub1.mydomain.com/ respons
the 192.168.0.3 machine (wich has a web server running port 80)

When someone in the Internet asks for http://sub2.mydomain.com/ responds
the 192.168.0.4 machine (wich has a web server running port 80)

etc., etc., etc...

I've tried something like this, but doesn't works !!!

$IPTABLES -A PREROUTING -t nat -i $EXTERNALIF -p tcp -d sub1.mydomain.com
--dport 80 \
                      -j DNAT --to 192.168.0.3:80
$IPTABLES -A FORWARD -i $EXTERNALIF -p tcp -d 192.168.0.3 --dport 80 -j
ACCEPT

Pliz give me a hand on this, thanks in advance ...

----------
don pool

