From: ratheesh kannoth <ratheesh.ksz@gmail.com>
Subject: track the icmp packet.
Date: Thu, 6 Oct 2011 21:41:48 +0530
Message-ID: <CAGZFCEH59K7gFs5uNVdY_XQrAea+DT5Mes4OzOaxCOdnCtTWKw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:cc:content-type;
        bh=UPthOvGYeSAurGJc7TT58eO0kWT+NIImvu27SbYpEus=;
        b=Ce/6U8mWz2Bm9ef1lNK/cg81Fl7/ayS6mw3xr6dLg77C6tSQFdVuVz+gI79luOFYIT
         tr3DH4ZKa7LfaNrwpvQM5oMLHyMWngeRwrebyq2Fqt/FqK3ISZTlPee/dc0iTeCbdbYs
         cnRPoCNaAz+YWBSTPOph6RQ8TX7JPNJ0cOtHg=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter mailing list <netfilter@vger.kernel.org>
Cc: pneira@lsi.us.es

I have a  linux machine (2.6.32 kernel )
ip address is 192.168.0.102 and default gw is 192.168.0.1


I want to do some "printk " when an echo request is sent from the
machine to the gateway
ie ...
# ping  192.168.0.1       // command should do some printk.

I found a program at
http://www.netfilter.org/documentation/HOWTO/netfilter-hacking-HOWTO.txt.
I modified a little for my purpose. But it is not working. Could you
please guide me.



@@@@@@@  conn-track-01.c @@@@@@@@@@@@
// copied from http://www.netfilter.org/documentation/HOWTO/netfilter-hacking-HOWTO.txt
// and modified

#define FOO_PORT        111
#include <linux/module.h>
#include <linux/kernel.h>
#include <net/netfilter/nf_conntrack.h>
#include <net/netfilter/nf_conntrack_helper.h>
#include <linux/ip.h>
#include <net/netfilter/nf_conntrack_expect.h>


static char * dst_ipaddress = "192.168.0.1" ; // my gateway ip address
is 192.168.0.1
module_param(dst_ipaddress, charp, 0000);

static const struct nf_conntrack_expect_policy my_expect_policy = {
        .max_expected           = 3,
        .timeout                = 180,
};


static int foo_expectfn(struct nf_conntrack *new)
{

        return 0;
}

static int foo_help(struct sk_buff *skb,
                    unsigned int protoff,
                   struct nf_conn *ct,
                    enum ip_conntrack_info conntrackinfo)
{
        printk (KERN_INFO "RAT: called the  helper \n");
        return NF_ACCEPT;
}

static struct nf_conntrack_helper foo;

int init_conntrack_module(void)
{
        memset(&foo, 0, sizeof(struct nf_conntrack_helper));

        foo.name = "foo";
        foo.me = THIS_MODULE;

        foo.tuple.dst.protonum = IPPROTO_ICMP;
        foo.tuple.dst.u.icmp.type = 8;
        foo.tuple.dst.u.icmp.code  = 0;
        foo.tuple.src.l3num = AF_INET;
        foo.help = foo_help;
        foo.expect_policy = &my_expect_policy;
        {
          int i = 0;
          int addr = 0;
          char *p = (char *)&addr;
          int a[4];
          sscanf(dst_ipaddress, "%d.%d.%d.%d", &a[3], &a[2], &a[1], &a[0]);
          while(i != 4 ) {
                 *(p + i ) = a[i];
                  i++;
          }
          foo.tuple.dst.u3.ip = addr;
          foo.tuple.src.u3.ip = 0xc0a80066; //my linux machine  ip
address is 192.168.0.102
        }

        return nf_conntrack_helper_register(&foo);
}

void  fini_conntrack_module(void)
{
        nf_conntrack_helper_unregister(&foo);
}

module_init(init_conntrack_module);
module_exit(fini_conntrack_module);

//end of program

-Ratheesh
