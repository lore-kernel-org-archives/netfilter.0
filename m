From: Ranjeet Shetye <ranjeet.shetye2@zultys.com>
Subject: RE: Can I have DES / 3 DES VPN with IPtables Kernal kernel versio
	n 2. 4.20 with IPSEC installed
Date: Thu, 18 Dec 2003 18:55:19 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071802519.3811.10.camel@ranjeet-pc2.zultys.com>
References: <A44765C986F8D411995B00B0D0795F4B1E9A1B20@hhtnt002>
	 <1071800967.1866.11.camel@jasiiitosh.nexusmgmt.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1071800967.1866.11.camel@jasiiitosh.nexusmgmt.com>
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
To: Narsaiah@satyam.com
Cc: netfilter@lists.netfilter.org

On Thu, 2003-12-18 at 18:29, John A. Sullivan III wrote:
> No but that you can use it in conjunction with FreeS/WAN which does
> provide a 3DES VPN (http://www.freeswan.org)
> 
> On Thu, 2003-12-18 at 20:48, Laxmi_Narsaiah wrote:
> > I am sorry, I am not clear...U mean to say this IPTABLES supports 3DES
> > ???
> > 
> > -----Original Message-----
> > From: John A. Sullivan III [mailto:john.sullivan@nexusmgmt.com]
> > Sent: Thursday, December 18, 2003 8:25 PM
> > To: Laxmi_Narsaiah
> > Cc: 'netfilter@lists.netfilter.org'
> > Subject: Re: Can I have DES / 3 DES VPN with IPtables Kernal kernel
> > version 2. 4.20 with IPSEC installed
> > 
> > 
> > On Thu, 2003-12-18 at 07:58, Laxmi_Narsaiah wrote:
> > > Hi,
> > > 
> > > Can I have DES / 3 DES VPN with IPtables Kernal kernel version
> > 2.4.20
> > > with IPSEC installed, please let me know.
> > > 
> > <snip>
> >         We do this all the time with FreeS/WAN.  In fact, we are
> > developing a
> > GUI front end to managed combined firewall and VPN security for large,
> > complex implementations.  You can find training slide shows on using
> > iptables, FreeS/WAN, iproute2 and DHCP at http://iscs.sourceforge.net
> > -
> > Good luck
> > -- 
> > John A. Sullivan III
> > Chief Technology Officer
> > Nexus Management
> > +1 207-985-7880
> > john.sullivan@nexusmgmt.com
> > ---
> > If you are interested in helping to develop a GPL enterprise class
> > VPN/Firewall/Security device management console, please visit
> > http://iscs.sourceforge.net
> > ************************************************************************** 
> > This email (including any attachments) is intended for the sole use of
> > the intended recipient/s and may contain material that is CONFIDENTIAL
> > AND PRIVATE COMPANY INFORMATION. Any review or reliance by others or
> > copying or distribution or forwarding of any or all of the contents in
> > this message is STRICTLY PROHIBITED. If you are not the intended
> > recipient, please contact the sender by email and delete all copies;
> > your cooperation in this regard is appreciated.
> > 
> > **************************************************************************

Laxmi,

NetFilter = Linux's in-kernel rules-based mechanism to carry out
IP-level packet manipulation e.g. SNAT, DNAT, packet filtering etc.

IPTables = user-space tools to program the NetFilter rules into the
kernel. IPTables is not directly related to VPNs in any way whatsoever.
However, IPTables may be used for the packet filtering and NAT rules to
help the VPN traffic. IPTables does not deal with 3DES etc.

VPNs can be implemented using many sets of technologies. One example is
IKE with IPSec.

FreeS/WAN = an IKE and IPSec implementation for Linux.

racoon = an IKE implementation for Linux, ported from BSD.

Linux 2.6 = has built-in IPSec support

Linux 2.4 = there's an IPSec backport from Linux 2.6 to Linux 2.4 by
Dave Miller.

If you want to stick to Linux 2.4, FreeS/WAN is a better bet. If you can
move to Linux 2.6, racoon is better.

HTH,

-- 

Ranjeet Shetye
Senior Software Engineer
Zultys Technologies
Ranjeet dot Shetye2 at Zultys dot com
http://www.zultys.com/
 
The views, opinions, and judgements expressed in this message are solely
those of the author. The message contents have not been reviewed or
approved by Zultys.



