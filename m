From: al clethero <aclethero@ihug.co.nz>
Subject: Re: Redirect ports on localhost
Date: 25 Mar 2004 08:31:14 +1200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1080160274.5203.13.camel@bluespi.orb.co.nz>
References: <406099AD.2070403@verio.net>
	 <20040324031427.GO3387@samad.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040324031427.GO3387@samad.com.au>
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

Recently I was trying to redirect traffic on the  localhost though for
different reasons. I finally came to the conclusion that localhost
packets aren't prerouted. Can anyone confirm this?

al

On Wed, 2004-03-24 at 15:14, Alexander Samad wrote:
> On Tue, Mar 23, 2004 at 01:10:21PM -0700, Ben Yerushalmi wrote:
> > Hi,
> > 
> > I'm trying to redirect traffic on my DNS server. I have bind listening 
> > on port 5300 (UDP) instead of 53. I've got it working from the internal 
> > network but seem to have problem on redirecting localhost traffic. I've 
> > tried changing both PREROUTING and OUTPUT chains in the nat table but it 
> > doesn't seem to help.
> > 
> > iptables -A PREROUTING -t nat -p udp -i lo --dport domain -j REDIRECT 
> > --to-ports 5300
> > 
> > and
> > 
> > iptables -A OUTPUT -t nat -p udp -d localhost  --dport domain -j 
> > REDIRECT --to-ports 5300
> might be of target but will the destination be localhost or the real ip
> address ?
> 
> A
> 
> > 
> > 
> > Anyone have luck doing this? What am I missing?
> > 
> > Thanks,
> > Ben
> > 
> > 
> > 
> > 


