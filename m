From: Erdal Mutlu <emutlu@fonts.de>
Subject: NAT and FTP problem
Date: Fri, 22 Nov 2002 10:51:21 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0211221045470.21420-100000@bhows40003.fonts.de>
References: <1037954262.9050.5.camel@sander.dmdint.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1037954262.9050.5.camel@sander.dmdint.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello,

at the end this morning I recieved all mails.

I have one question about NAT and FTP. I am recieving
these messaages

ASSERT ip_conntrack_core.c:94 &ip_conntrack_lock readlocked
ASSERT: ip_nat_core.c:839 &ip_conntrack_lock not readlocked

when I connect to my ftp server behind the firewall.
Actually, ftp session is working fine, but the messages are annoying.

kernel  : 2.4.19
iptables: 1.2.7a

Is there any solution available?

Best regards.
Erdal Mutlu

On 22 Nov 2002, Sander Sneekes wrote:

> Rob,
>
> I have the same gap as you. This morning I got
> all mails again.
>
> sander
>
> On Fri, 2002-11-22 at 08:45, Rob Sterenborg wrote:
> > > I'm sending this to you and the list. There was traffic. Maybe you set
> > > your subscription to "no mail" or have some mailfilter active on your
> > > computer or mail account?
> >
> > Nope, I have a mail gap between 15-nov and 21 nov.
> > And I didn't change anything.
> >
> >
> > Rob
> >
> >
>
>
>
>
>




