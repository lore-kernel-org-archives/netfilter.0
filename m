From: "Real Oneone" <realoneone@gmail.com>
Subject: kernel crashed after sending a packet with my own wrapping iphdr
Date: Mon, 10 Apr 2006 19:23:33 +0800
Message-ID: <84d7d9cf0604100423g54a98026u30dc76dfa2d7b338@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hi!

I'm using Fedoro Core 4 with the default kernel version of 2.6.11-1.

I simply want to wrap certain ip packets with a new iphdr, and then
send it out. So, I decided to plug a hook function at
NF_IP_POST_ROUTING with the priority of NF_IP_PRI_FILTER-1. What I did
in the hook function is :
1. check if it is a ip packet
1. 'copy_and_expand' the skbuff
2. 'skb_set_owner_w' for the new skbuff
3. move the older iphdr and data to the new skbuff, of couse I moved
two copy of the iphdr
4. 'kfree' the older skbuff and set the pointer once pointing to it to
the new skbuff
5. set the members of new iphdr and do 'ip_send_check' for it
6. 'ip_select_ident' for the new skbuff
7. return NF_ACCEPT

Then I'm confused what's wrong?

I've been trapped by these error for over a week and I'll be really
thankful if you could point out some possible reseasons for my stupid
error.

Here is the main code: (The kernel crashed on the time of a ping
command, I can't get those error msg logged even when I killed klogd
and 'cat /proc/kmsg > logfile', so what I can show you of the error
msg is the function stack printed on the screen telling ' delay_pmtmr
... __delay... panic... die... do_page_fault... recalc_task_prio...
__delay... qdisc_restart... do_page_fault... error_code...
force_sog_specific ... ')

/* hook option */
static struct nf_hook_ops kernel_ops[] =3D {
    {
        .hook =3D kernel_hook_out,
#ifdef KERNEL26
        .owner =3D THIS_MODULE,
#endif
        .pf =3D PF_INET,
        .hooknum =3D NF_IP_POST_ROUTING,
        .priority =3D NF_IP_PRI_FILTER-1,
    },
};

static unsigned int
kernel_hook_out(unsigned int hooknum,
=09   struct sk_buff **skb,
=09   const struct net_device *in,
=09   const struct net_device *out, int (*okfn) (struct sk_buff *))
{
=09struct iphdr *iph =3D (*skb)->nh.iph;
=09if (iph =3D=3D NULL) {
=09=09return NF_ACCEPT;
=09}

        ip_pkt_encapsulate(*skb);
=09return NF_ACCEPT;
}

int ip_pkt_encapsulate(struct sk_buff *skb)
{
=09struct iphdr *iph;        /* old iph and new outer iph */
=09struct iphdr *iiph;       /* new inner iph */
=09struct sk_buff *nskb;  /* new socket buffer */
=09
=09iph =3D skb->nh.iph;

=09nskb =3D skb_copy_expand(skb, skb_headroom(skb),
=09=09=09       skb_tailroom(skb) +
=09=09=09       (iph->ihl << 2), GFP_ATOMIC);

=09if (nskb =3D=3D NULL) {
=09=09kfree_skb(skb);
=09=09return -1;
=09}

=09/* Set old owner */
=09if (skb->sk !=3D NULL)
=09=09skb_set_owner_w(nskb, skb->sk);
=09
=09skb_put(nskb, iph->ihl << 2);

=09/* Move the IP header, and make a copy at the front of the data part */
=09memcpy(nskb->data, skb->data, (iph->ihl << 2));
=09memcpy(nskb->data + (iph->ihl << 2), skb->data, (iph->ihl << 2));
=09/* Move the data */
=09memcpy(nskb->data + 2 * (iph->ihl << 2),
=09       skb->data + (iph->ihl << 2), skb->len - (iph->ihl << 2));

=09kfree_skb(skb);
=09skb =3D nskb;

=09/* Update pointers */
=09iph =3D skb->nh.iph =3D (struct iphdr *)(skb->data);
=09iiph =3D (struct iphdr *)(skb->data + (iph->ihl << 2));
=09ip_send_check(iiph);
=09
=09iph->tot_len =3D
=09    htons(ntohs(iph->tot_len) + ((iph->ihl) << 2) );
=09iph->protocol =3D 17;
=09ip_send_check(iph);

=09if (skb->nh.iph->id =3D=3D 0) {
=09=09ip_select_ident(skb->nh.iph, skb->dst, NULL);
=09=09printk(KERN_EMERG "skb->nh.iph->id =3D=3D 0\n");
=09}
=09return 0;
}

Thanks again for read over these code!

Gu, Xinxing

