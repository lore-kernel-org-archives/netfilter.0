From: Muhammad Faisal <faisalusuf@gmail.com>
Subject: Re: Year missing from ulogd2 timestamp
Date: Wed, 15 Mar 2017 22:51:36 +0500
Message-ID: <CAAzdDtNokDLm0d6bT1Uxaw8NzoqnwbWg9huDd=ax1GWSWNwh7g@mail.gmail.com>
References: <CAAzdDtMV=OaFftNs8A_AF9-TXCvn-pxmVDqdDHCBD_2HTu3t3g@mail.gmail.com>
 <CACmTqUmm4y+6_gQJ8t4r+ZPDmJ_z7XRRm=jX9QGAAh8cCQD4cg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=lDhAjV9In52UH+tNp2X/nMc/8k2TjuQxLWhr7Hz0zwU=;
        b=Nx+i/AXorZOBTPizC+Z1cUV3ZHiaHaMc15eyPhmHLy3QMFY6AfFj4HtvyK58y0ITxK
         koaQOT6ZL6Zv4Q8++8QUdJKy8EvavjWzeslEVMN9Th89//BrvAIXr29Ng0Sg8bIeaEeK
         vvWYTMWBKZGN6RfQJVGTyss7cyP7GDX6Os1QHL6uh9YPIt9z9ZCSQ1phCc/UOZDFY4/i
         AMFtqlgWTdZZii+6e+yMh8tfr1wvH0qBWb7ciClPWaWET5Z22EQDBxFHGQL58ghfE995
         5DKQYTkY/5Z7d7lY3uvDRzJludcfBEEaHFJWFFN1jAaCWGt2O21hdEHjzcfU1B8Y8LWL
         PYYA==
In-Reply-To: <CACmTqUmm4y+6_gQJ8t4r+ZPDmJ_z7XRRm=jX9QGAAh8cCQD4cg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: V Kurien <kurien.varugis@gmail.com>
Cc: netfilter@vger.kernel.org

Hi Kurien,
Please see the nf_conntrack_timestamp giving error is it the correct command?

[root@wc01 ~]# /bin/echo "1"> /proc/sys/net/netfilter/nf_conntrack_timestamp
-bash: /proc/sys/net/netfilter/nf_conntrack_timestamp: No such file or directory
[root@wc01 ~]# cat /proc/sys
sys/           sysrq-trigger  sysvipc/
[root@wc01 ~]# cat /proc/sys/net/netfilter/nf_
nf_conntrack_acct
nf_conntrack_buckets
nf_conntrack_checksum
nf_conntrack_count
nf_conntrack_events
nf_conntrack_events_retry_timeout
nf_conntrack_expect_max
nf_conntrack_generic_timeout
nf_conntrack_icmp_timeout
nf_conntrack_log_invalid
nf_conntrack_max
nf_conntrack_tcp_be_liberal
nf_conntrack_tcp_loose
nf_conntrack_tcp_max_retrans
nf_conntrack_tcp_timeout_close
nf_conntrack_tcp_timeout_close_wait
nf_conntrack_tcp_timeout_established
nf_conntrack_tcp_timeout_fin_wait
nf_conntrack_tcp_timeout_last_ack
nf_conntrack_tcp_timeout_max_retrans
nf_conntrack_tcp_timeout_syn_recv
nf_conntrack_tcp_timeout_syn_sent
nf_conntrack_tcp_timeout_time_wait
nf_conntrack_tcp_timeout_unacknowledged
nf_conntrack_udp_timeout
nf_conntrack_udp_timeout_stream
nf_log/
Best Regards,
Muhammad Faisal

Disclaimer:
Information in this e-mail and attachments is confidential and may be
legally privileged. Only intended recipients are authorized to use it.
If you have received this message in error, please delete it and all
copies of the message from your system and notify the sender
immediately by return e-mail. I'm neither liable for incomplete
transmission of the information in this communication nor for damage
caused by any virus transmitted through this e-mail.



On Wed, Mar 15, 2017 at 12:04 AM, V Kurien <kurien.varugis@gmail.com> wrote:
> Don't you have to enable timestamp and byte logging support?
> /bin/echo "1" > /proc/sys/net/netfilter/nf_conntrack_acct
> /bin/echo "1"> /proc/sys/net/netfilter/nf_conntrack_timestamp
>
> On Tue, Mar 14, 2017 at 11:55 AM, Muhammad Faisal <faisalusuf@gmail.com> wrote:
>> Hello,
>> I would like to understand is this a feature or a possible bug that
>> Year info is missing from the ulogd2 output.
>>
>>
>> Mar 11 15:55:59 wc01 ulogd[14289]: [NEW] ORIG: SRC=5.55.22.172
>> DST=192.168.1.3 PROTO=TCP SPT=2083 DPT=5158 PKTS=0 BYTES=0 , REPLY:
>> SRC=192.168.1.3 DST=5.55.22.172 PROTO=TCP SPT=5158 DPT=2083 PKTS=0
>> BYTES=0
>>
>>
>> Best Regards,
>> Muhammad Faisal
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
