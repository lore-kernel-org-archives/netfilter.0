From: jr@troncale.com
Subject: help with LAN to DMZ Forward rules
Date: Wed, 7 Jan 2004 21:30:58 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401080230.i082Uwg03789@marisa>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="bound1073528998"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

--bound1073528998
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I'd like to request help with an iptables ruleset. There are 3 adapters on my Redhat 7.3, running iptables 1.2.8. EXTIF faces the Internet, and DMZ_IF and LAN_IF use reserved addresses in distinct subnets.

So far I've had success configuring it so the firewall allows access to the DMZ from the Internet, while only ESTABLISHED or RELATED packets are forwarded back into the LAN. That's the only FORWARDing happening on the firewall at this point.

What's got me stumped is how to FORWARD packets from the LAN to the DMZ.

There are a number of tutorials on the Internet that suggest the following code is the best way to achieve this:


# This one allows traffic from the DMZ to the LAN if it originated in the LAN:

$IPTABLES -A FORWARD -i $DMZ_IF -o $LAN_IF -m state --state ESTABLISHED,RELATED -j ACCEPT


# And this one is supposed to allow hosts within the LAN to initiate an HTTP session with the webserver in the DMZ:

$IPTABLES -A FORWARD -i $LAN_IF -o $DMZ_IF -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT


The webserver in the DMZ is definitely working, and can be reached from the Internet. The tutorials point out that INPUT and OUTPUT rules would not affect what I'm trying to do here. My browser times out when I try to access the DMZ webserver from the LAN. There is an entry in the LAN computer's 'hosts' file for the webserver; typing the ip address of the DMZ webserver into the address bar of the browser also results in a times out.

Thank you very much for your help.

Jamie



--bound1073528998--

