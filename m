From: Patrick McHardy <kaber@trash.net>
Subject: Re: Linux 2.6.17-rc1: /sbin/iptables does not find kernel netfilter
Date: Sun, 09 Apr 2006 18:37:47 +0200
Message-ID: <4439385B.6010908@trash.net>
References: <Pine.LNX.4.64.0604022037380.3781@g5.osdl.org>	<20060408200915.GN1686@vianova.fi>
	<44388908.6070602@trash.net>	<20060409074313.GZ15954@vianova.fi>
	<20060409144416.GO1686@vianova.fi>	<20060409144534.GN29797@vianova.fi>
	<87psjqg2nt.fsf@hades.wkstn.nix>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <87psjqg2nt.fsf@hades.wkstn.nix>
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
To: Nix <nix@esperi.org.uk>
Cc: netfilter@lists.netfilter.org, linux-kernel@vger.kernel.org, vherva@vianova.fi, davem@davemloft.net

Nix wrote:
> On 9 Apr 2006, Ville Herva yowled:
> 
>>On Sun, Apr 09, 2006 at 05:44:16PM +0300, you [Ville Herva] wrote:
>>
>>>I just realized 
>>># CONFIG_NETFILTER_XT_MATCH_STATE is not set
>>>should probably be set. I'm building a new kernel now...
>>
>>Ok, that seems to do it.
>>
>>Thanks for the help, and sorry for the noise. I hope not too many people hit
>>the same glitch while upgrading...
> 
> 
> I cetainly did. A simple `make oldconfig' ends up zapping pretty much
> all the old iptables CONFIG_ options, so you end up with not much of
> iptables or netfilter left.

But it does show you all the new options. Admittedly, it would
have been better to automatically select the new options when
needed, but probably not worth changing it now, it has been
like this for two releases I think.

> I must admit not quite understanding why the xtables stuff is needed:
> I thought that was needed for userspace connection tracking, which
> while it sounds cool isn't something I'm using yet.

Its a unification of the matches and targets that are address family
independant.

