From: Les Mikesell <les@futuresource.com>
Subject: avoid NAT for one address?
Date: Sat, 24 Jul 2004 12:00:48 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1090688447.17721.24.camel@les-home.futuresource.com>
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

I am using an SME server in several remote offices.  This is a
modified RedHat 7.3 with template-built config files for most
system programs including iptables (see http://www.e-smith.org).
The stock system handles two interfaces with masquerading and
a fairly tight firewall on the public side and all works fine.
Then I've dropped in a CIPE vpn tunnel back to the main office
and added rules to accept anything to/from the cipcb0 interface
it adds.  So far so good.   Now the complication is that in a few
offices there is also a Cisco router with a frame relay connection
back to the main office and I'd like to make the CIPE vpn act as
a backup for the frame circuit.  To do that, I set up a GRE tunnel
between the routers and static-routed the endpoints through the
CIPE vpn. That lets it carry multicast and cisco's eigrp routing
protocol, etc. and worked fine with an earlier ipchains based setup.
Now, my problem is that something from the SME templates is
causing the GRE packets from the cisco to be SNAT'ed with the
public interface address as it is sent out the CIPE interface (I
can see this with tcpdump but can't figure out why it is happening).
Other packet types work correctly with the same source/destination
so it is probably a bug in the special rules for pptp.

So, the long story comes down to this question: is there a simple
statement I can add to force all packets to a certain destination
to skip over all the other special cases and go directly out the
right interface with no nat or other changes?  I'd like to keep the
changes to a minimum since everything else works.

---
  Les Mikesell
    les@futuresource.com



