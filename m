From: "noa levy" <noalevy@gmail.com>
Subject: Re: SNAT before IPSec
Date: Wed, 6 Jun 2007 00:29:51 +0300
Message-ID: <8bd3dfad0706051429r7c37e29dhcd8d2550a613bab3@mail.gmail.com>
References: <8bd3dfad0706050529s484d42b6t9ef4ae0fd1730367@mail.gmail.com>
	<web-74829660@bk1.webmaillogin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=QoLhYETjTryxfwPsY/aiGN82qLc7cDzPnB+oJRPMVe3MzMLHioZGJVEiMbQ5ZUoSVIlbhmgh/zph8mefKA5s2iCdAlndTcTvJ5+aQdzngTZBLjYlr2BSZVabOnK1tcaMS+hreSRG/UK5ykyv8+npmm/PACW87NvTMZkGxcvRsaQ=
In-Reply-To: <web-74829660@bk1.webmaillogin.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jorge Davila <davila@nicaraguaopensource.com>
Cc: netfilter@lists.netfilter.org

Thanks for all the help so far.
Jorge - I'm actually using the native 2.6 kernel ipsec (netkey) and
not KLIPS, so I don't have the "ipsecN" virtual interfaces and can't
use that.
In response to Grant's reply - I think I have a problem, since I'm
using the 2.6.10 kernel (can't upgrade anytime soon). Can anyone point
me to where I can find the relevant ipsec patches that enable the
double passage through netfilter hooks?
Thanks,
Noa

On 6/5/07, Jorge Davila <davila@nicaraguaopensource.com> wrote:
> I'm guessing that you can use the "normal" approach and apply the SNAT rules
> to the outgoing traffic flowing in the ipsec interfaces.
>
> The ipsec encryption algorithm is a kernel space tool and iptables is a user
> space tool to the netfilter kernel module.
>
> All traffic that pass the POSTROUTING chain in the NAT table is leaving the
> firewall box (through a physical interface e.g.:eth0 or through a virtual
> interface e.g.:ipsec0).
>
> Jorge Davila..
>
> On Tue, 5 Jun 2007 15:29:47 +0300
>  "noa levy" <noalevy@gmail.com> wrote:
> > Hi All,
> >
> > I have a setup where I need to SNAT traffic that will be going out via
> > an IPSec tunnel. The NAT must take place before the IPSec
> > encryption+encapsulation, so I need the packet to first go through
> > SNAT and then match an IPSec policy. After being IPSec-ified, I need
> > the packets to go through routing again.
> > My question:
> > SNAT takes place in POST_ROUTING. Can IPSec be applied after that? I
> > have read that after IPSec the packet gets injected to LOCAL_OUT
> > again, but when does the actual IPSec policy decision take place?
> > Won't it happen *before* SNAT? Can I control it?
> >
> > Thanks,
> > Noa
> >
> >
>
> Jorge Isaac Davila Lopez
> Nicaragua Open Source
> +505 430 5462
> davila@nicaraguaopensource.com
>

