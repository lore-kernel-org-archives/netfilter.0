From: "Gareth Williams" <gwilliams@ubicom.com>
Subject: Contrack hook sees each UDP packet as a new connection but proc/net/nf_conntrack shows correctly - what am I doing wrong?
Date: Fri, 16 Oct 2009 09:50:19 -0700
Message-ID: <CB2DD11991B27C4F99935E6229450D3204B4DC44@STORK.scenix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello all.

I register two hooks into conntrack as follows:

static struct nf_hook_ops ipv4_ops_post_routing[] __read_mostly = {
	{
		.hook           = post_routing_hook,
		.owner          = THIS_MODULE,
		.pf             = PF_INET,
		.hooknum        = NF_INET_POST_ROUTING,
		.priority       = NF_IP_PRI_NAT_SRC + 1,
	},
};

static struct nf_hook_ops ipv4_ops_local_in[] __read_mostly = {
	{
		.hook           = local_in_hook,
		.owner          = THIS_MODULE,
		.pf             = PF_INET,
		.hooknum        = NF_INET_LOCAL_IN,
		.priority       = NF_IP_PRI_NAT_SRC + 1,
	},
};

        result = nf_register_hooks(ipv4_ops_post_routing,
ARRAY_SIZE(ipv4_ops_post_routing));
	//...
        result = nf_register_hooks(ipv4_ops_local_in,
ARRAY_SIZE(ipv4_ops_local_in));
	//...

And check for new connections in the hooks as follows:

	if ((ctinfo % IP_CT_IS_REPLY) == IP_CT_NEW) {	
		//....
	}

I seem to be getting a new connection for every UDP packet through the
system.  TCP does not have this problem.  This is to monitor lan<->wan
connections in a NAT system.

Also when I cat nf_conntrack it correctly shows only one connection for
each port/addr src/dst arrangement so what am I doing wrong in my hook?

Cheers

Gareth

