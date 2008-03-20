From: rigoberto perez <rigo666beast@yahoo.com>
Subject: Problem modifying TCP packets
Date: Thu, 20 Mar 2008 12:57:42 -0700 (PDT)
Message-ID: <468091.64027.qm@web33202.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter <netfilter@vger.kernel.org>

I modify packets using skb_padto and adding a trailer
to every datagram, i change the protocol too. It=B4s
work OK, but when i receive the datagrams I have
problems in the inverse process.=20

I mean, when I capture datagrams with my own protocol
I restore the original packet using skb_trim and put
the original protocol (previoulsy saved in my
trailer). This works for icmp packets but when I do it
in tcp packets I only receive a fews bytes and don=B4t
have any reports of errors (maybe there is but i can=B4t
see them).

Let me show you my code and comments in order to
explain better my trouble:

{
struct sk_buff *skb2 =3D *skb; //To work simplest
tTrailer *h; //Pointer to my own data

if (skb_is_nonlinear(skb2))=20
{
    if (skb_linearize(skb2, GFP_ATOMIC) !=3D 0)=20
    {
	printk(KERN_ERR"Error linearizing\n");
	return -ENOMEM;
    }
}
//First point to my own data
h=3D(tTrailer *)&skb2->data[skb2->len-sizeof(tTrailer)];

//Restore the saved protocol
skb2->nh.iph->protocol =3D h->proto;=20
//Delete my trailer
skb_trim(skb2, skb2->len-sizeof(tTrailer));=20
//Restore the original size
skb2->nh.iph->tot_len =3D htons(skb2->len);=20
//Recompute the cksum (is that necesary?)
skb2->ip_summed =3D CHECKSUM_UNNECESSARY;=20
skb2->nh.iph->check =3D 0;
skb2->nh.iph->check =3D ip_fast_csum((unsigned char
*)skb2->nh.iph, skb2->nh.iph->ihl);
*skb =3D skb2;=20
return NF_ACCEPT;=20
}

This code is in a NF_IP_LOCAL_IN hook with priority
NF_IP_PRI_CONNTRACK_DEFRAG. I use SUSE 10.x with
kernel 2.6.16.x and the module ip_conntrack is loaded.
I saw in old reference that in older kernels the
nfcache skbuff parameter must be NFC_ALTERED but in
this kernels this parameter not exists.

Why tcp descard my packets?

Thanks


      _________________________________________________________________=
___________________
Never miss a thing.  Make Yahoo your home page.=20
http://www.yahoo.com/r/hs
