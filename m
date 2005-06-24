From: Kenneth Kalmer <kenneth.kalmer@gmail.com>
Subject: Firewall feature recommendation
Date: Fri, 24 Jun 2005 12:56:50 +0200
Message-ID: <fad9d48405062403562537f546@mail.gmail.com>
Reply-To: Kenneth Kalmer <kenneth.kalmer@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
To: NetFilter <netfilter@lists.netfilter.org>

Guys

I've built several iptables-based firewalls for some clients and
personal use. Some of them are horrors, now that I look back on
them... I want to build my own 'all-in-one' firewall for the most
common network setups I use... I've used various other GPL'ed scripts
for references in past firewalls and they do tend to open one's eyes a
bit, thanks for everyone who released their scripts under the GPL.

I understand iptables, so that's covered. I'm constantly researching
security cause it's so damn interesting to see the precautions some
people take, and the level of protection you yourself would never even
have dreamed about...

Now, these are the features (independent of implementation) that I've
considered to put into my firewall:
- Support for multiple interfaces on both LAN & WAN
- NAT & DMZ
- Black lists for inbound & outbound traffic
- Host services (global or per interface, allows seperation between
LAN & WAN services)
- Access control on MAC, IP, or MAC-IP pairing
- Administrative services (SSH) access control on MAC or MAC-IP pairing
- VPN (IPSec, PPTP & SSL)
- QoS
- ICMP control
- Managed logging
- Expansion through custom chains*

* Expansion through custom chains might help those often found
scenarios that render your standard firewall inoperable. By creating
say, a PREINPUT chain or POSTINPUT chain, another script can modify
that chain for any function not covered by the standard firewall
features.

I've got the "Modular Firewall Product Certification Criteria version
4.1" from ICSAlabs, but I've not had any time to investigate it yet.

Please remember, this discussion is intended to be about features, not
implementation. I'll cross that bridge when I get there...

Any suggestions & advice would be appreciated.

Kind regards

--=20

Kenneth Kalmer
kenneth.kalmer@gmail.com

Folding@home stats
http://vspx27.stanford.edu/cgi-bin/main.py?qtype=3Duserpage&username=3Dkenn=
eth%2Ekalmer

