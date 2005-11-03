From: "Seferovic Edvin" <edvin.seferovic@kolp.at>
Subject: RE: NAT between incomming PPP and office network
Date: Thu, 3 Nov 2005 19:12:17 +0100
Message-ID: <26719.6375680671$1131041710@news.gmane.org>
References: <e63dd3500511030957h218d9393yc58eddb3b44ab772@mail.gmail.com>
Reply-To: edvin.seferovic@kolp.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <e63dd3500511030957h218d9393yc58eddb3b44ab772@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

Hi,

I've set up a similar box. I've used ip-up and ip-down scripts to
enter/remove a rule that contains SNATing of ppp client address. Also I have
allowed traffic to be forwarded between ext_dev and ppp+, as well as INPUT
and OUTPUT policies for ppp+ devices set to ALLOW. Maybe you've missed one
of those.

Regards,

Edvin Seferovic

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Matthew Price
Sent: Donnerstag, 03. November 2005 18:57
To: netfilter@lists.netfilter.org
Subject: NAT between incomming PPP and office network

Howdy All;

I have been pulling my hair out over what is probably a simple
question.  I've been through lots of docs and the list archives, but
can't seem to find anything that works.

I have an unsecured wireless AP that connects to a Debian testing box
at eth2.  Clients PPTP to this box.  This puts them on PPP through an
encrypted link.  All that is working successfully.

eth2 is at 192.168.0.1 and wireless clients DHCP at 192.168.0.100-199
PPTP sets up PPP links with the master as 192.168.1.1 and
authenticated clients get 192.168.1.100-199

All that I already have working with Windows PPTP client on the
wireless end and PopTop on the Debian box.  Clients can ping each
other and the Linux box on the unencrypted WLAN; clients can ping down
the established PPP link to the Debian box.

What I'm having trouble with is getting the PPP clients to
nat/masq/whatever across the Debian box to eth1 which is my internal
office LAN.  I (tried to) setup a NAT on the Debian box like:

iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to (ip already
assigned to eth1)

PPP clients can ping the address assigned to eth0 (used by a web
server hosted on the same box) and eth1, but don't get passed across
to other addresses on the LAN that eth0 and eth1 share.

How can I get all incoming PPP connections NATed across to eth1?  I'll
setup a restrictive firewall against the open WLAN, but I don't want
any filtering or firewalling between the PPP connections and the LAN,
just completely transparent NAting - as much as possible.  What have I
missed?

Thanks,
Matthew



