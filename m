From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: vpn under linux
Date: Sat, 10 Apr 2004 08:30:11 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1081600210.491.12.camel@localhost>
References: <4077B7EF.5070805@tin.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4077B7EF.5070805@tin.it>
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
To: Gianni Pucciani <gp.puccio@tin.it>
Cc: Netfilter <netfilter@lists.netfilter.org>

On Sat, 2004-04-10 at 05:01, Gianni Pucciani wrote:
> Hi all,
> some of you can give me some input about the best way to set up a vpn 
> under two Linux RH9 systems?
> I heared there are different solution (PPP and SSH, PPTP...) and I'd 
> like to know your opinion about that.
> Thanks
> 
> Gianni

Like Antony, we prefer and utilize IPSec for network to network
connections.  In fact, our entire business model of global delivery of
IT services from centralized GNOCs is built around it and have used it
for very complex and very large site to site configurations (hundreds of
gateways and thousands of users and planned for thousands of gateways
and tens of thousands of users).  We are in the process of transitioning
from an extraordinarily powerful but obscure proprietary product to an
open source solution.

The closest solution we could find to rival the commercial offerings on
such a large scale is netfilter + freeS/WAN + iproute2 + ISC DHCP +
StrongSec DHCP Relay + OpenCA.  There are reasonable alternatives to
OpenCA.

The FreeS/WAN code is alive and healthy.  Two major cooperative forks
are available.  One is at www.openswan.org and the other is at
www.strongswan.org.  Both are well supported and helpful.

There a fairly complete although slightly dated slide shows on tying all
these technologies together (other than OpenCA) in the training section
of http://iscs.sourceforge.net.

The only major missing piece right now to make this combination a
full-fledged competitor to the largest and most expensive commercial
players is a sophisticated management front end such as those offered by
Solsoft, SmartPipes, NetScreen, Checkpoint, etc.  That is the hole I am
trying to fill with the ISCS project.  It is the last piece that we need
before we can do with open source tools what we have previously only
been able to do with commercial tools to achieve the scale and
complexity we need. If anyone wants to help, it is a huge project and I
can use all the help I can get!

-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com


