From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Apps that try to do net-to-nat
Date: Fri, 30 Jan 2004 15:40:58 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1075495257.20475.2.camel@jasiiitosh.nexusmgmt.com>
References: <Sea2-F35RQt5fZPNZYM00007124@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Sea2-F35RQt5fZPNZYM00007124@hotmail.com>
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
To: jago25_98@catholic.org
Cc: netfilter@lists.netfilter.org

On Fri, 2004-01-30 at 15:11, Jago Pearce wrote:
> I'm behind NAT at work and I need to connect to home, which is also behind 
> NAT.
> 
> What programs have tried to get past the NAT problem? I heard that mnet, the 
> p2p program uses a ticketing system to pass messages. Any other programs 
> that have attempted to do nat-to-nat and done so successfully? In particular 
> - VoIP?
<snip>
I'm used to the VPN world so for me the obvious choice is to set up a
VPN tunnel between home and office.  Hopefully it's not a major concern
but an added benefit is that your VoIP is encrypted and not subject to
useful interception.  OpenS/WAN (http://www.openswan.org) should work
nicely if your are running Linux on your gateway.
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


