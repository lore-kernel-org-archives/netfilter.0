From: Fred Richards <Toril@twcny.rr.com>
Subject: Re: DCC ...
Date: Sun, 09 Jun 2002 21:36:42 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D0402AA.4020208@twcny.rr.com>
References: <3D0373FE.9060205@twcny.rr.com> <1023637180.19838.70.camel@tux>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter <netfilter@lists.samba.org>

	I haven't tried the patch yet, but I have tried upgrading my kernel to 
the latest 2.4 kernel (2.4.19-pre10).  Still doesn't appear to work, 
although I have tried putting in my actual ip address (172.16.0.5).  I 
also cannot find the irc-natip.patch anywhere... doesn't seem to be in 
the iptables 1.2.6a source tree.  Another curiosity ... I see the 
default port for irc (and how netfilter sees related connections) is 
port 6667... having my wife do most of the testing from her machine ... 
most of the time she's connecting to port    6668 ... hmmm ...

Martin Josefsson wrote:
> On Sun, 2002-06-09 at 17:27, Fred Richards wrote:
> 
>>Ok, I have IPtables 1.2.6a and using kernel 2.4.18.  Everything is 
>>working great, but I keep getting this error message when I try and DCC:
>>
>>Forged DCC command from 172.16.0.5: 24.92.231.26:4300
>>Forged DCC command from 172.16.0.5: 24.92.231.26:4399
>>Forged DCC command from 172.16.0.5: 24.92.231.26:4405
>>Forged DCC command from 172.16.0.5: 24.92.231.26:4854
>>
>>I am not using modules, I have everything statically compiled into the 
>>kernel (yes including IRC and FTP support...)  Is there something else 
>>I'm missing?
>>
>>  Appearently anyone can DCC us but we cannot dcc out... any help would 
>>be appreciated ...
> 
> 
> The problem is that you've set your irc-client to use the ip the
> irc-server sees, not the real ip of your client and then
> ip_conntrack_irc refuses to cooperate.
> 
> Solution #1: change your client to use the real ip (172.16.0.5) and not
> the ip the irc-server sees.
> 
> Solution #2: apply the attached patch to a iptables source-tree and then
> apply the irc-natip.patch in the extra/ repository and then recompile
> your kernel. This patch makes ip_conntrack_irc allow both ip's.
> 
> 
> 
> ------------------------------------------------------------------------
> 
> diff -urN netfilter/userspace/patch-o-matic/extra.orig/irc-natip.patch netfilter/userspace/patch-o-matic/extra/irc-natip.patch
> --- netfilter/userspace/patch-o-matic/extra.orig/irc-natip.patch	Thu Jan  1 01:00:00 1970
> +++ netfilter/userspace/patch-o-matic/extra/irc-natip.patch	Fri Apr  5 16:02:50 2002
> @@ -0,0 +1,20 @@
> +--- linux-2.4.19-pre3-NAPI/net/ipv4/netfilter/ip_conntrack_irc.c.orig	Fri Apr  5 00:50:43 2002
> ++++ linux-2.4.19-pre3-NAPI/net/ipv4/netfilter/ip_conntrack_irc.c	Fri Apr  5 15:54:20 2002
> +@@ -183,7 +183,7 @@
> + 			DEBUGP("DCC bound ip/port: %u.%u.%u.%u:%u\n",
> + 				HIPQUAD(dcc_ip), dcc_port);
> + 
> +-			if (ct->tuplehash[dir].tuple.src.ip != htonl(dcc_ip)) {
> ++			if (ct->tuplehash[dir].tuple.src.ip != htonl(dcc_ip) && ct->tuplehash[!dir].tuple.dst.ip != htonl(dcc_ip)) {
> + 				if (net_ratelimit())
> + 					printk(KERN_WARNING
> + 						"Forged DCC command from "
> +@@ -209,7 +209,7 @@
> + 
> + 			exp->tuple = ((struct ip_conntrack_tuple)
> + 				{ { 0, { 0 } },
> +-				  { htonl(dcc_ip), { htons(dcc_port) },
> ++				  { ct->tuplehash[dir].tuple.src.ip, { htons(dcc_port) },
> + 				    IPPROTO_TCP }});
> + 			exp->mask = ((struct ip_conntrack_tuple)
> + 				{ { 0, { 0 } },
> diff -urN netfilter/userspace/patch-o-matic/extra.orig/irc-natip.patch.help netfilter/userspace/patch-o-matic/extra/irc-natip.patch.help
> --- netfilter/userspace/patch-o-matic/extra.orig/irc-natip.patch.help	Thu Jan  1 01:00:00 1970
> +++ netfilter/userspace/patch-o-matic/extra/irc-natip.patch.help	Fri Apr  5 16:02:50 2002
> @@ -0,0 +1,6 @@
> +Author: Martin Josefsson <gandalf@wlug.westbo.se>
> +Status: Works for me
> +
> +This patch adds support for using the external ip in DCC requests.
> +ip_conntrack_irc now supports two ip's, the ip of the client and
> +the external ip after NAT.




