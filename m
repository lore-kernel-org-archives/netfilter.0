From: Chadley Wilson <chadley@pinteq.co.za>
Subject: Re: Iptables
Date: Fri, 20 May 2005 07:38:57 +0200
Message-ID: <200505200738.57268.chadley@pinteq.co.za>
References: <200505191945.22293.chadley@pinteq.co.za>
	<200505192213.27006.chadley@pinteq.co.za>
	<20050519214301.GA9129@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050519214301.GA9129@bender.817west.com>
Content-Disposition: inline
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
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

On Thursday 19 May 2005 23:43, Jason Opperisano wrote:
> On Thu, May 19, 2005 at 10:13:26PM +0200, Chadley Wilson wrote:
> > I have learn't quite a bit from this, I shall save this mail for future
> > use. By the way, this is my first attempt at my own firewall, mostly an
> > effort to learn and understand. I always used the Redhat default or
> > Susefirewall2. But am not confident that they do the job right, also I
> > never really understood how to customise them. Hence build your own, Ha
> > hA, not s easy when you haven't got the knowledge, but I am sure I will
> > get there.
>
> might i suggest a reading of Oskar's tutorial:
>
>   http://iptables-tutorial.frozentux.net/iptables-tutorial.html
>
> -j
>
> --
> "Peter: Oh, and sorry about that comment earlier. I have that disease
>  that makes you swear involuntarily. Sonofabitch. Sonofabitch.
>  Sonofabitch. See?"
>         --Family Guy

Would it be safe to set the OUTPUT default policy to ACCEPT?
Every time I set it to DROP I get locked out, I suppose it has to do with the 
fact that I have no rules for the OUTPUT chain.


-- 
Chadley Wilson
Redhat Certified Technician 
Cert Number: 603004708291270
Pinnacle Micro
Manufacturers of Proline Computers
====================================
Exercise freedom, Use LINUX
=====================================


