From: "OpenSource Dev" <dev.opensource@gmail.com>
Subject: QUEUE Target
Date: Fri, 7 Nov 2008 15:24:45 -0600
Message-ID: <c813aacf0811071324u4fa41d87sec544655b94220fd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=lXvme3foWn8v87Q267PKK2TQtk1zLKJ1gdb6ccBn06k=;
        b=cxkDLBMdzmTSf3BF+SgrGjBtZIN8SjQGRf7Jxr4vf+AU6tJOzu9OvtDo/Q8H6qXLPV
         TK+gAFheHohzeBh+MK4g6ojWdS/JY4UXccnfIqr4KZLTZqaEkycSy9lVNyRwNA85TVQv
         xKzE0w4yWMh5PynSisIHugs7kAHSV7ZKU0S2I=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>

I am trying to copy IP packet to user-land application using QUEUE
target in netfilter.

So far I am able to read packet headers but I am not sure if I am
getting the payload.

nfq_get_payload() returns correct size of the packet but I don't find
anything in data. I used both strlen and sizeof to check the size of
data but it always returns 1 or is there better way to check.

I am running Ubuntu 8.10 server on x86.

 Here is what I have done so far:

main():
   nfq_bind_pf(h, AF_INET);
   qh = nfq_create_queue(h,  0, &cb, NULL);
   nh = nfq_nfnlh(h);
   fd = nfnl_fd(nh);
   nfq_set_mode(qh, NFQNL_COPY_PACKET, 0xffff)


static int cb(struct nfq_q_handle *qh, struct nfgenmsg *nfmsg,
              struct nfq_data *nfa, void *data)
{
        char *payloadData;
        int ret;

        ret = nfq_get_payload(nfa, &payloadData);
        printf("Len %d of data is: %d \n", ret, strlen(payloadData));

        u_int32_t id = print_pkt(nfa);

        return nfq_set_verdict(qh, id, NF_ACCEPT, 0, NULL);
}

Can anyone please point me what I am missing here ?

Thanks,
Bikrant
