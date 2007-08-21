From: Ruben Laban <r.laban@ism.nl>
Subject: Re: Port forwarding inside local domain
Date: Tue, 21 Aug 2007 08:57:35 +0200
Message-ID: <200708210857.35915.r.laban@ism.nl>
References: <20070820141102.GA19046@bart.bertram-scharpf.homelinux.com>
	<200708201634.31185.r.laban@ism.nl>
	<20070820191001.GA23822@bart.bertram-scharpf.homelinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070820191001.GA23822@bart.bertram-scharpf.homelinux.com>
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
To: netfilter@lists.netfilter.org

On Monday 20 August 2007, Bertram Scharpf wrote:
> Am Montag, 20. Aug 2007, 16:34:31 +0200 schrieb Ruben Laban:
> > You need to 'fix' the reply traffic, by using a rule like:
> >   # iptables -t nat -A POSTROUTING -i eth0 -d 192.168.7.49 -p tcp --dport
> > 80 \ -j SNAT --to 192.168.7.33
>
> iptables v1.3.5: Can't use -i with POSTROUTING
>
> > With recent kernels this can be done more elegantly by using the
> > conntrack module:
> >   # iptables -t nat -A POSTROUTING -d 192.168.7.49 -m conntrack
> > --ctorigdst \ 192.168.7.49 -j SNAT --to 192.168.7.33
>
> Seems it's "... --ctorigdst 192.168.7.33 -j ...".

Two 'stupid' mistakes indeed. Guess I should've reviewed my own posts a little 
more.

> Works fine. Thanks!

Glad it worked out for you afterall.

Regards,
-- 
Ruben

