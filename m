From: Robert Soule <souler@usi.ch>
Subject: Adding an MPLS label in netfilter_queue
Date: Tue, 3 Jun 2014 15:32:50 +0200
Message-ID: <CAFwK7-fK4y2q+NKsQP7UgEhPQLbctvmYgRgE4M5WiJX70aDyBA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:date:message-id:subject:from:to:content-type;
        bh=dAeEQmFntWOiV06N/C9Wr+B/CNkxN36NlQoXFSspiOI=;
        b=xMLp2JxuQXFa7riLCLOgJHiLFj4LJrwe/jvDTGYHW4Dnbi78V6x3PlueO4JKpZtygy
         OKXjBiN9mknH8s3em5b0b9aMrLc1TqmzZXqTwVaXPQqqSC6W9rrw0KsonJDvZMrMEUde
         Lyjy7GUfVnNqH4hT3+137kI1+hK8WdCPz7IHSTsHXNTtA4Vruias9uOXSmea8oAzy/fI
         uYN0LQrqaDPbZzkeRo52IelEd8iYQ5dIAV/2UDTcREfyRPz01gwhqJBxm200TxmNljm3
         vWz0u1wiKONbmMUio3XNnGmve29Z0b2pckqs5Y6QU+c7x4Nx8lHlH/HTnAFaflKkTeMk
         k3tw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I am working on a program using netfilter_queue to add an MPLS label
to all outgoing TCP packets. The code for my callback function is
below. I think I am modifying the packet contents correctly, but it
doesn't look like my change to the hw_protocol field works:

  ph->hw_protocol = htons(ETH_P_MPLS_UC);

as the outgoing packets have a value of 0x0800 instead of the expected
0x8847 in the ether type. Can anyone help me out? How can I modify the
ether type in netfilter_queue?

thank you,
Robert

define MPLS_LABEL_SIZE 4 // bytes
typedef struct mpls_label mpls_label;
struct mpls_label {
    unsigned char label[3];
    unsigned char ttl[1];
};


static int add_mpls(struct nfq_q_handle *qh, struct nfgenmsg *nfmsg,
              struct nfq_data *nfa, void *data)

{
    struct nfqnl_msg_packet_hdr *ph;
    int payload_len;
    unsigned char *payloadData;
    int mpls_payload_len;
    unsigned char *mpls_payloadData;
    struct iphdr *ipHeader;
    struct udphdr *udpHeader;
    int ret;
    mpls_label * label;
    u_int32_t * label_ptr;

    ph = nfq_get_msg_packet_hdr(nfa);
    u_int32_t id = ntohl(ph->packet_id);
    payload_len = nfq_get_payload(nfa, &payloadData);
    ipHeader = (struct iphdr *)payloadData;

    if (ipHeader->protocol == IPPROTO_TCP) {

        // Change the header to MPLS
        ph->hw_protocol = htons(ETH_P_MPLS_UC);

        // allocate the new space for the mpls label
        mpls_payloadData =
            (unsigned char*)malloc(payload_len + MPLS_LABEL_SIZE);
        mpls_payload_len = payload_len + MPLS_LABEL_SIZE;

        // set the values in the label
        label_ptr = (u_int32_t *)mpls_payloadData;
        label = (mpls_label *)mpls_payloadData;
        (*label_ptr) = (10 & 0xFFFFF) << 12;  // Value of 10 for label
        label->ttl[0] = 3; // ttl of 3

        // copy the ip header and payload
        memcpy(mpls_payloadData + MPLS_LABEL_SIZE, payloadData, payload_len);

        // pointer to the new ipHeader
        ipHeader = (struct iphdr *)(mpls_payloadData + MPLS_LABEL_SIZE);

        // update the checksum
        compute_ip_checksum(ipHeader);

        ret = nfq_set_verdict(qh, id, NF_ACCEPT, mpls_payload_len,
mpls_payloadData);
        free(mpls_payloadData);
        return ret;
    }


    return nfq_set_verdict(qh, id, NF_ACCEPT, payload_len, payloadData);

}
