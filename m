From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: firewall iptables based ?
Date: Thu, 08 Sep 2005 07:56:52 -0400
Message-ID: <1126180612.2631.13.camel@localhost>
References: <NHBBLNDNFKDMKNNKGOMMMEOEMDAA.gregoriandres@yahoo.com.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <NHBBLNDNFKDMKNNKGOMMMEOEMDAA.gregoriandres@yahoo.com.ar>
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
To: LinuXKiD <gregoriandres@yahoo.com.ar>
Cc: netfilter@lists.netfilter.org

On Wed, 2005-09-07 at 23:39 -0300, LinuXKiD wrote:
> hi .. !
> 
> which open source firewall iptables based
> you recommend ?
> 
> I've checked smoothwall and shoreline, but on
> freshmeat.net I've see many more !
> 
> bests
> 
> andres
> 
I'm not sure if you are looking for tools to configure your own hardware
device or whether you are looking for appliances.

On the appliance side, we have recently been doing quite a bit with the
CyberGuard Snapgear series.  They are inexpensive and reasonably full
featured.  We found some limitations when we tried doing some more
exotic functions.  For example, although they are Linux based, the units
below the SG580 do not use a bash shell but rather the much more limited
sash shell.  That created some major scripting problems for us.

We also found some of the functionality pretty seriously hacked.  There
is no iptables-restore yet. There is iptables-batch but it only works
with the SG built-in rules.  They do have FreeS/WAN but it is very
early, heavily modified version which lacks some important
functionality.  However, to do what one normally does, they are
perfectly adequate and are, from what I understand, significant
contributors to the open source community.

We were surprised to see that 3Com's low end devices are Linux based.
We plan to get our hands on some and see how they measure up.  I don't
know if anyone else on the list has experience with them.

I believe the WatchGuard line from the 500 series and above is Linux
based but I think they use a proprietary firewall and not iptables.

Astaro has been a great supporter of the community and does have their
software running on a Toshiba box, I believe.  I heard generally good
things but have not used them.

If you are looking for software to help build your own hardware
firewall, I have traditionally used fwbuilder
(http://www.fwbuilder.org).  Some prefer a less automated tool with more
granular control.  I apologize to the gentleman who produced it but I've
forgotten its name again.  There was a post a few months ago about a
very well received new tool that really did simply present a GUI to
create rules.

On the other extreme is the still uncompleted ISCS
(http://iscs.sourceforge.net).  It has developed enough to create the
iptables rule sets but has yet to integrate routing, VPN and PKI and is
missing some editing functionality. It is designed for
enterprise/carrier class deployments or hundreds to tens of thousands of
users and tens to thousands of gateways.  It is not a rule configurator.
Rather, one describes the security environment and ISCS creates
consistent rule sets for access control, NAT, VPN, and routing and
automatically deploys them to the enforcement devices.  It is designed
for multiple, concurrent administrators to administer a global network
of security devices including networks with multiple commercial clients
(e.g., MSPs, ISPs).

Hope that helps - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


