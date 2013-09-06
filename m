From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: ip6tables no target CT
Date: Fri, 6 Sep 2013 13:35:56 +0200
Message-ID: <20130906113556.GA10241@localhost>
References: <CAMD-=VK6oTYC==N2+EJPRYxgkovtwrU0hunMJ8eWdh-7fzCzMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="1yeeQ81UyVL57Vl7"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMD-=VK6oTYC==N2+EJPRYxgkovtwrU0hunMJ8eWdh-7fzCzMA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Nick Edwards <nick.z.edwards@gmail.com>
Cc: Netfilter user mailing list <netfilter@vger.kernel.org>


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 06, 2013 at 08:18:22PM +1000, Nick Edwards wrote:
> HI,
>  I still have this issue, I checked the kernel build, and everything
> under ipv6 except ipv6nat is enabled, yet the CT target fails.
> 
> This same rule on ipv4 works
>   iptables 1.4.20 on kernel 3.10.10
> 
> ip6tables -v -A PREROUTING -t raw -m multiport -p tcp --dports
> 6667,8888,16667 -j CT --helper irc
> 
> CT  tcp opt    in * out *  ::/0  -> ::/0   multiport dports
> 6667,8888,16667 CT helper irc
> ip6tables: No chain/target/match by that name.
> 
> incase it was multi upsetting it, also tried
> 
> ip6tables -v -A PREROUTING -t raw -p tcp --dport 6667 -j CT --helper irc
> CT  tcp opt    in * out *  ::/0  -> ::/0   tcp dpt:6667 CT helper irc
> ip6tables: No chain/target/match by that name.
> 
> any suggestions?

It seems we never had IPv6 support for the irc helper. You've been the
first one to notice.


--1yeeQ81UyVL57Vl7
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="irc.patch"

diff --git a/net/netfilter/nf_conntrack_irc.c b/net/netfilter/nf_conntrack_irc.c
index 0fd2976..3e36a2b 100644
--- a/net/netfilter/nf_conntrack_irc.c
+++ b/net/netfilter/nf_conntrack_irc.c
@@ -227,14 +227,14 @@ static int help(struct sk_buff *skb, unsigned int protoff,
 	return ret;
 }
 
-static struct nf_conntrack_helper irc[MAX_PORTS] __read_mostly;
+static struct nf_conntrack_helper irc[MAX_PORTS][2] __read_mostly;
 static struct nf_conntrack_expect_policy irc_exp_policy;
 
 static void nf_conntrack_irc_fini(void);
 
 static int __init nf_conntrack_irc_init(void)
 {
-	int i, ret;
+	int i, j, ret;
 
 	if (max_dcc_channels < 1) {
 		printk(KERN_ERR "nf_ct_irc: max_dcc_channels must not be zero\n");
@@ -253,25 +253,34 @@ static int __init nf_conntrack_irc_init(void)
 		ports[ports_c++] = IRC_PORT;
 
 	for (i = 0; i < ports_c; i++) {
-		irc[i].tuple.src.l3num = AF_INET;
-		irc[i].tuple.src.u.tcp.port = htons(ports[i]);
-		irc[i].tuple.dst.protonum = IPPROTO_TCP;
-		irc[i].expect_policy = &irc_exp_policy;
-		irc[i].me = THIS_MODULE;
-		irc[i].help = help;
-
-		if (ports[i] == IRC_PORT)
-			sprintf(irc[i].name, "irc");
-		else
-			sprintf(irc[i].name, "irc-%u", i);
-
-		ret = nf_conntrack_helper_register(&irc[i]);
-		if (ret) {
-			printk(KERN_ERR "nf_ct_irc: failed to register helper "
-			       "for pf: %u port: %u\n",
-			       irc[i].tuple.src.l3num, ports[i]);
-			nf_conntrack_irc_fini();
-			return ret;
+		irc[i][0].tuple.src.l3num = AF_INET;
+		irc[i][0].tuple.src.u.tcp.port = htons(ports[i]);
+		irc[i][0].tuple.dst.protonum = IPPROTO_TCP;
+		irc[i][0].expect_policy = &irc_exp_policy;
+		irc[i][0].me = THIS_MODULE;
+		irc[i][0].help = help;
+
+		irc[i][1].tuple.src.l3num = AF_INET6;
+		irc[i][1].tuple.src.u.tcp.port = htons(ports[i]);
+		irc[i][1].tuple.dst.protonum = IPPROTO_TCP;
+		irc[i][1].expect_policy = &irc_exp_policy;
+		irc[i][1].me = THIS_MODULE;
+		irc[i][1].help = help;
+
+		for (j = 0; j < ARRAY_SIZE(irc[i]); j++) {
+			if (ports[i] == IRC_PORT)
+				sprintf(irc[i][j].name, "irc");
+			else
+				sprintf(irc[i][j].name, "irc-%u", i);
+
+			ret = nf_conntrack_helper_register(&irc[i][j]);
+			if (ret) {
+				printk(KERN_ERR "nf_ct_irc: failed to register helper "
+				       "for pf: %u port: %u\n",
+				       irc[i][j].tuple.src.l3num, ports[i]);
+				nf_conntrack_irc_fini();
+				return ret;
+			}
 		}
 	}
 	return 0;
@@ -281,10 +290,12 @@ static int __init nf_conntrack_irc_init(void)
  * it is needed by the init function */
 static void nf_conntrack_irc_fini(void)
 {
-	int i;
+	int i, j;
 
-	for (i = 0; i < ports_c; i++)
-		nf_conntrack_helper_unregister(&irc[i]);
+	for (i = 0; i < ports_c; i++) {
+		for (j = 0; j < ARRAY_SIZE(irc[i]); j++)
+			nf_conntrack_helper_unregister(&irc[i][j]);
+	}
 	kfree(irc_buffer);
 }
 

--1yeeQ81UyVL57Vl7--
