From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nfct_query return code
Date: Fri, 22 Jun 2007 09:08:57 +0200
Message-ID: <467B7589.4090802@netfilter.org>
References: <20070621225343.mzl7x1joxx4w4s4g@webmail.microgate.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070621225343.mzl7x1joxx4w4s4g@webmail.microgate.fr>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: switcher <switcher@linuxwall.info>
Cc: netfilter@lists.netfilter.org

switcher wrote:
> Hi All,
> Just a little question about nfct_query used to check the state of a connection.
> What is it supposed to return ?
> I guess it's 0 if the packet is part of an active connection (tell me if I'm
> wrong) but what does a "-1" value mean ? An error or a packet seen for the
> first time ?
> 
> For information, my piece (truncated) of code :
> ct = nfct_new();
> nfct_set_attr_u8(ct, ATTR_ORIG_L3PROTO, AF_INET);
> nfct_set_attr_u32(ct, ATTR_ORIG_IPV4_SRC, iph->saddr);
> nfct_set_attr_u32(ct, ATTR_ORIG_IPV4_DST, iph->daddr);
> nfct_set_attr_u8(ct, ATTR_ORIG_L4PROTO, iph->protocol);
> nfct_set_attr_u16(ct, ATTR_ORIG_PORT_SRC, tcp->source);
> nfct_set_attr_u16(ct, ATTR_ORIG_PORT_DST, tcp->dest);
> cth = nfct_open(CONNTRACK, 0);
> nfct_callback_register(cth, NFCT_T_ALL, cb, NULL)
> conn_state = nfct_query(cth, NFCT_Q_GET, ct);
> nfct_close(cth);
> return conn_state;

No, you get it in the callback that is invoked if it finds such object 
that you're requesting, otherwise nfct_query returns -1 and errno is set 
to ENOENT:

static int cb(struct nf_conntrack *ct, ...)
{
	if (nfct_attr_is_set(ATTR_TCP_STATE, ct))
		conn_state = nfct_get_attr_u32(ct, ATTR_TCP_STATE);

	return NFCT_CB_CONTINUE;
}

-- 
The dawn of the fourth age of Linux firewalling is coming; a time of 
great struggle and heroic deeds -- J.Kadlecsik got inspired by J.Morris

