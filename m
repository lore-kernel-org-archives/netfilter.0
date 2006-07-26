From: =?iso-8859-1?q?Ra=FFfffffal=20Rodr=FFffffedguez?=
	<raul_rodriguez_vasquez@yahoo.es>
Subject: I can't printk() with netfilter
Date: Thu, 27 Jul 2006 00:06:16 +0200 (CEST)
Message-ID: <20060726220616.81550.qmail@web86904.mail.ukl.yahoo.com>
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

In the definition of the hook function, the function
printk() is called, but nothing matter.... or i can't
see  where it happens (the "Dropped packet on ...." is
showed in the screen..!!!).  Please, can anybody tell
me what must i do or what is wrong with this? Thanks!

    unsigned int hook_func(unsigned int hooknum,
                           struct sk_buff **skb,
                           const struct net_device
*in,
                           const struct net_device
*out,
                           int (*okfn)(struct sk_buff
*))
    {
        if (strcmp(in->name, drop_if) =3D=3D 0) {
            printk("Dropped packet on %s...\n",
drop_if);
            return NF_DROP;
	} else {
	    return NF_ACCEPT;
	}
    }


	=09
______________________________________________=20
LLama Gratis a cualquier PC del Mundo.=20
Llamadas a fijos y m=F3viles desde 1 c=E9ntimo por minuto.=20
http://es.voice.yahoo.com

