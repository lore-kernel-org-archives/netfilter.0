From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: RE: Kernel panic with RPC patch
Date: 26 Apr 2003 19:36:47 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1051375062.1438.16.camel@jasiiitosh.nexusmgmt.com>
References: <000401c30bf8$59a227a0$0200a8c0@basti79>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000401c30bf8$59a227a0$0200a8c0@basti79>
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
To: Sebastian <netfilter@basti79.de>, netfilter@lists.netfilter.org

Argh!!!! Oh well.  That's a functionality I could really use and I don't
have the skills to write it myself.  Thanks for the heads up.  You
probably saved me days of fighting with it.  Take care - John

On Sat, 2003-04-26 at 09:32, Sebastian wrote:
> Sure I was able to load/use the module without any kernel panic. But it
> diddn't work as I expected. (refer to:
> http://lists.netfilter.org/pipermail/netfilter/2003-April/043528.html) I
> used iptables 1.2.7a and patch-o-matic 20030107. Never tried it again
> since then.
> 
> Sebastian.
> 
> 
> > -----Original Message-----
> > From: netfilter-admin@lists.netfilter.org 
> > [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of 
> > John A. Sullivan III
> > Sent: Saturday, April 26, 2003 2:35 PM
> > To: Sebastian; netfilter@lists.netfilter.org
> > Subject: RE: Kernel panic with RPC patch
> > 
> > 
> > 	I suppose that makes sense.  Please let me ask a stupid 
> > question so I don't accidentally shoot myself in the foot.  
> > Does your configuration activate the module at any time or is 
> > it waiting to be called at some future time? I assume that if 
> > you do call it, that it all works fine. 
> > It would be perfectly acceptable to me to use it as a module.
> > 	Does anyone happen to know if the RPC patch supports 
> > using Microsoft RPC and the portmapper on port 135 for 
> > applications like Exchange and the Windows server 
> > administration utilities? I, obviously :-), haven't tried it. 
> > Thanks, all - John
> > 
> > On Sat, 2003-04-26 at 07:42, Sebastian wrote:
> > > Same Problem here, but I solved it by compiling the RPC patch as 
> > > module instead of compiling it directly into the kernel.
> > > 
> > > Sebastian.
> > > 
> > > 
> > > > -----Original Message-----
> > > > From: netfilter-admin@lists.netfilter.org
> > > > [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of 
> > > > John A. Sullivan III
> > > > Sent: Saturday, April 26, 2003 11:20 AM
> > > > To: netfilter@lists.netfilter.org
> > > > Subject: Kernel panic with RPC patch
> > > > 
> > > > 
> > > > I was thrilled to see the RPC patch but find that I cannot
> > > > use it.  My RedHat 7.3 system running kernel 2.4.20 hangs on 
> > > > boot with:
> > > > 
> > > > Unable to handle kernel NULL pointer dereference at virtual
> > > > address 00000010
> > > > 
> > > > I thought it might be the use of cryptoapi so I removed it.
> > > > That made no difference.  I overwrote the kernel source with 
> > > > a fresh copy and recompiled without cryptoapi.  That didn't 
> > > > make a difference either.
> > > > 
> > > > I suspected some of the other patches but the one that made
> > > > the error go away when removed and return when applied was RPC.
> > > > 
> > > > Has anyone else had this problem?
> > > > 
> > > > --
> > > > John A. Sullivan III
> > > > Chief Technology Officer
> > > > Nexus Management
> > > > +1 207-985-7880
> > > > john.sullivan@nexusmgmt.com
> > > > ---
> > > > If you are interested in helping to develop a GPL enterprise
> > > > class VPN/Firewall/Security device management console, please 
> > > > visit http://iscs.sourceforge.net
> > > > 
> > > > 
> > > > 
> > -- 
> > John A. Sullivan III
> > Chief Technology Officer
> > Nexus Management
> > +1 207-985-7880
> > john.sullivan@nexusmgmt.com
> > ---
> > If you are interested in helping to develop a GPL enterprise 
> > class VPN/Firewall/Security device management console, please 
> > visit http://iscs.sourceforge.net
> > 
> > 
> > 
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


