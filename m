From: =?iso-8859-1?q?Ra=FFfffffal=20Rodr=FFffffedguez?=
	<raul_rodriguez_vasquez@yahoo.es>
Subject: doubts about nf_register_queue_handler!!
Date: Wed, 22 Feb 2006 23:14:46 +0100 (CET)
Message-ID: <20060222221446.39341.qmail@web86904.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi guys, i'm writing a netfilter module which must
enqueue packets in different queues and reinject each
one of them according to my decisions... but i have
some doubts....=20

module--------------------------------------
unsigned int hook_func_11(unsigned int hooknum,
                       struct sk_buff **skb,
                       const struct net_device *in,
                       const struct net_device *out,
                       int (*okfn)(struct sk_buff*))
{
    if (strcmp(in->name, interface_LAN) =3D=3D 0)
    { return NF_ACCEPT; }
    if (strcmp(in->name, interface_WAN) =3D=3D 0)
    { return NF_ACCEPT; }
    if (strcmp(in->name, interface_loopback) =3D=3D 0)
    { return NF_QUEUE; }
    else
    { return NF_DROP; }
}     =20

unsigned int hook_func_41(unsigned int hooknum,
                       struct sk_buff **skb,
                       const struct net_device *in,
                       const struct net_device *out,
                       int (*okfn)(struct sk_buff*))
{
    return NF_ACCEPT;
}

int init_module(void)
{
    hook_1.hook     =3D hook_func_11;
    hook_1.hooknum  =3D NF_IP_PRE_ROUTING;
    hook_1.pf       =3D PF_INET;
    hook_1.priority =3D NF_IP_PRI_FIRST;
   =20
    hook_4.hook     =3D hook_func_41;
    hook_4.hooknum  =3D NF_IP_POST_ROUTING;
    hook_4.pf       =3D PF_INET;
    hook_4.priority =3D NF_IP_PRI_FIRST;
           =20
    nf_register_hook(&hook_1);
    nf_register_hook(&hook_4);
           =20
    return 0;
}

void cleanup_module(void)
{
    nf_unregister_hook(&hook_1);
    nf_unregister_hook(&hook_4);
}
---------------------------------------------

I've registered two hooks (NF_IP_PRE_ROUTING and
NF_IP_POST_ROUTING), but one of them enqueue some
packets (return NF_QUEUE)..... I know at this point,
all queued packets are dropped!, because no-one is
registered to handle queued packets...... and for
register interest in queued packets i must use
nf_register_queue_handler() and
nf_unregister_queue_handler()...

In "Processing queued packets - Netfilter hacking
howto" you wrote: you must register interest
in queued packets and then they begin queueing.  Can
you please explain me how do i do that? what happens
with packets when they're queued? where are they
stored?=20

I've seen nf_register_queue_handler declarated in
netfilter.h, but i haven't seen it defined nowhere...
please, how must i register some queue_handlers in my
module (one per protocol)? Thanks for help!!!

Raul Rodriguez


=09
=09
	=09
______________________________________________=20
LLama Gratis a cualquier PC del Mundo.=20
Llamadas a fijos y m=F3viles desde 1 c=E9ntimo por minuto.=20
http://es.voice.yahoo.com

