From: Gary Hodder <vk2kcf@miacomputers.com>
Subject: Re: Forward intranet ip's
Date: 21 Oct 2002 10:50:00 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1035161401.2615.24.camel@sandy.vk2kcf.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter <netfilter@lists.netfilter.org>

Hi Antony,

On Sun, 2002-10-20 at 18:30, Antony Stone wrote:
> On Sunday 20 October 2002 2:21 am, Gary Hodder wrote:
> 
> > Hi all,
> >
> > I am wanting to route 192.168.x.x ip's, the Linux kernel will not do
> > this and hasn't for a while.
> 
> I'm not sure what you mean by "the kernel will no do this".   My
kernels 
> certainly do.
> 
> Do you have /proc/sys/net/ipv4/ip_forward = 1 ?

Yes in my firewalling start script has:
 echo 1 > /proc/sys/net/ipv4/ip_forward

> 
> That controls forwarding of *all* packets by the kernel - I'm not
aware of 
> anythign to selectively control 192.168.x.y
> 
> Antony.
> 
Also tried turning off rp_filter with no luck.
The only way it will pass the 192.168.x.x packets is masquerading them.
I sent a msg to Mandrake expert but no answer yet.

Thanks
Gary.





