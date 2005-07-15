From: Trevor Cordes <trevor@tecnopolis.ca>
Subject: Re: Using SNAT through a 26sec tunnel
Date: Fri, 15 Jul 2005 14:18:03 -0500
Message-ID: <20050715191803.GC22834@pog.tecnopolis.ca>
References: <00cb01c52eaf$b0981ac0$5001010a@bluereef.local>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <00cb01c52eaf$b0981ac0$5001010a@bluereef.local>
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
To: Andrew Hall <temp02@bluereef.com.au>, netfilter@lists.netfilter.org

On Tue, Mar 22, 2005 at 06:20:56PM +1100, Andrew Hall wrote:
> Hello,
> 
> I need some clarification on native 26sec packet processing in relation to 
> NAT with Netfilter, and I'm hoping someone can enlighten me once and for 
> all.

AFAIK SNAT (and DNAT) with 26sec is broken without patches and patches 
might not be readily available above 2.6.10.

See my RH bugzilla and make some noise:

https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=143374

