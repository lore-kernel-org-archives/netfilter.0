From: "OpenSource Dev" <dev.opensource@gmail.com>
Subject: Re: QUEUE Target
Date: Fri, 7 Nov 2008 17:02:34 -0600
Message-ID: <c813aacf0811071502q7f334804m136798520a1444c@mail.gmail.com>
References: <c813aacf0811071324u4fa41d87sec544655b94220fd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=7QbHFk/bhNSfe+MGdrspQURWyDoI253GJ/SzWWPUyGk=;
        b=ZR1hp5DbKVHBE4POYkfnAMzl3fQUqgDmpO86FtXqzYYtW5+585ns9046ggbtv2JiNd
         qUVzIUyrPB7rvYkErPJD4oIXJWzlAC0C/vYSduZV6zzhkL9xMhy/3CauCzhUJRgAPut+
         DiV2obkwh/OIfwJbdk+ZISdzMoQukH/8mJFmo=
In-Reply-To: <c813aacf0811071324u4fa41d87sec544655b94220fd@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>

oops my bad..I think I was trying something that is not possible. (to
get the allocated size of a pointer).
Actually data was copied to the pointer as I wanted ..sweet!

thanks,
Bikrant


On Fri, Nov 7, 2008 at 3:24 PM, OpenSource Dev <dev.opensource@gmail.com> wrote:
> I am trying to copy IP packet to user-land application using QUEUE
> target in netfilter.
>
> So far I am able to read packet headers but I am not sure if I am
> getting the payload.
>
> nfq_get_payload() returns correct size of the packet but I don't find
> anything in data. I used both strlen and sizeof to check the size of
> data but it always returns 1 or is there better way to check.
>
> I am running Ubuntu 8.10 server on x86.
>
>  Here is what I have done so far:
>
> main():
>   nfq_bind_pf(h, AF_INET);
>   qh = nfq_create_queue(h,  0, &cb, NULL);
>   nh = nfq_nfnlh(h);
>   fd = nfnl_fd(nh);
>   nfq_set_mode(qh, NFQNL_COPY_PACKET, 0xffff)
>
>
> static int cb(struct nfq_q_handle *qh, struct nfgenmsg *nfmsg,
>              struct nfq_data *nfa, void *data)
> {
>        char *payloadData;
>        int ret;
>
>        ret = nfq_get_payload(nfa, &payloadData);
>        printf("Len %d of data is: %d \n", ret, strlen(payloadData));
>
>        u_int32_t id = print_pkt(nfa);
>
>        return nfq_set_verdict(qh, id, NF_ACCEPT, 0, NULL);
> }
>
> Can anyone please point me what I am missing here ?
>
> Thanks,
> Bikrant
>
