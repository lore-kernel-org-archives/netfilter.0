From: "Deepak Seshadri" <dseshadri@broadbandmaritime.com>
Subject: RE: How to control the bandwidth
Date: Wed, 8 Dec 2004 11:08:39 -0500
Message-ID: <200412081608.iB8G8eH6084950@jkcpub.iserver.net>
References: <MDAEMON-F200412082053.AA5333898md50000000155@palettemm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <MDAEMON-F200412082053.AA5333898md50000000155@palettemm.com>
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
To: bassam@palettemm.com, netfilter@lists.netfilter.org

Hi,

I use the CLASSIFY target in iptables to direct traffic to respective pipes.
"tc" is the tool to create pipes of different queuing techniques and control
bandwidth.

http://lartc.org/howto/

Regards,

Deepak Seshadri


> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Bassam A. Al-Khaffaf
> Sent: Wednesday, December 08, 2004 7:52 AM
> To: netfilter@lists.netfilter.org
> Subject: How to control the bandwidth
> 
> 
> Hi All,
>    I have Internet sharing Linux box (Redhat 9, Kernel 2.4.27, iptables
> 1.2.11). All the traffic from the LAN side is MASQUERDED to the WAN side
> so
> that everyone can get access the Internet.
> 
> My backbone bandwidth is 2 mbps, when some people on the LAN side try to
> use
> streaming downloads or use VoIP they will reserve the bandwidth and will
> deprive the others from accessing the Internet.
> 
> How can I use the iptables firewall rules to control the bandwidth??
> 
> Regards
> Bassam
> 
> ---
> Outgoing mail is certified Virus Free.
> Checked by AVG anti-virus system (http://www.grisoft.com).
> Version: 6.0.806 / Virus Database: 548 - Release Date: 12/5/2004
> 
> 




