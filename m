From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: physdev and snat problems
Date: Fri, 5 Dec 2003 11:51:42 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031205165142.GA1079@cannon.eng.us.uu.net>
References: <Pine.LNX.4.58.0312051020210.10989@picea.navaho>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0312051020210.10989@picea.navaho>
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
Content-Transfer-Encoding: 7bit
To: Andy Loukes <andy@navaho.co.uk>
Cc: netfilter@lists.netfilter.org

On Fri, Dec 05, 2003 at 10:20:59AM +0000, Andy Loukes wrote:

> > I'm using iptables 1.2.9 and kernel 2.6.0-test11..

> OK, no-one answered this but

The one who could answer should have had all the information you had who is
most likely to be you ;-)

Ramin

> I figured it out (isn't it always the 
> same!), so I thought I'd reply in case any finds it useful
> 
> It was nothing to do with physdev. I installed the iptables 1.2.9 and 
> appararently it needs to be compiled with the 2.6 kernel for nat to work.
> A bit odd but there you go...

