From: Valentijn Sessink <valentyn+netfilter-users@nospam.openoffice.nl>
Subject: Re: [despammed] port based filtering and IPsec 2.6
Date: Wed, 21 Jan 2004 16:37:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040121153748.GA2715@openoffice.nl>
References: <20040114162623.GR4106@openoffice.nl> <20040117134519.GA4911@kaufbach.delug.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040117134519.GA4911@kaufbach.delug.de>
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
To: Andreas Kretschmer <andreas_kretschmer@despammed.com>
Cc: netfilter@lists.netfilter.org

At Sat, Jan 17, 2004 at 02:45:19PM +0100, Andreas Kretschmer wrote:
> > Simply use a *tunnel* between the two hosts, and define the subnets to
> > be "tunneled" to be the hosts themselves
> Okay, but you can't filtering packets. It's not possible to filter, for
> instance, all traffic from/to telnet-port and enable all traffic to/from
> ssh-port.

Yes you can. Re-read my post, and be creative.

Example: suppose you want to setup a secure connection between host1 and
host2, and you want to allow POP3 between these, but only if the POP3 came
in through IPsec.

Steps to take:
1) set up a VPN between host1 and host2. NOTE: use tunnel mode for this, not
transport mode! I repeat: use tunnel mode, not transport! NOTE 2: when using
tunnel mode, you MUST use authentication, otherwise your VPN is not secure!

2) set up your firewalling:
# first, we set a "mark" on every IPsec packet that comes in.
iptables -A INPUT -p esp -t mangle -j MARK --set-mark 1

# the Linux kernel keeps the MARK after a packet has been decrypted, so
# we can check for the mark to see if a packet came in through IPsec. This
# is equivalent to the ipsec0 virtual interface that FreeS/WAN has.
#
# we are silly firewall builders and we accept every "marked" packet that
# goes to port 110. DO NOT DO THIS AT HOME, you should probably use stateful
# firewalling for this.
iptables -A INPUT -p tcp --dport pop3 -m mark --mark 1 -j ACCEPT
# we drop all other packets to port 110
iptables -A INPUT -p tcp --dport pop3 -j DROP

V.
-- 
Blokkeer die vervelende popup-advertenties met Mozilla: www.mozilla.org
-
http://www.openoffice.nl/   Open Office - Linux Office Solutions
Valentijn Sessink  valentyn+sessink@nospam.openoffice.nl

