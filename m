From: Hudson Delbert J Contr 61 CS/SCBN <Delbert.Hudson@LOSANGELES.AF.MIL>
Subject: RE: masquerade
Date: Thu, 14 Oct 2004 13:08:19 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <29F6FAF7F2C0D41190980002A513591E0E03DAD5@FSNSAB30>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: 'Jason Opperisano' <opie@817west.com>, netfilter@lists.netfilter.org


I'd suggest that Jason is 'spot-on' as far as the java is concerned.
i learned several years ago that some developers sometimes (hopefully not
anymore)
build modules in the dark as regards how networks work.

i know of one particulary nasty application (in terms of proxy / fwalls), 
5280/3780 emulator that called an applet that would stuff the workstation ip
address
in the DATA payload of packets before it would even leave the application.

this obviously would have been hidden from the proxy as the packet would
always
get passed to the distant end where java would un-encaps that packet and use
the IP Address
loaded into the data portion of the packet and try to 'catch a ride' back to
the client
using that address in the header. the proxy would block the packet as it
would not get a match
in the connection table thus would get dropped by fwtk. the fallout of
course being retans and timeouts
and customers blaming everyong but the guys who wrote the application.

~piranha

 

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of Jason
Opperisano
Sent: Thursday, October 14, 2004 5:36 AM
To: netfilter@lists.netfilter.org
Subject: Re: masquerade


On Wed, 2004-10-13 at 12:41, Janos Makadi wrote:
> Hi,
> 
> I`m absoulte newbie to netfilter, but last year I set up my debian 
> firewall. I tought it`s configuration is correct, but yesterday I found 
> http://audiymypc.com which shows my real ip address which I wanted to 
> hide. It shows the correct address too, but it seems my real local 
> address is visible on the internet somehow.

disable java in your web browser and re-run the test--they won't be able
to find your real IP address anymore.  they're probably either using
this code directly, or a similar technique:

  http://reglos.de/myaddress/MyAddress.html

none of this has anything to do with the configuration of your firewall.

-j

-- 
Jason Opperisano <opie@817west.com>


