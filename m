From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: forwarding on the same NIC
Date: Tue, 11 May 2004 13:04:37 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1084295076.15641.54.camel@localhost>
References: <3401.200.44.170.105.1084217773.squirrel@200.44.170.105>
	 <200405102115.14089.Antony@Soft-Solutions.co.uk>
	 <1292.192.168.74.154.1084226963.squirrel@192.168.74.154>
	 <1084227992.14224.5.camel@localhost>
	 <1166.200.44.170.105.1084283379.squirrel@200.44.170.105>
	 <1084288178.15768.10.camel@localhost>
	 <2022.200.44.170.105.1084289894.squirrel@200.44.170.105>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2022.200.44.170.105.1084289894.squirrel@200.44.170.105>
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

On Tue, 2004-05-11 at 11:38, alucard@kanux.com wrote:

> <snip>
> That's correct, exactly what I though. There's no forwarding because we
> are using the same subnet
> 
> > In other words, you are bridging rather than routing and thus need to
> > make a layer two decision rather than a layer three decision.  I
> > understand there is bridging functionality available in Linux but I have
> > never used it and do not know where to find it.
> 
> Anyone could help? the thing is that, this second webserver is using and
> aplication that we use internally and, what I'm trying to do here is,
> access the web configuration service from the outside using our existing
> server, which is the only one nat'ed', so our other offices can access it.
> Since the second server is a production server, there's no way we can
> change it's IP and use a subnet.
OK - so let me summarize again just to make sure I understand you.  The
2nd Webserver at 10.73.219.77 is used by internal resources and cannot
change its IP address.  You want to make it available to remote users in
other offices via the Internet but the only Internet access you have is
through the one Linux box.

If you do not want to expose the 2nd Webserver to the world but only
make it available to other offices, you may wish to consider an IPSec
VPN between the other offices and the Linux box although we'd need to
know a little more about how your ISP is getting you to the Internet and
how your other offices access the Internet.

You will still have the routing problem.  You can create a second
network without changing the IP address.  It will depend on how the
internal users access the 2nd Webserver.  If the access is also through
the Linux box, then you can split the 10.73.219.x network.  Assuming it
is using a 24 bit mask, you could create the network 10.73.219.0/25 and
10.73.219.128/25.  Leave the NIC with 10.73.219.156 on the latter
network, add a second NIC with an address on the former network and
place the second Webserver on the former network - note there is no need
to change the IP address of the 2nd Webserver or the DNS entry - just
the subnet mask.
> 
<snip>
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


