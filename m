From: "Ing. CIP Alejandro Celi "Mariategui <alex@linux.org.pe>
Subject: RE: IPLIMIT Patch UDP
Date: 24 Feb 2003 15:41:00 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1046119262.1237.18.camel@alex.pcprices.com.pe>
References: <20030221214109.GB19981@kuleuven.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030221214109.GB19981@kuleuven.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Du Caju <Jan.DuCaju@kuleuven.net>
Cc: netfilter@lists.netfilter.org


Thank You very much, Jan and Joel, I will try with udplimit right now!!!

Alex


El vie, 21-02-2003 a las 16:41, Jan Du Caju escribi=F3:
    Hi again,
   =20
    Jan Du Caju wrote:
     > >  Ing. CIP Alejandro Celi Mariategui wrote:
     > >
     > >  (Sorry, but my english is very bad)
     > >  Hi,
     > >  I compile with p-o-m the server kernel with IPLIMIT Patch by Gerd
     > >  Knorr
     > >  [1]<kraxel@bytesex.org>
     > >  It work fine, i can limit ex: max 10 TCP connections on the serve=
r,
     > >  but i want to limit the UDP connections to 10 (max).
     > >  How I can do it?
   =20
     >    This week I made a updlimit patch (shameless copy of iplimit ;-)
     >    I will post it this afternoon/evening when I have more time (and
     >    a cross post to the netfilter-devel list. Maybe they like it)
   =20
    In attachment you will find:
     udplimit.patch
     udplimit.patch.config.in
     udplimit.patch.configure.help
     udplimit.patch.help
     udplimit.patch.makefile
   =20
    put those under <patch-o-matic>/base/ directory
   =20
    in the <patch-o-matic> directory you run: ./runme base
    (don't forget to select udplimit ;-)
   =20
    recompile your kernel (with Connections/UDP limit match support
    CONFIG_IP_NF_MATCH_UDPLIMIT ;-)
   =20
    Place the other file attachment (libipt_udplimit.c) in the directory
    <iptables>/extensions/
   =20
    in this directory you will also find the file Makefile where you add
    udplimit just after iplimit
   =20
    recompile iptables
   =20
    Hope this helps (it works for me :-)
   =20
    Greetz,
    Jan.
    --------------------------------------------- KULeuvenNet -----
   =20
    ____________________________________________________________________
   =20
    diff -urN -x *~ -x [Cc]onfig.* -x Makefile vanilla-2.4.21-pre4/net/ipv4=
/netfilter/ipt_udplimit.c linux-2.4.21-pre4/net/ipv4/netfilter/ipt_udplimit=
.c
    --- vanilla-2.4.21-pre4/net/ipv4/netfilter/ipt_udplimit.c	Fri Feb 21 17=
:20:55 2003
    +++ linux-2.4.21-pre4/net/ipv4/netfilter/ipt_udplimit.c	Fri Feb 21 17:1=
7:38 2003
    @@ -0,0 +1,215 @@
    +/*
    + * netfilter module to limit the number of parallel udp
    + * connections per IP address.
    + * Jan Du Caju <Jan.DuCaju@kuleuven.net>
    + *
    + * based on ...
    + * iplimit (in fact a shameless copy ;-)
    + *   (c) 2000 Gerd Knorr <kraxel@bytesex.org>
    + *   Nov 2002: Martin Bene <martin.bene@icomedias.com>:
    + *		only ignore TIME_WAIT or gone connections
    + *
    + *
    + * Kernel module to match connection tracking information.
    + * GPL (C) 1999  Rusty Russell (rusty@rustcorp.com.au).
    + */
    +#include <linux/module.h>
    +#include <linux/skbuff.h>
    +#include <linux/list.h>
    +#include <linux/netfilter_ipv4/ip_conntrack.h>
    +#include <linux/netfilter_ipv4/ip_conntrack_core.h>
    +#include <linux/netfilter_ipv4/ip_tables.h>
    +#include <linux/netfilter_ipv4/ipt_iplimit.h>
    +
    +#define DEBUG 0
    +
    +MODULE_LICENSE("GPL");
    +
    +/* we'll save the tuples of all connections we care about */
    +struct ipt_iplimit_conn
    +{
    +        struct list_head list;
    +	struct ip_conntrack_tuple tuple;
    +};
    +
    +struct ipt_iplimit_data {
    +	spinlock_t lock;
    +	struct list_head iphash[256];
    +};
    +
    +static int ipt_iphash(u_int32_t addr)
    +{
    +	int hash;
    +
    +	hash  =3D  addr        & 0xff;
    +	hash ^=3D (addr >>  8) & 0xff;
    +	hash ^=3D (addr >> 16) & 0xff;
    +	hash ^=3D (addr >> 24) & 0xff;
    +	return hash;
    +}
    +
    +static int count_them(struct ipt_iplimit_data *data,
    +		      u_int32_t addr, u_int32_t mask,
    +		      struct ip_conntrack *ct)
    +{
    +	int addit =3D 1, matches =3D 0;
    +	struct ip_conntrack_tuple tuple;
    +	struct ip_conntrack_tuple_hash *found;
    +	struct ipt_iplimit_conn *conn;
    +	struct list_head *hash,*lh;
    +
    +	spin_lock(&data->lock);
    +	tuple =3D ct->tuplehash[0].tuple;
    +	hash =3D &data->iphash[ipt_iphash(addr & mask)];
    +
    +	/* check the saved connections */
    +	for (lh =3D hash->next; lh !=3D hash; lh =3D lh->next) {
    +		conn =3D list_entry(lh,struct ipt_iplimit_conn,list);
    +		found =3D ip_conntrack_find_get(&conn->tuple,ct);
    +		if (0 =3D=3D memcmp(&conn->tuple,&tuple,sizeof(tuple)) &&
    +		    found !=3D NULL) {
    +			addit =3D 0;
    +		}
    +#if DEBUG
    +		printk("ipt_udplimit [%d]: src=3D%u.%u.%u.%u:%d dst=3D%u.%u.%u.%u:%d=
\n",
    +		       ipt_iphash(addr & mask),
    +		       NIPQUAD(conn->tuple.src.ip), ntohs(conn->tuple.src.u.udp.port=
),
    +		       NIPQUAD(conn->tuple.dst.ip), ntohs(conn->tuple.dst.u.udp.port=
));
    +#endif
    +		if (NULL =3D=3D found) {
    +			/* this one is gone */
    +			lh =3D lh->prev;
    +			list_del(lh->next);
    +			kfree(conn);
    +			continue;
    +		}
    +		if ((addr & mask) =3D=3D (conn->tuple.src.ip & mask)) {
    +			/* same source IP address -> be counted! */
    +			matches++;
    +		}
    +		nf_conntrack_put(&found->ctrack->infos[0]);
    +	}
    +	if (addit) {
    +		/* save the new connection in our list */
    +#if DEBUG
    +		printk("ipt_udplimit [%d]: src=3D%u.%u.%u.%u:%d dst=3D%u.%u.%u.%u:%d=
 new\n",
    +		       ipt_iphash(addr & mask),
    +		       NIPQUAD(tuple.src.ip), ntohs(tuple.src.u.tcp.port),
    +		       NIPQUAD(tuple.dst.ip), ntohs(tuple.dst.u.tcp.port));
    +#endif
    +		conn =3D kmalloc(sizeof(*conn),GFP_ATOMIC);
    +		if (NULL =3D=3D conn)
    +			return -1;
    +		memset(conn,0,sizeof(*conn));
    +		INIT_LIST_HEAD(&conn->list);
    +		conn->tuple =3D tuple;
    +		list_add(&conn->list,hash);
    +		matches++;
    +	}
    +	spin_unlock(&data->lock);
    +	return matches;
    +}
    +
    +static int
    +match(const struct sk_buff *skb,
    +      const struct net_device *in,
    +      const struct net_device *out,
    +      const void *matchinfo,
    +      int offset,
    +      const void *hdr,
    +      u_int16_t datalen,
    +      int *hotdrop)
    +{
    +	const struct ipt_iplimit_info *info =3D matchinfo;
    +	int connections, match;
    +	struct ip_conntrack *ct;
    +	enum ip_conntrack_info ctinfo;
    +
    +	ct =3D ip_conntrack_get((struct sk_buff *)skb, &ctinfo);
    +	if (NULL =3D=3D ct) {
    +		printk("ipt_udplimit: Oops: invalid ct state ?\n");
    +		*hotdrop =3D 1;
    +		return 0;
    +	}
    +	connections =3D count_them(info->data,skb->nh.iph->saddr,info->mask,c=
t);
    +	if (-1 =3D=3D connections) {
    +		printk("ipt_udplimit: Hmm, kmalloc failed :-(\n");
    +		*hotdrop =3D 1; /* let's free some memory :-) */
    +		return 0;
    +	}
    +        match =3D (info->inverse) ? (connections <=3D info->limit) : (=
connections > info->limit);
    +#if DEBUG
    +	printk("ipt_udplimit: src=3D%u.%u.%u.%u mask=3D%u.%u.%u.%u "
    +	       "connections=3D%d limit=3D%d match=3D%s\n",
    +	       NIPQUAD(skb->nh.iph->saddr), NIPQUAD(info->mask),
    +	       connections, info->limit, match ? "yes" : "no");
    +#endif
    +
    +	return match;
    +}
    +
    +static int check(const char *tablename,
    +		 const struct ipt_ip *ip,
    +		 void *matchinfo,
    +		 unsigned int matchsize,
    +		 unsigned int hook_mask)
    +{
    +	struct ipt_iplimit_info *info =3D matchinfo;
    +	int i;
    +
    +	/* verify size */
    +	if (matchsize !=3D IPT_ALIGN(sizeof(struct ipt_iplimit_info)))
    +		return 0;
    +
    +	/* refuse anything but udp */
    +	if (ip->proto !=3D IPPROTO_UDP)
    +		return 0;
    +
    +	/* init private data */
    +	info->data =3D kmalloc(sizeof(struct ipt_iplimit_data),GFP_KERNEL);
    +	spin_lock_init(&(info->data->lock));
    +	for (i =3D 0; i < 256; i++)
    +		INIT_LIST_HEAD(&(info->data->iphash[i]));
    +=09
    +	return 1;
    +}
    +
    +static void destroy(void *matchinfo, unsigned int matchinfosize)
    +{
    +	struct ipt_iplimit_info *info =3D matchinfo;
    +	struct ipt_iplimit_conn *conn;
    +	struct list_head *hash;
    +	int i;
    +
    +	/* cleanup */
    +	for (i =3D 0; i < 256; i++) {
    +		hash =3D &(info->data->iphash[i]);
    +		while (hash !=3D hash->next) {
    +			conn =3D list_entry(hash->next,struct ipt_iplimit_conn,list);
    +			list_del(hash->next);
    +			kfree(conn);
    +		}
    +	}
    +	kfree(info->data);
    +}
    +
    +static struct ipt_match udplimit_match
    +=3D { { NULL, NULL }, "udplimit", &match, &check, &destroy, THIS_MODUL=
E };
    +
    +static int __init init(void)
    +{
    +	/* NULL if ip_conntrack not a module */
    +	if (ip_conntrack_module)
    +		__MOD_INC_USE_COUNT(ip_conntrack_module);
    +	return ipt_register_match(&udplimit_match);
    +}
    +
    +static void __exit fini(void)
    +{
    +	ipt_unregister_match(&udplimit_match);
    +	if (ip_conntrack_module)
    +		__MOD_DEC_USE_COUNT(ip_conntrack_module);
    +}
    +
    +module_init(init);
    +module_exit(fini);
   =20
    ____________________________________________________________________
   =20
        dep_tristate '  Connection state match support' CONFIG_IP_NF_MATCH_=
STATE $CONFIG_IP_NF_CONNTRACK $CONFIG_IP_NF_IPTABLES=20
        dep_tristate '  Connections/UDP limit match support' CONFIG_IP_NF_M=
ATCH_UDPLIMIT $CONFIG_IP_NF_IPTABLES
   =20
    ____________________________________________________________________
   =20
    obj-$(CONFIG_IP_NF_MATCH_STATE) +=3D ipt_state.o
    obj-$(CONFIG_IP_NF_MATCH_UDPLIMIT) +=3D ipt_udplimit.o
   =20
    ____________________________________________________________________
   =20
    Author: Gerd Knorr <kraxel@bytesex.org>
    	Jan Du Caju <Jan.DuCaju@kuleuven.net> (I just made a shameless copy
    	of iplimit of Gerd Knorr ;-)
    Status: ItWorksForMe[tm]
   =20
    This adds CONFIG_IP_NF_MATCH_UDPLIMIT match allows you to restrict the
    number of parallel UDP connections to a server per client IP address
    (or address block).
   =20
    Examples:
   =20
    # allow 5 udp connections per client host
    iptables -p udp -m udplimit --udplimit-above 5 -j REJECT
   =20
    # you can also match the other way around:
    iptables -p udp -m udplimit ! --udplimit-above 5 -j ACCEPT
   =20
    # limit the nr of parallel http requests to 16 per class C sized
    # network (24 bit netmask)
    iptables -p udp --dport 161 -m udplimit --udplimit-above 16		\
    	--iplimit-mask 24 -j REJECT
   =20
    ____________________________________________________________________
   =20
    CONFIG_IP_NF_MATCH_STATE
    Connections/UDP limit match support
    CONFIG_IP_NF_MATCH_UDPLIMIT
      This match allows you to restrict the number of parallel UDP
      connections to a server per client IP address (or address block).
   =20
      If you want to compile it as a module, say M here and read
      Documentation/modules.txt.  If unsure, say `N'.
   =20
    ____________________________________________________________________
   =20
    /* Shared library add-on to iptables to add state tracking support. */
    #include <stdio.h>
    #include <netdb.h>
    #include <string.h>
    #include <stdlib.h>
    #include <stddef.h>
    #include <getopt.h>
    #include <iptables.h>
    #include <linux/netfilter_ipv4/ip_conntrack.h>
    #include <linux/netfilter_ipv4/ipt_iplimit.h>
   =20
    /* Function which prints out usage message. */
    static void
    help(void)
    {
    	printf(
    "udplimit v%s options:\n"
    "[!] --udplimit-above n		match if the number of existing udp connection=
s is (not) above n\n"
    " --udplimit-mask n		group hosts using mask\n"
    "\n", IPTABLES_VERSION);
    }
   =20
    static struct option opts[] =3D {
    	{ "udplimit-above", 1, 0, '1' },
    	{ "udplimit-mask",  1, 0, '2' },
    	{0}
    };
   =20
    /* Initialize the match. */
    static void
    init(struct ipt_entry_match *m, unsigned int *nfcache)
    {
    	/* Can't cache this */
    	*nfcache |=3D NFC_UNKNOWN;
    }
   =20
    /* Function which parses command options; returns true if it
       ate an option */
    static int
    parse(int c, char **argv, int invert, unsigned int *flags,
          const struct ipt_entry *entry,
          unsigned int *nfcache,
          struct ipt_entry_match **match)
    {
    	struct ipt_iplimit_info *info =3D (struct ipt_iplimit_info*)(*match)->=
data;
   =20
    	if (0 =3D=3D (*flags & 2)) {
    		/* set default mask unless we've already seen a mask option */
    		info->mask =3D htonl(0xFFFFFFFF);
    	}
   =20
    	switch (c) {
    	case '1':
    		check_inverse(optarg, &invert, &optind, 0);
    		info->limit =3D atoi(argv[optind-1]);
    		info->inverse =3D invert;
    		*flags |=3D 1;
    		break;
   =20
    	case '2':
    		info->mask =3D htonl(0xFFFFFFFF << (32 - atoi(argv[optind-1])));
    		*flags |=3D 2;
    		break;
   =20
    	default:
    		return 0;
    	}
   =20
    	return 1;
    }
   =20
    /* Final check */
    static void final_check(unsigned int flags)
    {
    	if (!flags & 1)
    		exit_error(PARAMETER_PROBLEM, "You must specify `--udplimit-above'");
    }
   =20
    static int
    count_bits(u_int32_t mask)
    {
    	int i, bits;
   =20
    	for (bits =3D 0, i =3D 31; i >=3D 0; i--) {
    		if (mask & htonl((u_int32_t)1 << i)) {
    			bits++;
    			continue;
    		}
    		break;
    	}
    	return bits;
    }
   =20
    /* Prints out the matchinfo. */
    static void
    print(const struct ipt_ip *ip,
          const struct ipt_entry_match *match,
          int numeric)
    {
    	struct ipt_iplimit_info *info =3D (struct ipt_iplimit_info*)match->dat=
a;
   =20
    	printf("#conn/%d %s %d ", count_bits(info->mask),
    	       info->inverse ? "<" : ">", info->limit);
    }
   =20
    /* Saves the matchinfo in parsable form to stdout. */
    static void save(const struct ipt_ip *ip, const struct ipt_entry_match =
*match)
    {
    	struct ipt_iplimit_info *info =3D (struct ipt_iplimit_info*)match->dat=
a;
   =20
    	printf("%s--udplimit-above %d ",info->inverse ? "! " : "",info->limit)=
;
    	printf("--udplimit-mask %d ",count_bits(info->mask));
    }
   =20
    static struct iptables_match udplimit =3D {
    	name:		"udplimit",
    	version:	IPTABLES_VERSION,
    	size:		IPT_ALIGN(sizeof(struct ipt_iplimit_info)),
    	userspacesize:	offsetof(struct ipt_iplimit_info,data),
    	help:		help,
    	init:		init,
    	parse:		parse,
    	final_check:	final_check,
    	print:		print,
    	save: 		save,
    	extra_opts:	opts
    };
   =20
    void _init(void)
    {
    	register_match(&udplimit);
    }
   =20
   =20


