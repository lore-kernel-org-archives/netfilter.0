From: Ulysses Almeida <ulysses.almeida@gmail.com>
Subject: Re: Two links and a SMTP sever.
Date: Tue, 18 Jan 2005 17:52:21 -0300
Message-ID: <d645356050118125243d12dfb@mail.gmail.com>
References: <d645356050118053928226673@mail.gmail.com>
	<26550.142.169.215.10.1106081679.squirrel@142.169.215.10>
Reply-To: Ulysses Almeida <ulysses.almeida@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <26550.142.169.215.10.1106081679.squirrel@142.169.215.10>
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
To: Samuel Jean <sj-netfilter@cookinglinux.org>
Cc: netfilter@lists.netfilter.org

Thanks for the answer....


On Tue, 18 Jan 2005 15:54:39 -0500 (EST), Samuel Jean
<sj-netfilter@cookinglinux.org> wrote:
> On Tue, January 18, 2005 8:39 am, Ulysses Almeida said:
>
> (After looking attached file)
> Did you enable NAT of local connection in your kernel ?
> To be honest, I don't know anything about Lartc. And can't tell you
> how it should behave (my guess is it should pickup the right IP, of course)
> 
> However, the (ugly) SNAT work-around should work with
> NAT of local connection enabled.

  Hmm. the NAT/SNAT is working fine, when I recive the SMTP answer
(LOG on PREROUTING and INPUT of filter, nat and mangle) the packet
arrives with the correct ip on dst addr. But I can only see it, on
mangle PREROUTING, but can't on other hooks. I don't know if it is
related with some sanity check or checksum....

  That's another doubt, dos nat PREROUTING called with syn+ack
packets, or only with sym packets?

  I have these modules loaded:
ipt_LOG                 5760  7 
ipt_mark                1792  0 
ipt_MARK                2176  1 
iptable_mangle          2944  1 
ipt_state               2048  8 
iptable_filter          2944  1 
ipt_MASQUERADE          3840  4 
iptable_nat            23980  2 ipt_MASQUERADE
ip_conntrack           33072  3 ipt_state,ipt_MASQUERADE,iptable_nat
ip_tables              17920  8
ipt_LOG,ipt_mark,ipt_MARK,iptable_mangle,ipt_state,iptable_filter,ipt_MASQUERADE,iptable_nat

  
> 
> >
> >   I explaint it on the attachment (i sent this attachment, because I
> > don't thin it will cause any trouble, since it's text/plain, if does,
> > say and I won't send again).
> 
> Please put it in the body so we can comment some part.
> 
Ok, I used to use MUA that shows-me the text/plain attachments as the
e-mail body (like mutt). But now I see it won't happen all the time.
My mistake, sorry.

-- 
 - Ulysses Almeida

