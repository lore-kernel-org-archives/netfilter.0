From: "Shawn Wright" <swright@sls.bc.ca>
Subject: RE: Using old CPU for 100s of clients
Date: Fri, 03 Dec 2004 17:24:06 -0800
Message-ID: <41B0A136.15041.B53ABDF4@localhost>
References: <7C9884991ADAE0479C14F10C858BCDF591E3A1@alderaan.smgtec.com>
Reply-To: swright@sls.bc.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <41B070B6.23668.B47D46A8@localhost>
Content-description: Mail message body
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
To: netfilter@lists.netfilter.org

On 3 Dec 2004 at 13:57, Shawn Wright wrote:

> On 3 Dec 2004 at 12:22, Daniel Chemko wrote:
> 
> > The Speed problems may not be isolated to your CPU. You'll want to make
> > sure your conntrack table isn't getting full, and that conntracks are
> > safely getting expired from your system. Are you using a custom kernel,
> > or a stock distro one?
> 

Just to let you know, the problem has finally been located - a misplaced 
rate limit was in effect, which had the effect of limiting new connections 
from us to the net. A misunderstanding on my part, pointing out but Tom 
on the shorewall list. 

I'm happy to report the old PPro200 is back in service (for now) happily 
running along - it's passed about 1Gb in the past 40 minutes without 
breaking a sweat, and is nice and quick. (a new server is still in the works 
though...)

Thanks!
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
Shawn Wright, I.T. Manager
Shawnigan Lake School
http://www.sls.bc.ca
swright@sls.bc.ca



