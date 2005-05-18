From: "Jim Miller" <jimm@simutronics.com>
Subject: RE: SSH Brute force attacks
Date: Wed, 18 May 2005 11:54:42 -0500
Message-ID: <NDBBKABJBJCIJNAELLKEIEACJFAA.jimm@simutronics.com>
References: <4289E72F.7020901@wp.pl>
Reply-To: jimm@simutronics.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4289E72F.7020901@wp.pl>
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

> Brent Clark wrote:
> > Would you be so kind as to copy and paste your ruleset for this.
> No problem, here's my variation, based on Taylor Grant's ruleset
>
> $ipt -N SSH_Brute_Force
> $ipt -A INPUT -p tcp --dport 22 -m state --state NEW -s ! $MyIP -j
> SSH_Brute_Force
> $ipt -A SSH_Brute_Force -m recent --set --name SSH
> $ipt -A SSH_Brute_Force -m recent ! --rcheck --name SSH --seconds 60
> --hitcount 3 -j RETURN
> $ipt -A SSH_Brute_Force -m recent --name SSH --update
> $ipt -A SSH_Brute_Force -j LOG --log-prefix "SSH Brute Force Attempt:  "
> $ipt -A SSH_Brute_Force -j DROP
>
> I am forced to use DROP here instead of TARPIT as the TARPIT isn't
> supported yet for the 2.6.x kernel branch
>


Is this true that Tarpit does not work with 2.6 kernels?  I was going to
give it a try on one of my no-production firewalls.



Thanks,
Jim



