From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: forwarding on the same NIC
Date: Tue, 11 May 2004 16:09:41 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1084306180.15631.68.camel@localhost>
References: <3401.200.44.170.105.1084217773.squirrel@200.44.170.105>
	 <200405102115.14089.Antony@Soft-Solutions.co.uk>
	 <1292.192.168.74.154.1084226963.squirrel@192.168.74.154>
	 <1084227992.14224.5.camel@localhost>
	 <1166.200.44.170.105.1084283379.squirrel@200.44.170.105>
	 <1084288178.15768.10.camel@localhost>
	 <2022.200.44.170.105.1084289894.squirrel@200.44.170.105>
	 <1084295076.15641.54.camel@localhost>
	 <3506.200.44.170.105.1084304149.squirrel@200.44.170.105>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3506.200.44.170.105.1084304149.squirrel@200.44.170.105>
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
To: alucard@kanux.com
Cc: netfilter@lists.netfilter.org

On Tue, 2004-05-11 at 15:35, alucard@kanux.com wrote:
> John A. Sullivan III wrote:
> 
> > OK - so let me summarize again just to make sure I understand you.  The
> > 2nd Webserver at 10.73.219.77 is used by internal resources and cannot
> > change its IP address.  You want to make it available to remote users in
> > other offices via the Internet but the only Internet access you have is
> > through the one Linux box.
> 
> Yep, exactly
> >
> > If you do not want to expose the 2nd Webserver to the world but only
> > make it available to other offices, you may wish to consider an IPSec
> > VPN between the other offices and the Linux box although we'd need to
> > know a little more about how your ISP is getting you to the Internet and
> > how your other offices access the Internet.
> 
> This company has a cisco router -to which I have no access to it- and that
> redirects the public IP address that we use for webmail services. This 2nd
> webserver should be seen by a lot of people and using a VPN would make
> things worse
> 
> 
> >
> > You will still have the routing problem.  You can create a second
> > network without changing the IP address.  It will depend on how the
> > internal users access the 2nd Webserver.  If the access is also through
> > the Linux box, then you can split the 10.73.219.x network.  Assuming it
> > is using a 24 bit mask, you could create the network 10.73.219.0/25 and
> > 10.73.219.128/25.  Leave the NIC with 10.73.219.156 on the latter
> > network, add a second NIC with an address on the former network and
> > place the second Webserver on the former network - note there is no need
> > to change the IP address of the 2nd Webserver or the DNS entry - just
> > the subnet mask.
> 
> We have a 255.255.252.0 network already because there are more than 500
> computers with IP addresses in this company. All the users access the 2nd
> webserver directly to it thru it's IP address. Changing the subnet mask
> wouldn't quit the access? I dont understand what you are trying to explain
> here.
> 
> John, thanx a lot for this pal...
> Juan
Ah, OK - between this reply and your replay to Aleksander, it's starting
to become a bit more clear.  The router is a corporate router to the
outside world over which you have no control.  This internal 10 network
where the Linux box and 2nd Webserver sit IS the entire internal network
with a 22 bit mask and housing all users who directly access the 2nd
WebServer on the LAN.  You want the WebServer accessible to the world
but, because of politics, bureaucracy, etc., you only have control over
the Linux box.  Do I understand it thus far?

Do you have the freedom to insert a second NIC into the 2nd WebServer?
If so, you can insert a second NIC into both devices, set the default
gateway for the 2nd WebServer to the Linux Box and allow world access
through this second network.

If you can't make the hardware change, do you have the freedom to bind a
second address to the NIC on the 2nd WebServer and make a virtual
network, i.e., two networks with different addresses on the same
physical media.  This would still allow you to route and protect the 2nd
WebServer.

One way or another, you are going to have to touch the 2nd WebServer
even if just to change its default gateway to the LinuxBox so that its
reply packets to the world pass through the Linux Box.  If you cannot
get it on a separate network by hook or by crook, you'll have to
investigate bridging.  I think there is something at
http://ebtables.sourceforge.net/ but I have never played with it.  Good
luck - John
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


