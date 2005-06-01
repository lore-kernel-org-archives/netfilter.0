From: Jason Opperisano <opie@817west.com>
Subject: Re: mysterious dropped echo replies
Date: Tue, 31 May 2005 22:22:33 -0400
Message-ID: <20050601022233.GA6992@bender.817west.com>
References: <1117528956.25434.65.camel@athene.bestsolution.at>
	<opsrozalyc76nf2y@xonix> <opsrozlyy176nf2y@xonix>
	<1117539228.25434.82.camel@athene.bestsolution.at>
	<opsro6aifo76nf2y@xonix>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <opsro6aifo76nf2y@xonix>
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

On Wed, Jun 01, 2005 at 06:21:44PM +0300, Sertys wrote:
> Well , this line :
> iptables -t nat -A Cid3D99741E.0   -d 192.168.100.0/24 -j RETURN
> 
> change it to -j DROP and it wont generate any replies. -j RETURN, returns  
> the packet and sends and icmp message to the src!

RETURN returns the packet to the calling chain, or enforces the
root chain's POLICY if there is no calling chain to return to.
your description matches what REJECT does, not RETURN.

-j

--
"Stewie: Damn the toilet. It's made slaves of you all. It just
 sits there consuming other people's feces while contributing nothing
 of its own to society."
        --Family Guy

