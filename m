From: Karl Lattimer <karl@kms-lan.co.uk>
Subject: Re: Kernel 2.6.5 - iptables 1.2.9 problems
Date: Wed, 30 Jun 2004 15:15:19 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088604919.667.13.camel@despair.kent-music.com>
References: <1088179390.2701.14.camel@despair.kent-music.com>
	 <40DC4F0E.5040609@kanux.com>
	 <1088590006.667.7.camel@despair.kent-music.com>  <40E2ADE8.4020401@mayn.de>
	 <1088602005.667.11.camel@despair.kent-music.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1088602005.667.11.camel@despair.kent-music.com>
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
To: Karl Lattimer <karl@kms-lan.co.uk>
Cc: netfilter@lists.netfilter.org

Its ok i fixed it, if you notice from my debug script there was a : on
the prerouting rules.

Thanks for your help anyway

Karl

On Wed, 2004-06-30 at 14:26, Karl Lattimer wrote:
> my rule set was attached to my last email.
> 
> firewall.debug.sh
> 
> 
> On Wed, 2004-06-30 at 13:11, Ruprecht Helms wrote:
> > Karl Lattimer wrote:
> > 
> > >Hi IP-Tables isn't outputting any error messages at all. Heres my
> > >script. Or there abouts.
> > >
> > >The problems i am getting are the port forwards for 4662 and 4672 arn't
> > >working correctly. I'm getting port forwards adding themselves in for
> > >ports 5800,5900,3372,6502,1025,1026,42 and 366. 
> > >
> > please be so kind and post your ruleset into the list. So it`s better to 
> > say what you have to change.
> > 
> > Regards,
> > Ruprecht
> 


