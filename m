From: "Andrew Kraslavsky" <andykras@hotmail.com>
Subject: Proposed patch for --limit argument for ipset hash and tree sets
Date: Tue, 20 Jun 2006 12:53:24 -0700
Message-ID: <BAY106-F312E426E56DAF30D8BB78DD6870@phx.gbl>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello,

Listed below are 2 unified diffs for changes I made to the ipset utility and 
associated iptables/ipset kernel modules that allow the user to define a 
maximum set size limit on the command line using "--limit".

This change has been built on top of the support for the kernel module 
"limit" argument that was added in ipset v2.2.9 such that the lesser of the 
two values (the module "limit" argument and the ipset command line "--limit" 
argument) is deployed.

Jozsef Kadlecsik was kind enough to provide me some pointers on how to 
create the diff output (thanks Jozsef!) since this is my very first 
submission to any Open Source project but, if I did it wrong, the fault is 
certainly entirely mine and I would appreciate any corrections or comments 
on the content of the diffs.

The same of course goes for the actual change itself.

If acceptable, please include this change in the next version of 
ipset/iptables, or in whichever upcoming version you think best.

Thanks,

-Andrew Kraslavsky

ipset diff:

diff -urN ipset/a/ipset_iphash.c ipset/b/ipset_iphash.c
--- ipset/a/ipset_iphash.c	2005-10-12 08:53:58.000000000 -0700
+++ ipset/b/ipset_iphash.c	2006-06-20 11:43:22.000000000 -0700
@@ -39,6 +39,7 @@
#define OPT_CREATE_PROBES	0x02U
#define OPT_CREATE_RESIZE	0x04U
#define OPT_CREATE_NETMASK	0x08U
+#define OPT_CREATE_LIMIT	0x10U

/* Initialize the create. */
void create_init(void *data)
@@ -50,6 +51,8 @@

	/* Default create parameters */
	mydata->hashsize = 1024;
+	mydata->limit = 65535;
+	mydata->elements = 0;
	mydata->probes = 8;
	mydata->resize = 50;

@@ -117,6 +120,17 @@

		break;

+	case '5':
+
+		if (string_to_number(optarg, 0, UINT_MAX - 1, &mydata->limit))
+			exit_error(PARAMETER_PROBLEM, "Invalid limit `%s' specified", optarg);
+
+		*flags |= OPT_CREATE_LIMIT;
+
+		DP("--limit %u", mydata->limit);
+
+		break;
+
	default:
		return 0;
	}
@@ -131,8 +145,8 @@
	struct ip_set_req_iphash_create *mydata =
	    (struct ip_set_req_iphash_create *) data;

-	DP("hashsize %u probes %u resize %u",
-	   mydata->hashsize, mydata->probes, mydata->resize);
+	DP("hashsize %u probes %u resize %u limit %u",
+	   mydata->hashsize, mydata->probes, mydata->resize, mydata->limit);
#endif
}

@@ -142,6 +156,7 @@
	{"probes", 1, 0, '2'},
	{"resize", 1, 0, '3'},
	{"netmask", 1, 0, '4'},
+	{"limit", 1, 0, '5'},
	{0}
};

@@ -172,6 +187,8 @@

	memset(map, 0, sizeof(struct ip_set_iphash));
	map->hashsize = header->hashsize;
+	map->limit = header->limit;
+	map->elements = header->elements;
	map->probes = header->probes;
	map->resize = header->resize;
	map->netmask = header->netmask;
@@ -201,6 +218,8 @@
	printf(" hashsize: %u", mysetdata->hashsize);
	printf(" probes: %u", mysetdata->probes);
	printf(" resize: %u", mysetdata->resize);
+	printf(" limit: %u", mysetdata->limit);
+	printf(" count: %u", mysetdata->elements);
	if (mysetdata->netmask == 0xFFFFFFFF)
		printf("\n");
	else
@@ -225,9 +244,9 @@
	struct ip_set_iphash *mysetdata =
	    (struct ip_set_iphash *) set->settype->header;

-	printf("-N %s %s --hashsize %u --probes %u --resize %u",
+	printf("-N %s %s --hashsize %u --probes %u --resize %u --limit %u",
	       set->name, set->settype->typename,
-	       mysetdata->hashsize, mysetdata->probes, mysetdata->resize);
+	       mysetdata->hashsize, mysetdata->probes, mysetdata->resize, 
mysetdata->limit);
	if (mysetdata->netmask == 0xFFFFFFFF)
		printf("\n");
	else
@@ -254,6 +273,7 @@
	printf
	    ("-N set iphash [--hashsize hashsize] [--probes probes ]\n"
	     "              [--resize resize] [--netmask CIDR-netmask]\n"
+	     "              [--limit limit]\n"
	     "-A set IP\n"
	     "-D set IP\n"
	     "-T set IP\n");
diff -urN ipset/a/ipset_ipporthash.c ipset/b/ipset_ipporthash.c
--- ipset/a/ipset_ipporthash.c	2005-11-24 01:08:57.000000000 -0800
+++ ipset/b/ipset_ipporthash.c	2006-06-20 11:43:22.000000000 -0700
@@ -39,6 +39,7 @@
#define OPT_CREATE_NETWORK	0x08U
#define OPT_CREATE_FROM		0x10U
#define OPT_CREATE_TO		0x20U
+#define OPT_CREATE_LIMIT	0x40U

/* Initialize the create. */
void create_init(void *data)
@@ -50,6 +51,8 @@

	/* Default create parameters */
	mydata->hashsize = 1024;
+	mydata->limit = 65535;
+	mydata->elements = 0;
	mydata->probes = 8;
	mydata->resize = 50;
}
@@ -137,7 +140,17 @@
		   mydata->to, ip_tostring_numeric(mydata->to));

		break;
-
+
+	case '7':
+
+		if (string_to_number(optarg, 0, UINT_MAX - 1, &mydata->limit))
+			exit_error(PARAMETER_PROBLEM, "Invalid limit `%s' specified", optarg);
+
+		*flags |= OPT_CREATE_LIMIT;
+
+		DP("--limit %u", mydata->limit);
+
+		break;
	default:
		return 0;
	}
@@ -152,8 +165,8 @@
	    (struct ip_set_req_ipporthash_create *) data;

#ifdef IPSET_DEBUG
-	DP("hashsize %u probes %u resize %u",
-	   mydata->hashsize, mydata->probes, mydata->resize);
+	DP("hashsize %u probes %u resize %u limit %u",
+	   mydata->hashsize, mydata->probes, mydata->resize, mydata->limit);
#endif

	if (flags & OPT_CREATE_NETWORK) {
@@ -194,6 +207,7 @@
	{"from", 1, 0, '4'},
	{"to", 1, 0, '5'},
	{"network", 1, 0, '6'},
+	{"limit", 1, 0, '7'},
	{0}
};

@@ -232,6 +246,8 @@

	memset(map, 0, sizeof(struct ip_set_ipporthash));
	map->hashsize = header->hashsize;
+	map->limit = header->limit;
+	map->elements = header->elements;
	map->probes = header->probes;
	map->resize = header->resize;
	map->first_ip = header->from;
@@ -247,7 +263,9 @@
	printf(" to: %s", ip_tostring(mysetdata->last_ip, options));
	printf(" hashsize: %u", mysetdata->hashsize);
	printf(" probes: %u", mysetdata->probes);
-	printf(" resize: %u\n", mysetdata->resize);
+	printf(" resize: %u", mysetdata->resize);
+	printf(" limit: %u", mysetdata->limit);
+	printf(" count: %u\n", mysetdata->elements);
}

void printips(struct set *set, void *data, size_t len, unsigned options)
@@ -281,8 +299,8 @@
	       ip_tostring(mysetdata->first_ip, options));
	printf(" --to %s",
	       ip_tostring(mysetdata->last_ip, options));
-	printf(" --hashsize %u --probes %u --resize %u\n",
-	       mysetdata->hashsize, mysetdata->probes, mysetdata->resize);
+	printf(" --hashsize %u --probes %u --resize %u --limit %u\n",
+	       mysetdata->hashsize, mysetdata->probes, mysetdata->resize, 
mysetdata->limit);
}

/* Print save for an IP */
@@ -328,8 +346,10 @@
	printf
	    ("-N set ipporthash --from IP --to IP\n"
	     "   [--hashsize hashsize] [--probes probes ] [--resize resize]\n"
+	     "   [--limit limit]\n"
	     "-N set ipporthash --network IP/mask\n"
	     "   [--hashsize hashsize] [--probes probes ] [--resize resize]\n"
+	     "   [--limit limit]\n"
	     "-A set IP%%port\n"
	     "-D set IP%%port\n"
	     "-T set IP%%port\n");
diff -urN ipset/a/ipset_iptree.c ipset/b/ipset_iptree.c
--- ipset/a/ipset_iptree.c	2005-11-24 01:08:57.000000000 -0800
+++ ipset/b/ipset_iptree.c	2006-06-20 11:43:22.000000000 -0700
@@ -28,6 +28,7 @@
#define BUFLEN 30;

#define OPT_CREATE_TIMEOUT    0x01U
+#define OPT_CREATE_LIMIT      0x02U

/* Initialize the create. */
void create_init(void *data)
@@ -37,6 +38,8 @@

	DP("create INIT");
	mydata->timeout = 0;
+	mydata->limit = 65535;
+	mydata->elements = 0;
}

/* Function which parses command options; returns true if it ate an option 
*/
@@ -56,6 +59,18 @@
		DP("--timeout %u", mydata->timeout);

		break;
+
+	case '2':
+
+		if (string_to_number(optarg, 0, UINT_MAX - 1, &mydata->limit))
+			exit_error(PARAMETER_PROBLEM, "Invalid limit `%s' specified", optarg);
+
+		*flags |= OPT_CREATE_LIMIT;
+
+		DP("--limit %u", mydata->limit);
+
+		break;
+
	default:
		return 0;
	}
@@ -71,6 +86,7 @@
/* Create commandline options */
static struct option create_opts[] = {
	{"timeout", 1, 0, '1'},
+	{"limit", 1, 0, '2'},
	{0}
};

@@ -108,6 +124,8 @@
		(struct ip_set_iptree *) set->settype->header;

	map->timeout = header->timeout;
+	map->limit = header->limit;
+	map->elements = header->elements;
}

void printheader(struct set *set, unsigned options)
@@ -117,6 +135,8 @@

	if (mysetdata->timeout)
		printf(" timeout: %u", mysetdata->timeout);
+	printf(" limit: %u", mysetdata->limit);
+	printf(" count: %u", mysetdata->elements);
	printf("\n");
}

@@ -144,12 +164,13 @@
	    (struct ip_set_iptree *) set->settype->header;

	if (mysetdata->timeout)
-		printf("-N %s %s --timeout %u\n",
+		printf("-N %s %s --timeout %u --limit %u\n",
		       set->name, set->settype->typename,
-		       mysetdata->timeout);
+		       mysetdata->timeout, mysetdata->limit);
	else
-		printf("-N %s %s\n",
-		       set->name, set->settype->typename);
+		printf("-N %s %s --limit %u\n",
+		       set->name, set->settype->typename,
+		       mysetdata->limit);
}

void saveips(struct set *set, void *data, size_t len, unsigned options)
@@ -179,7 +200,7 @@
void usage(void)
{
	printf
-	    ("-N set iptree [--timeout value]\n"
+	("-N set iptree [--timeout value] [--limit limit]\n"
	     "-A set IP[%%timeout]\n"
	     "-D set IP\n"
	     "-T set IP\n");
diff -urN ipset/a/ipset_nethash.c ipset/b/ipset_nethash.c
--- ipset/a/ipset_nethash.c	2005-11-24 01:08:57.000000000 -0800
+++ ipset/b/ipset_nethash.c	2006-06-20 11:43:22.000000000 -0700
@@ -38,6 +38,7 @@
#define OPT_CREATE_HASHSIZE	0x01U
#define OPT_CREATE_PROBES	0x02U
#define OPT_CREATE_RESIZE	0x04U
+#define OPT_CREATE_LIMIT	0x08U

/* Initialize the create. */
void create_init(void *data)
@@ -49,6 +50,8 @@

	/* Default create parameters */
	mydata->hashsize = 1024;
+	mydata->limit = 65535;
+	mydata->elements = 0;
	mydata->probes = 4;
	mydata->resize = 50;
}
@@ -98,6 +101,17 @@

		break;

+	case '4':
+
+		if (string_to_number(optarg, 0, UINT_MAX - 1, &mydata->limit))
+			exit_error(PARAMETER_PROBLEM, "Invalid limit `%s' specified", optarg);
+
+		*flags |= OPT_CREATE_LIMIT;
+
+		DP("--limit %u", mydata->limit);
+
+		break;
+
	default:
		return 0;
	}
@@ -112,8 +126,8 @@
	struct ip_set_req_nethash_create *mydata =
	    (struct ip_set_req_nethash_create *) data;

-	DP("hashsize %u probes %u resize %u",
-	   mydata->hashsize, mydata->probes, mydata->resize);
+	DP("hashsize %u probes %u resize %u limit %u",
+	   mydata->hashsize, mydata->probes, mydata->resize, mydata->limit);
#endif
}

@@ -122,6 +136,7 @@
	{"hashsize", 1, 0, '1'},
	{"probes", 1, 0, '2'},
	{"resize", 1, 0, '3'},
+	{"limit", 1, 0, '4'},
	{0}
};

@@ -170,6 +185,8 @@

	memset(map, 0, sizeof(struct ip_set_nethash));
	map->hashsize = header->hashsize;
+	map->limit = header->limit;
+	map->elements = header->elements;
	map->probes = header->probes;
	map->resize = header->resize;
}
@@ -197,7 +214,9 @@

	printf(" hashsize: %u", mysetdata->hashsize);
	printf(" probes: %u", mysetdata->probes);
-	printf(" resize: %u\n", mysetdata->resize);
+	printf(" resize: %u", mysetdata->resize);
+	printf(" limit: %u", mysetdata->limit);
+	printf(" count: %u\n", mysetdata->elements);
}

static char buf[20];
@@ -271,9 +290,9 @@
	struct ip_set_nethash *mysetdata =
	    (struct ip_set_nethash *) set->settype->header;

-	printf("-N %s %s --hashsize %u --probes %u --resize %u\n",
+	printf("-N %s %s --hashsize %u --probes %u --resize %u --limit %u\n",
	       set->name, set->settype->typename,
-	       mysetdata->hashsize, mysetdata->probes, mysetdata->resize);
+	       mysetdata->hashsize, mysetdata->probes, mysetdata->resize, 
mysetdata->limit);
}

/* Print save for an IP */
@@ -322,7 +341,7 @@
{
	printf
	    ("-N set nethash [--hashsize hashsize] [--probes probes ]\n"
-	     "               [--resize resize]\n"
+	     "               [--resize resize] [--limit limit]\n"
	     "-A set IP/cidr\n"
	     "-D set IP/cidr\n"
	     "-T set IP/cidr\n");

========================================
netfilter diff:

diff -urN linux/a/include/linux/netfilter_ipv4/ip_set_iphash.h 
linux/b/include/linux/netfilter_ipv4/ip_set_iphash.h
--- linux/a/include/linux/netfilter_ipv4/ip_set_iphash.h	2006-06-20 
11:25:42.000000000 -0700
+++ linux/b/include/linux/netfilter_ipv4/ip_set_iphash.h	2006-06-20 
11:40:25.000000000 -0700
@@ -10,6 +10,7 @@
	ip_set_ip_t *members;		/* the iphash proper */
	uint32_t elements;		/* number of elements */
	uint32_t hashsize;		/* hash size */
+	uint32_t limit;			/* limit of entries within hash */
	uint16_t probes;		/* max number of probes  */
	uint16_t resize;		/* resize factor in percent */
	ip_set_ip_t netmask;		/* netmask */
@@ -17,7 +18,9 @@
};

struct ip_set_req_iphash_create {
+	uint32_t elements;
	uint32_t hashsize;
+	uint32_t limit;
	uint16_t probes;
	uint16_t resize;
	ip_set_ip_t netmask;
diff -urN linux/a/include/linux/netfilter_ipv4/ip_set_ipporthash.h 
linux/b/include/linux/netfilter_ipv4/ip_set_ipporthash.h
--- linux/a/include/linux/netfilter_ipv4/ip_set_ipporthash.h	2006-06-20 
11:25:42.000000000 -0700
+++ linux/b/include/linux/netfilter_ipv4/ip_set_ipporthash.h	2006-06-20 
11:40:25.000000000 -0700
@@ -11,6 +11,7 @@
	ip_set_ip_t *members;		/* the ipporthash proper */
	uint32_t elements;		/* number of elements */
	uint32_t hashsize;		/* hash size */
+	uint32_t limit;			/* limit of entries within hash */
	uint16_t probes;		/* max number of probes  */
	uint16_t resize;		/* resize factor in percent */
	ip_set_ip_t first_ip;		/* host byte order, included in range */
@@ -19,7 +20,9 @@
};

struct ip_set_req_ipporthash_create {
+	uint32_t elements;
	uint32_t hashsize;
+	uint32_t limit;
	uint16_t probes;
	uint16_t resize;
	ip_set_ip_t from;
diff -urN linux/a/include/linux/netfilter_ipv4/ip_set_iptree.h 
linux/b/include/linux/netfilter_ipv4/ip_set_iptree.h
--- linux/a/include/linux/netfilter_ipv4/ip_set_iptree.h	2006-06-20 
11:25:42.000000000 -0700
+++ linux/b/include/linux/netfilter_ipv4/ip_set_iptree.h	2006-06-20 
11:40:25.000000000 -0700
@@ -21,8 +21,9 @@
struct ip_set_iptree {
	unsigned int timeout;
	unsigned int gc_interval;
-#ifdef __KERNEL__
	uint32_t elements;		/* number of elements */
+	uint32_t limit;			/* limit of entries within hash */
+#ifdef __KERNEL__
	struct timer_list gc;
	struct ip_set_iptreeb *tree[256];	/* ADDR.*.*.* */
#endif
@@ -30,6 +31,8 @@

struct ip_set_req_iptree_create {
	unsigned int timeout;
+	uint32_t elements;
+	uint32_t limit;
};

struct ip_set_req_iptree {
diff -urN linux/a/include/linux/netfilter_ipv4/ip_set_nethash.h 
linux/b/include/linux/netfilter_ipv4/ip_set_nethash.h
--- linux/a/include/linux/netfilter_ipv4/ip_set_nethash.h	2006-06-20 
11:25:42.000000000 -0700
+++ linux/b/include/linux/netfilter_ipv4/ip_set_nethash.h	2006-06-20 
11:40:25.000000000 -0700
@@ -10,6 +10,7 @@
	ip_set_ip_t *members;		/* the nethash proper */
	uint32_t elements;		/* number of elements */
	uint32_t hashsize;		/* hash size */
+	uint32_t limit;			/* limit of entries within hash */
	uint16_t probes;		/* max number of probes  */
	uint16_t resize;		/* resize factor in percent */
	unsigned char cidr[30];		/* CIDR sizes */
@@ -17,7 +18,9 @@
};

struct ip_set_req_nethash_create {
+	uint32_t elements;
	uint32_t hashsize;
+	uint32_t limit;
	uint16_t probes;
	uint16_t resize;
};
diff -urN linux/a/net/ipv4/netfilter/ip_set_iphash.c 
linux/b/net/ipv4/netfilter/ip_set_iphash.c
--- linux/a/net/ipv4/netfilter/ip_set_iphash.c	2006-06-20 11:25:16.000000000 
-0700
+++ linux/b/net/ipv4/netfilter/ip_set_iphash.c	2006-06-20 11:36:08.000000000 
-0700
@@ -101,7 +101,7 @@
	u_int16_t i;
	ip_set_ip_t *elem;

-	if (!ip || map->elements > limit)
+	if (!ip || map->elements > map->limit)
		return -ERANGE;

	*hash_ip = ip & map->netmask;
@@ -190,6 +190,7 @@
		return -ENOMEM;
	}
	tmp->hashsize = hashsize;
+	tmp->limit = map->limit;
	tmp->elements = 0;
	tmp->probes = map->probes;
	tmp->resize = map->resize;
@@ -310,6 +311,7 @@
		get_random_bytes(((uint32_t *) map->initval)+i, 4);
	map->elements = 0;
	map->hashsize = req->hashsize;
+	map->limit = (req->limit > 0 && req->limit < limit) ? req->limit - 1 : 
limit;
	map->probes = req->probes;
	map->resize = req->resize;
	map->netmask = req->netmask;
@@ -348,6 +350,8 @@
	    (struct ip_set_req_iphash_create *) data;

	header->hashsize = map->hashsize;
+	header->limit = map->limit + 1;	/* O relative for enforcement but 1 
relative for display) */
+	header->elements = map->elements;
	header->probes = map->probes;
	header->resize = map->resize;
	header->netmask = map->netmask;
diff -urN linux/a/net/ipv4/netfilter/ip_set_ipporthash.c 
linux/b/net/ipv4/netfilter/ip_set_ipporthash.c
--- linux/a/net/ipv4/netfilter/ip_set_ipporthash.c	2006-06-20 
11:25:16.000000000 -0700
+++ linux/b/net/ipv4/netfilter/ip_set_ipporthash.c	2006-06-20 
11:36:08.000000000 -0700
@@ -190,7 +190,7 @@
__addip(struct ip_set_ipporthash *map, ip_set_ip_t ip, ip_set_ip_t port,
	ip_set_ip_t *hash_ip)
{
-	if (map->elements > limit)
+	if (map->elements > map->limit)
		return -ERANGE;
	if (ip < map->first_ip || ip > map->last_ip)
		return -ERANGE;
@@ -288,6 +288,7 @@
		return -ENOMEM;
	}
	tmp->hashsize = hashsize;
+	tmp->limit = map->limit;
	tmp->elements = 0;
	tmp->probes = map->probes;
	tmp->resize = map->resize;
@@ -430,6 +431,7 @@
		get_random_bytes(((uint32_t *) map->initval)+i, 4);
	map->elements = 0;
	map->hashsize = req->hashsize;
+	map->limit = (req->limit > 0 && req->limit < limit) ? req->limit - 1 : 
limit;
	map->probes = req->probes;
	map->resize = req->resize;
	map->first_ip = req->from;
@@ -469,6 +471,8 @@
	    (struct ip_set_req_ipporthash_create *) data;

	header->hashsize = map->hashsize;
+	header->limit = map->limit + 1;	/* O relative for enforcement but 1 
relative for display) */
+	header->elements = map->elements;
	header->probes = map->probes;
	header->resize = map->resize;
	header->from = map->first_ip;
diff -urN linux/a/net/ipv4/netfilter/ip_set_iptree.c 
linux/b/net/ipv4/netfilter/ip_set_iptree.c
--- linux/a/net/ipv4/netfilter/ip_set_iptree.c	2006-06-20 11:25:16.000000000 
-0700
+++ linux/b/net/ipv4/netfilter/ip_set_iptree.c	2006-06-20 11:36:08.000000000 
-0700
@@ -135,7 +135,7 @@
	unsigned char a,b,c,d;
	int ret = 0;

-	if (!ip || map->elements > limit)
+	if (!ip || map->elements > map->limit)
		/* We could call the garbage collector
		 * but it's probably overkill */
		return -ERANGE;
@@ -376,6 +376,7 @@
	memset(map, 0, sizeof(*map));
	map->timeout = req->timeout;
	map->elements = 0;
+	map->limit = (req->limit > 0 && req->limit < limit) ? req->limit - 1 : 
limit;
	set->data = map;

	init_gc_timer(set);
@@ -408,7 +409,7 @@

	/* gc might be running */
	while (!del_timer(&map->gc))
-		msleep(IPTREE_DESTROY_SLEEP);
+		mdelay(IPTREE_DESTROY_SLEEP);
	__flush(map);
	kfree(map);
	set->data = NULL;
@@ -421,7 +422,7 @@

	/* gc might be running */
	while (!del_timer(&map->gc))
-		msleep(IPTREE_DESTROY_SLEEP);
+		mdelay(IPTREE_DESTROY_SLEEP);
	__flush(map);
	memset(map, 0, sizeof(*map));
	map->timeout = timeout;
@@ -436,6 +437,8 @@
	    (struct ip_set_req_iptree_create *) data;

	header->timeout = map->timeout;
+	header->limit = map->limit + 1;	/* O relative for enforcement but 1 
relative for display) */
+	header->elements = map->elements;
}

static int list_members_size(const struct ip_set *set)
diff -urN linux/a/net/ipv4/netfilter/ip_set_nethash.c 
linux/b/net/ipv4/netfilter/ip_set_nethash.c
--- linux/a/net/ipv4/netfilter/ip_set_nethash.c	2006-06-20 
11:25:16.000000000 -0700
+++ linux/b/net/ipv4/netfilter/ip_set_nethash.c	2006-06-20 
11:36:08.000000000 -0700
@@ -143,7 +143,7 @@
__addip(struct ip_set_nethash *map, ip_set_ip_t ip, unsigned char cidr,
	ip_set_ip_t *hash_ip)
{
-	if (!ip || map->elements > limit)
+	if (!ip || map->elements > map->limit)
		return -ERANGE;

	*hash_ip = pack(ip, cidr);
@@ -253,6 +253,7 @@
		return -ENOMEM;
	}
	tmp->hashsize = hashsize;
+	tmp->limit = map->limit;
	tmp->elements = 0;
	tmp->probes = map->probes;
	tmp->resize = map->resize;
@@ -378,6 +379,7 @@
		get_random_bytes(((uint32_t *) map->initval)+i, 4);
	map->elements = 0;
	map->hashsize = req->hashsize;
+	map->limit = (req->limit > 0 && req->limit < limit) ? req->limit - 1 : 
limit;
	map->probes = req->probes;
	map->resize = req->resize;
	memset(map->cidr, 0, 30 * sizeof(unsigned char));
@@ -417,6 +419,8 @@
	    (struct ip_set_req_nethash_create *) data;

	header->hashsize = map->hashsize;
+	header->limit = map->limit + 1;	/* O relative for enforcement but 1 
relative for display) */
+	header->elements = map->elements;
	header->probes = map->probes;
	header->resize = map->resize;
}

_________________________________________________________________
On the road to retirement? Check out MSN Life Events for advice on how to 
get there! http://lifeevents.msn.com/category.aspx?cid=Retirement


