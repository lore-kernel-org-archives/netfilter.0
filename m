From: Steven Ayre <steveayre@gmail.com>
Subject: netfilter_conntrack question - getting invalid argument
Date: Fri, 24 Sep 2010 11:26:53 +0100
Message-ID: <AANLkTin3tMzWB9G_Rt5WHEC5vdVFBDJfcj9eC4wqPzxZ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=HLIPDnGPgiZlTi0XqbeT5+R1FyzCcTs2JMJhnD3tMoM=;
        b=o0nz/c8Hleo8DLDN0nhjSi1OgfBaOkl1ncavXLWKulffHxAZbhV9c2hA4fLSWAgUtO
         S8JFZMdQ/ycEKEhfpcPJiZf3Y0JsRQcX9wIwnUF/KVVTi820BqUAu0Icv2bl3r88scsm
         3pBx2IOWkgv9Bwu4jTGaswJkRgiqGMXgLzo9Q=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm trying to perform DNAT from within my userspace program to a dynamic host.

I have in nat PREROUTING a NFQUEUE rule that gives the packet to my
program. I am trying to setup a conntrack rule at this time before
accepting the packet. The NFQUEUE part works just fine. However I am
having trouble adding the conntrack entry.

This is the code I currently have:

                /* Add a new conntrack entry */
                if (!(ct = nfct_new())) {
                        perror("nfct_new");
                        return -1;
                }
                nfct_set_attr_u8(ct, ATTR_ORIG_L3PROTO, AF_INET);
                nfct_set_attr_u8(ct, ATTR_ORIG_L4PROTO, IPPROTO_TCP);
                nfct_set_attr_u32(ct, ATTR_ORIG_IPV4_SRC, ip->saddr);
                nfct_set_attr_u32(ct, ATTR_ORIG_IPV4_DST, ip->daddr);
                nfct_set_attr_u16(ct, ATTR_ORIG_PORT_SRC, tcp->source);
                nfct_set_attr_u16(ct, ATTR_ORIG_PORT_SRC, tcp->dest);
                nfct_setobjopt(ct, NFCT_SOPT_SETUP_REPLY);
                nfct_set_attr_u32(ct, ATTR_DNAT_IPV4, new_daddr);
                nfct_set_attr_u16(ct, ATTR_DNAT_PORT, new_dport);
                //nfct_set_attr_u32(ct, ATTR_TIMEOUT, timeout);
                if (nfct_query(globals.cth, NFCT_Q_CREATE, ct) < 0) {
                        perror("nfct_query");
                        return -1;
                }
                nfct_destroy(ct);

ip is a struct iphdr* pointing to the correct location in the payload
from nfqueue
tcp is a struct tcphdr* pointing to the correct location in the
payload from nfqueue
new_daddr is uint32_t from inet_pton()
new_dport is uint16_t from htons()
Therefore all IPs and ports are already in network byte order.

When the above code runs I get the following:
nfct_query: Invalid argument

Does anyone know what I'm doing wrong?

Also, do I need to manually mangle the first packet to perform the
DNAT or will netfilter do this for me after I accept the packet due to
the conntrack entry?

-Steve
