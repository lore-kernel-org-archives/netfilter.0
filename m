From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Can reach some websites, can't reach others
Date: Sat, 22 May 2004 09:32:05 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1085232725.15548.1.camel@localhost>
References: <20040522115927.GA18767@localnet>
	 <200405221328.33189.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405221328.33189.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

On Sat, 2004-05-22 at 08:28, Antony Stone wrote:
> On Saturday 22 May 2004 12:59 pm, Sven Riedel wrote:
> 
> > Hi,
> > I'm using a Linux 2.6.6 box as a masquerading firewall via dialup for a
> > local network. From the internal network I can reach some websites (e.g.
> > www.debian.org) but can't reach others (e.g. www.freshmeat.net). The
> > unreachable sites _can_ be reached from the firewall-box itself though.
> 
> This sounds like an MSS / MTU mismatch poblem.   Try doing a Google search for 
> "clamp MSS to MTU" - that should give you some pointers.
> 
> Can't offer specific advice myself since I've never experienced the problem, 
> but I've seen it here from others several times before.
> 
> Regards,
> 
> Antony.
Antony's diagnosis is the more likely problem but,  if there is an old
proxy somewhere in the path, it can produce similar results.  If the
page uses some call that the proxy does not understand, some pages may
be blocked.
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


