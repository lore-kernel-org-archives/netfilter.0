From: Subhadeep Ghosh <subhadeep.ghosh@uniken.com>
Subject: Reg: TCP Packet Modification
Date: Thu, 7 May 2009 10:26:43 +0530
Message-ID: <3a8740fd0905062156l3fff40b9u2001ff9d4b4b44db@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I am trying to write a xtables hook which would append a 32bit packet
signature in a TCP packet. To achieve this, what I do is...

1. I copy the SKB into a new SKB with the additional tail-room using
skb_copy_expand.
2. I calculate the signature of the packet.
3. Update the 'tot_len' field in the IP header.
4. Calculate the checksum of the IP header using ip_send_check.
5. Append the signature to the packet and update the checksum of the
sk_buff using skb_add_data.
6. Attach the Netfilter connection tracking details of the old sk_buff
to the new sk_buff
7. Call the dst->output of the new sk_buff.
8. Drop the old sk_buff.

I have placed this target hook in the 'nat' table with hook number as
NF_INET_LOCAL_OUT.
The problem is that the hook receives the packet, modifies it
successfully but after sending the packet does not reach its
destination. I have tried out many possibilities but none of them
worked. It would be great if someone could point out what I am doing
wrong. Following is the code snippet...

[struct sk_buff* _pOldSKB]
[const struct xt_target_param* _pParam]

struct iphdr* _pIPHeader = ip_hdr(_pOldSKB);

if(_pParam && _pIPHeader &&
   (_pParam->hooknum == NF_INET_LOCAL_OUT) &&
   (_pIPHeader->protocol == IPPROTO_TCP))
{
    struct sk_buff* _pNewSKB = skb_copy_expand(_pOldSKB, 0,
sizeof(unsigned int), GFP_ATOMIC);

    if(_pNewSKB)
    {
        struct iphdr*     _pNewIPHeader = ip_hdr(_pNewSKB);
        unsigned char* _pStart              = (unsigned
char*)(_pNewSKB->data + _pNewIPHeader->ihl + sizeof(struct tcphdr));
        unsigned int      _nSignature      =
calculate_signature((const unsigned char*)_pStart, (unsigned
int)(_pNewSKB->tail - _pStart));

        _pNewIPHeader->tot_len = htons(ntohs(_pNewIPHeader->tot_len) +
sizeof(unsigned int));
        ip_send_check(_pNewIPHeader);
        skb_add_data(_pNewSKB, (char*)&_nSignature, sizeof(unsigned int));
        nf_ct_attach(_pNewSKB, _pOldSKB);
        _pNewSKB->dst->output(_pNewSKB);
        return NF_DROP;
    }
}

Thank you and regards,
Subhadeep Ghosh
