From: Marc Haber <mh+netfilter@zugschlus.de>
Subject: Re: IPsec Passthru
Date: Fri, 27 May 2005 14:51:35 +0200
Message-ID: <20050527125135.GA30156@torres.l21.ma.zugschlus.de>
References: <AGEKLHGIOHJGPMIOILOHAEJIHOAA.allen.miller@lymanrichey.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <AGEKLHGIOHJGPMIOILOHAEJIHOAA.allen.miller@lymanrichey.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, May 27, 2005 at 07:29:57AM -0500, Allen Miller wrote:
> I have configured Red Hat 9 computers as routers using iptables for
> firewalling and NAT.  How do I configure iptables for ipsec passthru?  See
> drawing below:
> 
> IPsec Client------Linux Router w/ NAT-------Internet-------Linux Router w/
> NAT--------IPsec Server
> 
> Any help would be greatly appreciated.

What you need exactly depends on which IPSEC product you use. Most
IPSEC NAT Traversal schemes depend on encapsulating the AH/ESP traffic
into UDP, so you need to open certain UDP ports. You need to NAT
traffic towards your VPN gateway's Port UDP/500 in any case to allow
ISAKMP, and probably you need to open up some more UDP ports.
Netscreen Products tunnel the ESP/AH traffic through UDP/500, so you
should be fine, and Symantec uses UDP/768 for the payload. Other
products might do things differently.

In any case, I'd strongly suggest making acquaintance with debugging
tools like tcpdump to allow finding the solutions to your questions
yourself. Using tcpdump the right way will result in a huge knowledge
gain in virtuall no time since you can actually see what's going on.

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Mannheim, Germany  |  lose things."    Winona Ryder | Fon: *49 621 72739834
Nordisch by Nature |  How to make an American Quilt | Fax: *49 621 72739835

