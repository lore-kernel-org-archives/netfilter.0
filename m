From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Microsoft PPTP VPN server behind FIREWALL
Date: Tue, 25 Mar 2003 08:57:09 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122DA1@alderaan.smgtec.com>
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
To: Remus <rmocius@auste.elnet.lt>, netfilter@lists.netfilter.org

PPTP also uses ip protocol 47, so use something like:

iptables -t nat -A PREROUTING -d $EXTERNALIP -p 47 -j DNAT --to
192.168.1.150

I know there was a conntrack module, and I am not sure if that was only
for SNAT or if it did DNAT as well.

-----Original Message-----
From: Remus [mailto:rmocius@auste.elnet.lt]=20
Sent: Tuesday, March 25, 2003 5:09 AM
To: netfilter@lists.netfilter.org
Subject: Microsoft PPTP VPN server behind FIREWALL

Hi folks,

I have running the Microsoft PPTP VPN server behind my Firewall with
MASQ.

I tried to use this command to make a forward to itenal IP address:
iptables -t nat -A PREROUTING -d $EXTERNALIP -p tcp --dport 1723 -j
DNAT --to 192.168.1.150:1723
But it doesn't work, I mean I cannot connect to my VPN server from
outside.

Any ideas or issues?

Thank you in advance for the help. :-)

Remus




