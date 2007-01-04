From: "Chris Nighswonger" <cnighswonger@foundations.edu>
Subject: POP, SMTP forward question
Date: Thu, 4 Jan 2007 08:50:30 -0500
Message-ID: <cdae243a0701040550h58991057q3d7b6ef9edd77cce@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi all,
  I'm fairly new to iptables and would like some input on my firewall
config. I have a linux box setup as a proxy to the internet. It is the
only box on the network with internet access. I use browser proxy
configurations on the client machines to send all http, etc traffic to
the linux box. I want to be able to permit pop and smtp traffic to
flow through the linux box to the internet unproxied, but deny any
other traffic. My current iptables config appears to meet these
requirements well, however, I would like the config to be as tight as
possible without being over paranoid. Here is my current iptables
config. Any suggestions regarding this config are welcome.

# eth2 192.168.2.0/24 Dirty side
# eth0 192.168.0.0/24 Clean side
*nat
:PREROUTING ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
-A POSTROUTING -s 192.168.0.0/255.255.255.0 -o eth2 -j MASQUERADE
COMMIT
*mangle
:PREROUTING ACCEPT [862:117148]
:INPUT ACCEPT [862:117148]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [861:116919]
:POSTROUTING ACCEPT [861:116919]
COMMIT
*filter
:FORWARD DROP [0:0]
:INPUT ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A FORWARD -m state -o eth0 --state NEW,RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -m state -i eth0 --state RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -p tcp -m tcp -m multiport -i eth0 -j ACCEPT --dports 25,110,465,995
-A FORWARD -p tcp -m tcp -o eth2 --dport 31337:31340 --sport 31337:31340 -j DROP
-A FORWARD -s 192.168.0.0/255.255.255.0 -i eth2 -j DROP
-A OUTPUT -p tcp -m tcp -o eth2 --dport 31337:31340 --sport 31337:31340 -j DROP
COMMIT

-- 
Chris Nighswonger
Network & Systems Director
Foundations Bible College & Seminary
www.foundations.edu
cnighswonger >at< foundations >daught< edu

