From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: server in DMZ
Date: Wed, 01 Sep 2004 23:05:35 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094094335.2029.158.camel@localhost>
References: <20040902025038.GA10835@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040902025038.GA10835@tranquility.scriptkitchen.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Payal Rathod <payal-netfilter@scriptkitchen.com>
Cc: Netfilter ML <netfilter@lists.netfilter.org>

On Wed, 2004-09-01 at 22:50, Payal Rathod wrote:
> Hi,
> I have a small webserver in DMZ at 10.10.10.3 where we load our designs.
> I want to allow access to its port 80 only from local LAN (via. a squid 
> proxy on the gateway machine) and my client's office at 1.2.3.4. 
> Right now I can see it from all over the world, but I do want to restrict 
> the access. Remember that as now I want to continue accessing the DMZ machine 
> using its public IP and not just 10.10.10.3 IP even from inside the LAN.
> What do I do in such case?
> Thanks a lot for the help in advance.
> With warm regards,
> -Payal
> p.s. is DMZ pronounced as DMZ or DMZee?
I assume you have at least three interfaces in the firewall -- the
public IF, the DMZee IF (to answer your last question) and the internal
IF.  As long as your internal clients resolve the web server name to the
public address, all should work fine.

You will need to DNAT the web server on both the public and internal
interfaces and have a FORWARD chain rule that allows access from the
internal network and 1.2.3.4.  Oops! That's right -- you are using Squid
and not just DNAT.  I'm a bit rusty on Squid configuration but I would
imagine you can use the same principle to make it work.  Treat the
inside network like an outside network for the web server.

However, I would give two cautions.  You may want to create a VPN to the
client office if the designs are important.  The transmission without
the VPN will be in the clear.

If the designs are important, I would not put this device on the same
DMZ as public devices.  If someone cracks one of the public devices,
they may have free reign of any device on the DMZ from that compromised
device.  That means they can get your designs.  Anything that is private
and confidential should not be on the same network as something publicly
exposed.  Of course, this may be the only device on your DMZ in which
case you are fine.  Hope this helps - John
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


