From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: two o more NAT  + PREROUTING
Date: Wed, 2 Apr 2003 17:28:42 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF50C6FF6@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

Are you sure that the computer 10.2.89.250 is setup to use IP address
192.168.0.115 as its default router?

192.168.0.115 thinks that the message is being sent by 132.248.69.34,
and it will take its default path in order to get there. If that is not
through your NAT firewall's IP address setup, it will break, since the
acknowledgement will miss the conntrack and everything else.

To be sure you have it right, you can setup a 2 sided bridge. This will
guarantee connectivity, but you will loose web server tracking of IP
addresses.

# Packets traveling to FW1 now go to FW2
iptables -t nat -A PREROUTING -d 148.243.xxx.xxx -p tcp --dport 80 -j
DNAT --to 192.168.0.115

# Packets returning will go from FW2 to FW1
iptables -t nat -A POSTROUTING -d 192.168.0.115 -p tcp --dport 80 -j
SNAT --to 148.243.xxx.xxx (or whatever FW1's FW1->FW2 IP address is)

# Packets traveling to FW2 now go to WEBSERVER
iptables -t nat -A PREROUTING -d 192.168.0.115 -p tcp --dport 80 -j DNAT
--to 10.2.89.250

# Packets returning will go from WEBSERVER to FW2
iptables -t nat -A POSTROUTING -d 10.2.89.250 -p tcp --dport 80 -j SNAT
--to 192.168.0.115 (or whatever FW2's FW2->WEBSERVER IP address is)

Your System:
A->B becomes A->C becomes A->D

My system:
A->B becomes B->C becomes C->D



