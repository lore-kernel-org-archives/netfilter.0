From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: RE: Win2K + and NAT
Date: Mon, 19 Sep 2005 17:02:12 -0400
Message-ID: <1127163732.25000.36.camel@localhost>
References: <186AC876521E0F46BDE77079A6567FD004B562C5@la-ncc-ms1nsabb.losangeles.afspc.ds.af.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <186AC876521E0F46BDE77079A6567FD004B562C5@la-ncc-ms1nsabb.losangeles.afspc.ds.af.mil>
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
To: Netfilter users list <netfilter@lists.netfilter.org>, Hudson Delbert J Ctr 61 CS/SCBN <Delbert.Hudson.ctr@LOSANGELES.AF.MIL>

When it's not an Internet gateway :-)

We have two live examples.  In one case, we are creating a RAS gateway
for mobile IPSec clients.  We need to relay the traffic from the RAS
gateway to the branch offices.  Since the source address for the tunnel
on the RAS end of the RAS gateway to office gateway tunnel can be
anything, we would have to define the security policy as between the
protected network behind the office gateway and 0.0.0.0/0.  That will
surely confuse the office gateway who will now think all traffic must be
sent to the RAS gateway.  We can solve this problem by NATting all
clients to a fixed address range and creating a tunnel between that
address and the protected networks behind the branch office gateway.  We
do not want to do this via L2TP because we wish to perform access
control decisions on the traffic while it is still traversing netfilter.

The other example is in a multi-client environment where there are
unresolvable IP address conflicts and the entire client network must be
NATted to the client support center.

Yes, I know NAT is evil ;-) but it is also sometimes eminently practical
- John

On Mon, 2005-09-19 at 12:36 -0700, Hudson Delbert J Ctr 61 CS/SCBN
wrote:
> John,
> 
> not sure I can think of valid reason to allow netbios traverse an
> internet gateway in the first place.
> 
> Please explain scenario.
> 
> Piranha.
> 
> 
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of John A.
> Sullivan III
> Sent: Monday, September 19, 2005 11:59
> To: Netfilter users list
> Subject: Win2K + and NAT
> 
> Does anyone have a work around for Outlook and Windows File & Print
> services through a NAT gateway in a Win2K and XP environment with Active
> Directory? We have a situation where we do have to pass this kind of
> traffic through such a gateway and it breaks.
> 
> We see the client send SAM LOGON requests on netbios datagram service
> 138/udp.  I would guess the client is registering but I'm not sure.  The
> problem is that the netbios header contains the source IP address.  Once
> we NAT, this does not match the IP header IP address.  We see the
> packets arriving at the AD controller with the NAT address but we see
> the replies being sent to the original address (the one in the NetBIOS
> header).
> 
> It appears there is no nat helper for netbios dgm although there is the
> start of one at http://suif.stanford.edu/~csapuntz/ip_nat_netbios.c - in
> fact, if no one has a work around, we might be interested in sponsoring
> someone to finish and submit this patch.  Please let me know if you are
> interested.
> 
> Has anyone gotten such a set up to work? Perhaps there is a way to
> manipulate the behavior of Outlook and Windows to get the information
> via a different protocol? Thanks - John
<snip>
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

If you would like to participate in the development of an open source
enterprise class network security management system, please visit
http://iscs.sourceforge.net


