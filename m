From: =?gb2312?B?Qm9yYSDeYWhpbg==?= <borasahin@netone.com.tr>
Subject: Re[2]: Could someone tell me the rules of port translation in SNAT ?
Date: Sun, 11 Jan 2004 15:38:25 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <306391720.20040111153825@netone.com.tr>
References: <BAY10-F966xG0eYfJcy0003d929@hotmail.com>
Reply-To: =?gb2312?B?Qm9yYSDeYWhpbg==?= <borasahin@netone.com.tr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY10-F966xG0eYfJcy0003d929@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi ding,

Thursday, January 8, 2004, 3:55:56 AM, you wrote:

dd> I'm reading some source code for more details, bu i stopped at

dd>       return NF_HOOK(PF_INET, NF_IP_POST_ROUTING, skb, NULL, 
dd> dev,ip_finish_output2);

dd> in    ip_output.c::ip_finish_output()

dd> cause i don't know what part of code does POST_ROUTING work and SNAT 
dd> implementation.

I think you are wrong place both in the point of list and code. NF_HOOK is macro which is defined in
include/linux/netfilter.h like this:

#define NF_HOOK(pf, hook, skb, indev, outdev, okfn)                     \
(list_empty(&nf_hooks[(pf)][(hook)])                                    \
 ? (okfn)(skb)                                                          \
 : nf_hook_slow((pf), (hook), (skb), (indev), (outdev), (okfn)))

Simply, It calls all registered functions in NF_IP_POST_ROUTING per protocol, in this case IPv4, and
then gives control to ip_finish_output2(). So If you are interested in SNAT, you should take a look
at net/ipv4/netfilter/ip_nat_standalone.c:

/* After packet filtering, change source */
static struct nf_hook_ops ip_nat_out_ops
= { { NULL, NULL }, ip_nat_out, PF_INET, NF_IP_POST_ROUTING, NF_IP_PRI_NAT_SRC};
...
nf_register_hook(&ip_nat_out_ops);
...

then above in the same file:
static unsigned int ip_nat_out()
{
    ...
    return ip_nat_fn(hooknum, pskb, in, out, okfn);
}

That is, you should track down this path...
-- 
Bora Sahin
borasahin.port5.com


