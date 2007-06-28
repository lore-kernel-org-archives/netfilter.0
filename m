From: Msquared <1.list.netfilter@msquared.id.au>
Subject: Re: 'recent' matching when less than hitcount hits
Date: Thu, 28 Jun 2007 12:03:48 +0800
Message-ID: <20070628040348.GD31525@sliderule.msquared.com.au>
References: <20070627090043.GC31525@sliderule.msquared.com.au>
	<20070627094145.GB4288764@metu.edu.tr>
	<20070627090043.GC31525@sliderule.msquared.com.au>
	<468228DA.2040809@trash.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20070627094145.GB4288764@metu.edu.tr>
	<468228DA.2040809@trash.net>
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

On Wed, Jun 27, 2007 at 11:07:38AM +0200, Patrick McHardy wrote:

> > I seem to be having a problem where a rule with --hitcount is matching
> > when there are fewer hits than is listed in the hitcount parameter.
> 
> Which kernel version are you using?

2.4.22-1.2199.8.legacy.nptl


On Wed, Jun 27, 2007 at 12:41:46PM +0300, hdemir@metu.edu.tr wrote:

> > The rules are in a chain that is only hit for incoming SSH connections.
> > EG: I have this rule in the INPUT chain:
> > 
> >   -m tcp --dport 22 -j service-ssh
> 
> You are sending all the traffic to the port 22. Use -m state --state
> NEW, so that only new ssh connections can be updated. 

I already tried that, but it made no difference (perhaps because -m state
--state ESTABLISHED,RELATED -j ACCEPT higher in the INPUT chain).

Note from the iptables -vnL output that I showed that it only counted one
hit on the --set rule and a number of hits on the --update rule.

Regards, Msquared...

