From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: vpn under linux
Date: Mon, 12 Apr 2004 12:01:00 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1081785660.16834.13.camel@localhost>
References: <20040412122513.2441.qmail@web13908.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040412122513.2441.qmail@web13908.mail.yahoo.com>
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
To: Scott MacKay <scottmackay@yahoo.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

I'm afraid I don't have time to answer in depth today but here are a few
quick answers regarding *swan:

On Mon, 2004-04-12 at 08:25, Scott MacKay wrote:
> I had a couple questions about the different methods
> talked about here, probably focusing on CIPE,
> FreeSWAN/OpenSWAN, and the OpenVPN (along with any
> others users may chime in with)
> 1.  Where in the netfilter path do these solutions
> package up data?  Important to know if we see
> tunnel/VPN packets or the contents which are going
> into them, both incoming and outgoing
*swan makes this convenient by passing the traffic from the physical
interface to an ipsec interface, e.g., eth0 -> ipsec0.  I believe there
are extensive diagrams of how this works in the training section at
http://iscs.sourceforge.net
> 2.  Which of these guys support broadcast or
> multicast?
> 3.  Do any of these support non-encrypted
> transmission?  The reason for this would be if a
> higher level/later service provided the encryption
> over the risky sections of a transmission
> 4.  What kind of overhead do these cost?  I was
> curious from the perspective of initialization/updates
> and also any additional packet headers (rough guess). 
There are some performance benchmarks buries somewhere in the extensive
*swan documentation.
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


