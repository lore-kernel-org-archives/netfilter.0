From: Jackson Alberto <superj_2004@hotmail.com>
Subject: "Expect" from Netfilter hook
Date: Thu, 29 Jul 2010 08:52:39 -0400
Message-ID: <BAY121-W491B775F2B978D3479D1289DA90@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org


Hello!,

Is it possible to work with "expect" from a netfilter hook (not from a =
conntrack helper)?

When I run the code below, I get:

BUG: unable to handle kernel NULL pointer dereference at (null)
IP [] nf_ct_expect_related_report+0x63/0x427
*pde =3D 3df8d067
Oops: 000 [#1] SMP

------

int np_exp(struct nf_conn *ct){
=A0 =A0 struct nf_conntrack_expect *exp;
=A0 =A0 struct nf_conntrack_tuple *tuple;

=A0 =A0 exp =3D nf_ct_expect_alloc(ct);
=A0 =A0     if(exp =3D=3D NULL){
=A0 =A0 =A0 =A0 printk("Couldn't allocate exp!\n");
=A0 =A0 =A0 =A0 return -1;
=A0 =A0     }

=A0 =A0     tuple =3D &ct->tuplehash[IP_CT_DIR_REPLY].tuple;

=A0 =A0     nf_ct_expect_init(exp, NF_CT_EXPECT_CLASS_DEFAULT, nf_ct_l3=
num(ct), &tuple->src.u3, &tuple->dst.u3, IPPROTO_TCP, NULL, &tuple->dst=
=2Eu.tcp.port);
=A0 =A0     nf_ct_expect_put(exp);

=A0 =A0     return 1;
}

hook_func(...){
=A0 =A0     if(!(conntrack =3D nf_ct_get(sock_buff, &ctinfo)) || !(mast=
er_conntrack =3D nf_ct_get(skb, &master_ctinfo))){
=A0 =A0 =A0 =A0         spin_unlock_bh(&np_lock);
=A0 =A0 =A0 =A0         return NF_ACCEPT; /* Couldn't get conntrack */
    }

    =A0 =A0 np_exp(conntrack);
}
 		 	   		 =20
_________________________________________________________________
Hotmail: Free, trusted and rich email service.
https://signup.live.com/signup.aspx?id=3D60969