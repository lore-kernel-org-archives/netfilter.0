From: "ryan @ thedataarc" <ryanb@thedataarc.com>
Subject: VPN "Punch-through"
Date: 20 Sep 2002 23:54:15 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1032584055.1252.23.camel@rbhome.inside.thedataarc.com>
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

Hi

I help operate an ISP, delivering bandwidth to 50-60 people in Kansas.
Right now, I have a cell that is all public IPs.  I'd like to convert it
to a private subnet (10.1.2.3) as we've done in other scenarios.

The main reason for this is to lower bandwidth usage by superfluous
traffic like scans and hack attempts on unwary (insecure) subscribers. 
It can tremendously help wireless performance.

I have two computers currently using a VPN router to link to a remote
office (outside our realm).

If we convert to a filtered private system, is it possible to use a
"DMZ" virtual IP approach to NAT traffic to the VPN routers on the
inside?  (Moving our current VPN IP to a virtual on the netfilter
router.)

I have already mapped virtual IPs through this setup in other cells for
other purposes, but not for VPNs.

Interesting, weird I know.  Possible?
All pointers welcome here.

Thanks in advance,

Ryan

ryanb -atnosp@m- () thedataarc.com









