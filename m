From: V Kurien <kurien.varugis@gmail.com>
Subject: Re: Year missing from ulogd2 timestamp
Date: Wed, 15 Mar 2017 11:21:15 -0700
Message-ID: <CACmTqU=m7WQYtULG-WRhScnr90HCEr0FBGOcLpFgQFX8K2CQgQ@mail.gmail.com>
References: <CAAzdDtMV=OaFftNs8A_AF9-TXCvn-pxmVDqdDHCBD_2HTu3t3g@mail.gmail.com>
 <CACmTqUmm4y+6_gQJ8t4r+ZPDmJ_z7XRRm=jX9QGAAh8cCQD4cg@mail.gmail.com> <CAAzdDtNokDLm0d6bT1Uxaw8NzoqnwbWg9huDd=ax1GWSWNwh7g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=1a/0LJUR7TPY3ttrvuqZxcqupQBYZ3/PyyHkOJOop9w=;
        b=lXuLQYk1JDr1AFdnV/3Tjwq73Or10x3IoKWKPIi1BtOVQVYnI0JfVkGsygk7/FdWJe
         0XcBLG0q7lSKFjtPINCZghnvca2AgZ1JB8+n8cTcKyjza7CiRqW2MBiErrU2AdSmJcAW
         kR4dOmnw3VKEaqcG76UfiQLCHS8VhRuQTSaQKMQrgQW5nTF3wInLdeczTB1/DM/k1Sep
         LuR39cYUeSHPbMUlFzE8uFZ0cE5Qi05IXohbXMS3nJVmYQzxeidR5wqYAsVCpjW7ZDCL
         J7FeGA9kFBVHO8rHvKOLwisrXd6FpI3x05hs5+kFQxIpLK/FAwurKFObUwtGKd0aiiNb
         YL3Q==
In-Reply-To: <CAAzdDtNokDLm0d6bT1Uxaw8NzoqnwbWg9huDd=ax1GWSWNwh7g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Muhammad Faisal <faisalusuf@gmail.com>
Cc: netfilter@vger.kernel.org

Hmm. Odd. What OS are you on? I am on U16.04. How important are the
timestamps to you? Note that the log collector can add timestamps as
well.

Did you modprobe appropriately?
modprobe nf_conntrack_netlink
modprobe nf_conntrack_ipv4

On Wed, Mar 15, 2017 at 10:51 AM, Muhammad Faisal <faisalusuf@gmail.com> wrote:
> Hi Kurien,
> Please see the nf_conntrack_timestamp giving error is it the correct command?
>
> [root@wc01 ~]# /bin/echo "1"> /proc/sys/net/netfilter/nf_conntrack_timestamp
> -bash: /proc/sys/net/netfilter/nf_conntrack_timestamp: No such file or directory
> [root@wc01 ~]# cat /proc/sys
> sys/           sysrq-trigger  sysvipc/
> [root@wc01 ~]# cat /proc/sys/net/netfilter/nf_
> nf_conntrack_acct
> nf_conntrack_buckets
> nf_conntrack_checksum
> nf_conntrack_count
> nf_conntrack_events
> nf_conntrack_events_retry_timeout
> nf_conntrack_expect_max
> nf_conntrack_generic_timeout
> nf_conntrack_icmp_timeout
> nf_conntrack_log_invalid
> nf_conntrack_max
> nf_conntrack_tcp_be_liberal
> nf_conntrack_tcp_loose
> nf_conntrack_tcp_max_retrans
> nf_conntrack_tcp_timeout_close
> nf_conntrack_tcp_timeout_close_wait
> nf_conntrack_tcp_timeout_established
> nf_conntrack_tcp_timeout_fin_wait
> nf_conntrack_tcp_timeout_last_ack
> nf_conntrack_tcp_timeout_max_retrans
> nf_conntrack_tcp_timeout_syn_recv
> nf_conntrack_tcp_timeout_syn_sent
> nf_conntrack_tcp_timeout_time_wait
> nf_conntrack_tcp_timeout_unacknowledged
> nf_conntrack_udp_timeout
> nf_conntrack_udp_timeout_stream
> nf_log/
> Best Regards,
> Muhammad Faisal
>
> Disclaimer:
> Information in this e-mail and attachments is confidential and may be
> legally privileged. Only intended recipients are authorized to use it.
> If you have received this message in error, please delete it and all
> copies of the message from your system and notify the sender
> immediately by return e-mail. I'm neither liable for incomplete
> transmission of the information in this communication nor for damage
> caused by any virus transmitted through this e-mail.
>
>
>
> On Wed, Mar 15, 2017 at 12:04 AM, V Kurien <kurien.varugis@gmail.com> wrote:
>> Don't you have to enable timestamp and byte logging support?
>> /bin/echo "1" > /proc/sys/net/netfilter/nf_conntrack_acct
>> /bin/echo "1"> /proc/sys/net/netfilter/nf_conntrack_timestamp
>>
>> On Tue, Mar 14, 2017 at 11:55 AM, Muhammad Faisal <faisalusuf@gmail.com> wrote:
>>> Hello,
>>> I would like to understand is this a feature or a possible bug that
>>> Year info is missing from the ulogd2 output.
>>>
>>>
>>> Mar 11 15:55:59 wc01 ulogd[14289]: [NEW] ORIG: SRC=5.55.22.172
>>> DST=192.168.1.3 PROTO=TCP SPT=2083 DPT=5158 PKTS=0 BYTES=0 , REPLY:
>>> SRC=192.168.1.3 DST=5.55.22.172 PROTO=TCP SPT=5158 DPT=2083 PKTS=0
>>> BYTES=0
>>>
>>>
>>> Best Regards,
>>> Muhammad Faisal
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
