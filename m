From: Gregory Nietsky <gregory@distrotech.co.za>
Subject: libnetfilter_conntrack userspace nat via NFQUEUE
Date: Sun, 03 Jun 2012 23:05:19 +0200
Message-ID: <4FCBD18F.2020607@distrotech.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org


Greetings

I have been working on userspace nat via NFQUEUE i have it working but 
something does not make
sense to me.

the code below is to build the conntrack and attach the nat attributes.

i cannot get it working unless i use the following

nfct_set_attr_u8(ct, ATTR_TCP_STATE, TCP_CONNTRACK_ESTABLISHED);

the documentation and examples suggest this is not correct however this way
it works no other options function.

as the documentation is not extensive perhaps someone will be able to 
comment on this.

am i correct to only use this for TCP connections.

the code for this is available @ 
http://pbx.distrotech.co.za/svn/taploop/trunk/ in the framework directory.

Regards

Greg

extern struct nf_conntrack *nf_ctrack_buildct(uint8_t *pkt) {
         struct nf_conntrack *ct;
         struct iphdr *ip = (struct iphdr*)pkt;
         union l4hdr *l4 = (union l4hdr*)(pkt + (ip->ihl * 4));

         if (!(ct = nfct_new())) {
                 return (NULL);
         };

         /*Build tuple*/
         nfct_set_attr_u8(ct, ATTR_L3PROTO, PF_INET);
         nfct_set_attr_u32(ct, ATTR_IPV4_SRC, ip->saddr);
         nfct_set_attr_u32(ct, ATTR_IPV4_DST, ip->daddr);
         nfct_set_attr_u8(ct, ATTR_L4PROTO, ip->protocol);
         switch(ip->protocol) {
                 case IPPROTO_TCP:
                         nfct_set_attr_u16(ct, ATTR_PORT_SRC, 
l4->tcp.source);
                         nfct_set_attr_u16(ct, ATTR_PORT_DST, l4->tcp.dest);
                         break;
                 case IPPROTO_UDP:
                         nfct_set_attr_u16(ct, ATTR_PORT_SRC, 
l4->udp.source);
                         nfct_set_attr_u16(ct, ATTR_PORT_DST, l4->udp.dest);
                         break;
                 case IPPROTO_ICMP:
                         nfct_set_attr_u8(ct, ATTR_ICMP_TYPE, 
l4->icmp.type);
                         nfct_set_attr_u8(ct, ATTR_ICMP_CODE, 
l4->icmp.code);
                         nfct_set_attr_u16(ct, ATTR_ICMP_ID, 
l4->icmp.un.echo.id);
                         /* no break */
                 default:
                         break;
         };

         return (ct);
}

extern uint8_t nf_ctrack_nat(uint8_t *pkt, uint32_t addr, uint16_t port, 
uint8_t dnat) {
         struct iphdr *ip = (struct iphdr*)pkt;
         struct nf_conntrack *ct;
         uint8_t unref = 0;
         uint8_t ret = 0;

         if (!ctrack) {
                 if (nf_ctrack_init()) {
                         return (-1);
                 }
                 unref = 1;
         }

         ct = nf_ctrack_buildct(pkt);
         nfct_setobjopt(ct, NFCT_SOPT_SETUP_REPLY);

         nfct_set_attr_u32(ct, ATTR_TIMEOUT, 120);
         nfct_set_attr_u32(ct, (dnat) ? ATTR_DNAT_IPV4 : ATTR_SNAT_IPV4, 
addr);

         switch(ip->protocol) {
                 case IPPROTO_TCP:
                         nfct_set_attr_u8(ct, ATTR_TCP_STATE, 
TCP_CONNTRACK_ESTABLISHED);
                         /* no break */
                 case IPPROTO_UDP:
                         if (port) {
                                 nfct_set_attr_u16(ct, (dnat) ? 
ATTR_DNAT_PORT : ATTR_SNAT_PORT, port);
                         }
                         break;
         }

         objlock(ctrack);
         if (nfct_query(ctrack->nfct, NFCT_Q_CREATE_UPDATE, ct) < 0) {
                 ret = -1;
         }
         objunlock(ctrack);
         nfct_destroy(ct);

         if (unref) {
                 nf_ctrack_close();
         }

         return (ret);
}

--
This message has been scanned for viruses and
dangerous content by Distrotech Solutions, 
it is believed to be clean.

http://www.distrotech.co.za

