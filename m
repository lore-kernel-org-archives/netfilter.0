From: John covici <covici@ccs.covici.com>
Subject: RE: vpn support for 2.4.18 and up
Date: Fri, 21 Jun 2002 05:04:27 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <15634.60443.970928.370813@ccs.covici.com>
References: <D90F507CEA84634EA750920250FF5442084BDD@aklnsp01.nsp.co.nz>
Reply-To: covici@ccs.covici.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <D90F507CEA84634EA750920250FF5442084BDD@aklnsp01.nsp.co.nz>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Michael Johansen <michael@techmo.co.nz>
Cc: netfilter@lists.samba.org

If I go to ftp.rubyriver.com and get his patch for 2.4.17 (rev2)
there is no mention of kernel version in the patch -- could you tell
me to what your remarks refer?

Do I need anything besides this patch to use pptp?

Thanks.

on Friday 06/21/2002 Michael Johansen(michael@techmo.co.nz) wrote
 > The openssl-2.4.16 kernel patch works fine for the late 2.4.x kernels with a very minor code change. 
 > It works with 2.4.16, 2.4.17, 2.4.18 - even those kernels with various other patches applied
 > The trick is in this line:
 >  
 > +#if LINUX_VERSION_CODE >= VERSION(2,1,4)
 >  
 > which is here: linux-2.4.16-openssl-0.9.6b-mppe.patch: unmodified: line 992 of 3152 [31%]
 > 
 > change that line to read:
 > 
 > 
 > +#if LINUX_VERSION_CODE >= VERSION(2,18,4)
 >  
 > save the patch, then patch your kernel with cd /usr/src/linux && patch -p1 < ../linux-2.4.16-openssl-0.9.6b-mppe.patch
 >  
 > then set up your ppp modules, compile and install the kernel and it should all work
 >  
 > of course, you will need the ppp-2.4.1 source and the patches for m$ 128bit encryption  
 >  
 >  
 > Get the patch here:
 > http://www.planetmirror.com/pub/mppe/linux-2.4.16-openssl-0.9.6b-mppe.patch.gz
 > 
 > -----Original Message-----
 > From: Rowan Reid [mailto:rreid@studio3arc.com]
 > Sent: Friday, 21 June 2002 11:48 a.m.
 > To: netfilter@lists.samba.org
 > Subject: vpn support for 2.4.18 and up 
 > 
 > 
 >  
 >  
 > I am trying to set up a firewall supporting VPn traffic. Initially my thoughts were to get the most up to date kernel 2.4.8 patch it and
 > set up my firewall. Then i realized in order to support vpn the vpn patch only goes up to 2.4.17 (would be nice to find 2.4.18) now I
 > have to find a 2.4.17 kernel, applie the appropriate iptables patch then the appropriate pptp filtering patch.
 >  
 > my questions are
 >  
 > 1.) Does anyone know of a pptp filtering patch for 2.4.18 kernels or there after.
 > 2.) know what is the latest/stable iptables patch that is compatable with 2.4.17 or 2.4.18 kernel
 > 3.) Is there an easier way to build a Firewall that supports pptp
 >  
 > I'm running SuSE8.0 can someone suggest a better distru that will be a good firewall and works well with iptables and supports vpn
 >  
 >  
 >  
 >  
 >  
 >    <ftp://ftp.rubyriver.com/pub/jhardin/masquerade/ip_masq_vpn.html> ftp://ftp.rubyriver.com/pub/jhardin/masquerade/ip_masq_vpn.html 
 >  
 >  
 > Rowan Reid
 > Job Captain, 
 > Systems Administrator
 > STUDIO 3 ARCHITECTS
 > 909  982  1717
 >  
 > 

-- 
         John Covici
         covici@ccs.covici.com

