From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: network range
Date: Mon, 05 Apr 2004 07:07:20 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1081163239.29905.13.camel@localhost>
References: <web-275929490@mail01.infosat.net>
	 <1081029737.24410.2.camel@localhost>  <20040404104046.GA2821@samad.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040404104046.GA2821@samad.com.au>
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
To: Alexander Samad <alex@samad.com.au>
Cc: netfilter@lists.netfilter.org

rp_filter presents some issues when used with Free/Open/StrongSWAN, the
IPSec products.  This also gives a more finely grained control of the
process, e.g., the possibility of selectively anti-spoofing.  Finally,
because I have not used it (because of the VPN conflict), I'm not sure
if rp_filter applies to only INPUT traffic or also FORWARD traffic.  I'm
think the latter but I do not know authoritatively.

Thanks for the comment - John

On Sun, 2004-04-04 at 06:40, Alexander Samad wrote:
> On Sat, Apr 03, 2004 at 05:03:04PM -0500, John A. Sullivan III wrote:
> > On Sat, 2004-04-03 at 15:53, IT Clown wrote:
>  --- snip ---
> > I usually implement anti-spoofing in two steps.  For both public and
> > private interfaces I set up a rule to drop any packets from the address
> > bound to the interface if it appears on a different interface.  Thus:
> > iptables -t mangle -A PREROUTING -s 10.0.0.0/24 -i ! eth1 -j DROP
> > iptables -t mangle -A PREROUTING -s 1.1.1.0/24 -i ! eth0 -j DROP
> 
> Isn't that what rp_filter does ?
> 
> > This is to prevent someone from using my own addresses against me.
> > 
>  --- snip ---
> > 
> > Someone else may have a better way but that's how I do it. I use the
> > mangle table rather than filter so that I can drop bad packets ASAP. 
> > Good luck - John
> > -- 
> > John A. Sullivan III
> > Chief Technology Officer
> > Nexus Management
> > +1 207-985-7880
> > john.sullivan@nexusmgmt.com
> > ---
> > If you are interested in helping to develop a GPL enterprise class
> > VPN/Firewall/Security device management console, please visit
> > http://iscs.sourceforge.net
> > 
> > 
> > 
> > 
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com


