From: Alex Bligh <alex@alex.org.uk>
Subject: libnfcontrack weirdness
Date: Mon, 02 Aug 2010 17:20:10 +0100
Message-ID: <59381F8FA203F4555FD43BB0@Ximines.local>
Reply-To: Alex Bligh <alex@alex.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Alex Bligh <alex@alex.org.uk>

I may be doing something stupid here, but I can't seem to get information
on an existing connection through libnfconntrack.

Code extract below. When passed a 4-tuple describing an existing connection,
it prints "Found connection", when passed other stuff, it does not. So
that much is working.

However, no ATTR_ stuff relating to the connection is printed out
except for ATTR_ORIG_PORT_* which are synonyms of what has been
set with nfct_set_attr.

I am having difficulty finding documentation for this, but surely
there must be a way to get the information out from the connection
itself.

-- 
Alex Bligh



/* Get the prenat source port associated with a connection */
u_int16_t getprenatport(struct in_addr * local_addr, struct in_addr * 
remote_addr, int local_port, int remote_port)
{
    struct nfct_handle *h;
    struct nf_conntrack *ct;
    u_int16_t port =0;

    if (NULL == (ct = nfct_new()))
	return 0;

    nfct_set_attr_u8(ct, ATTR_L3PROTO, AF_INET);
    nfct_set_attr_u32(ct, ATTR_IPV4_SRC, *((u_int32_t *)remote_addr));
    nfct_set_attr_u32(ct, ATTR_IPV4_DST, *((u_int32_t *)local_addr));

    nfct_set_attr_u8(ct, ATTR_L4PROTO, IPPROTO_TCP);
    nfct_set_attr_u16(ct, ATTR_PORT_SRC, htons(remote_port));
    nfct_set_attr_u16(ct, ATTR_PORT_DST, htons(local_port));


    h = nfct_open(CONNTRACK, 0);
    if (!h) {
      return 0;
    }

    if (nfct_query(h, NFCT_Q_GET, ct)<0)
      {
        nfct_close(h);
        return 0;
      }

    dolog ("Found connection "
           "ATTR_ORIG_COUNTER_PACKETS=%d "
           "ATTR_REPL_COUNTER_PACKETS=%d "
           "ATTR_REPL_PORT_SRC=%d "
           "ATTR_REPL_PORT_DST=%d "
           "ATTR_ORIG_PORT_SRC=%d "
           "ATTR_ORIG_PORT_DST=%d "
           "ATTR_MASTER_PORT_SRC=%d "
           "ATTR_MASTER_PORT_DST=%d",
           ntohs(nfct_get_attr_u32(ct, ATTR_ORIG_COUNTER_PACKETS)),
           ntohs(nfct_get_attr_u32(ct, ATTR_REPL_COUNTER_PACKETS)),
           ntohs(nfct_get_attr_u16(ct, ATTR_REPL_PORT_SRC)),
           ntohs(nfct_get_attr_u16(ct, ATTR_REPL_PORT_DST)),
           ntohs(nfct_get_attr_u16(ct, ATTR_ORIG_PORT_SRC)),
           ntohs(nfct_get_attr_u16(ct, ATTR_ORIG_PORT_DST)),
           ntohs(nfct_get_attr_u16(ct, ATTR_MASTER_PORT_SRC)),
           ntohs(nfct_get_attr_u16(ct, ATTR_MASTER_PORT_DST))
           );

    port =  ntohs(nfct_get_attr_u16(ct, ATTR_ORIG_PORT_DST));
    nfct_close(h);
    return 0;

}

