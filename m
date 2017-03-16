From: Muhammad Faisal <faisalusuf@gmail.com>
Subject: Re: Year missing from ulogd2 timestamp
Date: Thu, 16 Mar 2017 23:29:08 +0500
Message-ID: <CAAzdDtPeiBdrBSQRRvTx72AK631LE++08GZ4s1x8WB22qyn=5w@mail.gmail.com>
References: <CAAzdDtMV=OaFftNs8A_AF9-TXCvn-pxmVDqdDHCBD_2HTu3t3g@mail.gmail.com>
 <CACmTqUmm4y+6_gQJ8t4r+ZPDmJ_z7XRRm=jX9QGAAh8cCQD4cg@mail.gmail.com>
 <CAAzdDtNokDLm0d6bT1Uxaw8NzoqnwbWg9huDd=ax1GWSWNwh7g@mail.gmail.com>
 <CACmTqU=m7WQYtULG-WRhScnr90HCEr0FBGOcLpFgQFX8K2CQgQ@mail.gmail.com>
 <CAAzdDtNZmBsZKQiJXPx0QCU=g5j3NQSd0M14+u8nX=c9+FEbiw@mail.gmail.com>
 <CAAzdDtOwZoFQPy44FJ9ppfjM=rt210Rbu4GbP9Lja80g7aVNCQ@mail.gmail.com> <CACmTqUmd4AfqDxR6xs0+qJGS_RXJ=HT9r-i7VoXg5sujZAgJPg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=RrJRv2oLIz8VyX1XhELNtKSLhNoEClCEK3yJ6AA0Y2E=;
        b=lJRxErWXZ7N3yNX62/IHjRcpd3MHF8jsI/QYs0lKzboHyogzTqsbZzrwfrA4/H0U0A
         mBnO1nhTB/E4mP9GKaij3utFL2pbqaUZWKwdLHsOMGRmGDCQ2BoHVsdrYqDjeVyQCH+b
         T1vl5jkRTgZrfmp8i6mPHjSjGD9pn+DHVmMacOs0BHTbErHSVbZoisIHnXIl/NPcvUEp
         aRsEWTVHAvL1kC1hIWQmIRTro5ulLGglxTwTofhCJMP1mUFK6RsM8U/TaiqyUDo54Dhe
         xyVrdn8f/5HdzKIk0wwbt+ACeQq9MhkFIbuLkrkBHUUGYcxJ+fDAgytdjUvOqziyiQ89
         yrbg==
In-Reply-To: <CACmTqUmd4AfqDxR6xs0+qJGS_RXJ=HT9r-i7VoXg5sujZAgJPg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: V Kurien <kurien.varugis@gmail.com>
Cc: netfilter@vger.kernel.org

Hi Kurien,
Im using rsyslogd to print messages the log i have shared is from syslog.
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



On Thu, Mar 16, 2017 at 11:22 PM, V Kurien <kurien.varugis@gmail.com> wrote:
> Which printer are you using? I see timestamps using both gprint and
> syslog on my system. The output snippet I sent was a syslog message.
>
> And did the procfs parameters show up post kernel upgrade?
>
> On Thu, Mar 16, 2017 at 1:00 AM, Muhammad Faisal <faisalusuf@gmail.com> wrote:
>> The kernel upgraded to 3.10, timestamp was required a newer kernel.
>> But still no timestamps in the logs:
>>
>> Mar 16 13:58:11 wc01 ulogd[4022]: [NEW] ORIG: SRC=172.16.50.17
>> DST=192.168.1.1 PROTO=TCP SPT=17012 DPT=5222 PKTS=0 BYTES=0 , REPLY:
>> SRC=192.168.1.1 DST=192.168.2.1 PROTO=TCP SPT=5222 DPT=17012 PKTS=0
>> BYTES=0
>> Best Regards,
>> Muhammad Faisal
>>
>> Disclaimer:
>> Information in this e-mail and attachments is confidential and may be
>> legally privileged. Only intended recipients are authorized to use it.
>> If you have received this message in error, please delete it and all
>> copies of the message from your system and notify the sender
>> immediately by return e-mail. I'm neither liable for incomplete
>> transmission of the information in this communication nor for damage
>> caused by any virus transmitted through this e-mail.
>>
>>
>>
>> On Wed, Mar 15, 2017 at 11:28 PM, Muhammad Faisal <faisalusuf@gmail.com> wrote:
>>> Yes,
>>>
>>> [root@wc01 ~]# modprobe nf_conntrack_netlink
>>> [root@wc01 ~]# modprobe nf_conntrack_ipv4
>>> [root@wc01 ~]# echo "1"> /proc/sys/net/netfilter/nf_conntrack_timestamp
>>> -bash: /proc/sys/net/netfilter/nf_conntrack_timestamp: No such file or directory
>>> [root@wc01 ~]#
>>>
>>> CentOS 6.8
>>> [root@wc01 ~]# uname -a
>>> Linux wc01 2.6.32-642.15.1.el6.x86_64 #1 SMP Fri Feb 24 14:31:22 UTC
>>> 2017 x86_64 x86_64 x86_64 GNU/Linux
>>> Best Regards,
>>> Muhammad Faisal
>>>
>>> Disclaimer:
>>> Information in this e-mail and attachments is confidential and may be
>>> legally privileged. Only intended recipients are authorized to use it.
>>> If you have received this message in error, please delete it and all
>>> copies of the message from your system and notify the sender
>>> immediately by return e-mail. I'm neither liable for incomplete
>>> transmission of the information in this communication nor for damage
>>> caused by any virus transmitted through this e-mail.
>>>
>>>
>>>
>>> On Wed, Mar 15, 2017 at 11:21 PM, V Kurien <kurien.varugis@gmail.com> wrote:
>>>> Hmm. Odd. What OS are you on? I am on U16.04. How important are the
>>>> timestamps to you? Note that the log collector can add timestamps as
>>>> well.
>>>>
>>>> Did you modprobe appropriately?
>>>> modprobe nf_conntrack_netlink
>>>> modprobe nf_conntrack_ipv4
>>>>
>>>> On Wed, Mar 15, 2017 at 10:51 AM, Muhammad Faisal <faisalusuf@gmail.com> wrote:
>>>>> Hi Kurien,
>>>>> Please see the nf_conntrack_timestamp giving error is it the correct command?
>>>>>
>>>>> [root@wc01 ~]# /bin/echo "1"> /proc/sys/net/netfilter/nf_conntrack_timestamp
>>>>> -bash: /proc/sys/net/netfilter/nf_conntrack_timestamp: No such file or directory
>>>>> [root@wc01 ~]# cat /proc/sys
>>>>> sys/           sysrq-trigger  sysvipc/
>>>>> [root@wc01 ~]# cat /proc/sys/net/netfilter/nf_
>>>>> nf_conntrack_acct
>>>>> nf_conntrack_buckets
>>>>> nf_conntrack_checksum
>>>>> nf_conntrack_count
>>>>> nf_conntrack_events
>>>>> nf_conntrack_events_retry_timeout
>>>>> nf_conntrack_expect_max
>>>>> nf_conntrack_generic_timeout
>>>>> nf_conntrack_icmp_timeout
>>>>> nf_conntrack_log_invalid
>>>>> nf_conntrack_max
>>>>> nf_conntrack_tcp_be_liberal
>>>>> nf_conntrack_tcp_loose
>>>>> nf_conntrack_tcp_max_retrans
>>>>> nf_conntrack_tcp_timeout_close
>>>>> nf_conntrack_tcp_timeout_close_wait
>>>>> nf_conntrack_tcp_timeout_established
>>>>> nf_conntrack_tcp_timeout_fin_wait
>>>>> nf_conntrack_tcp_timeout_last_ack
>>>>> nf_conntrack_tcp_timeout_max_retrans
>>>>> nf_conntrack_tcp_timeout_syn_recv
>>>>> nf_conntrack_tcp_timeout_syn_sent
>>>>> nf_conntrack_tcp_timeout_time_wait
>>>>> nf_conntrack_tcp_timeout_unacknowledged
>>>>> nf_conntrack_udp_timeout
>>>>> nf_conntrack_udp_timeout_stream
>>>>> nf_log/
>>>>> Best Regards,
>>>>> Muhammad Faisal
>>>>>
>>>>> Disclaimer:
>>>>> Information in this e-mail and attachments is confidential and may be
>>>>> legally privileged. Only intended recipients are authorized to use it.
>>>>> If you have received this message in error, please delete it and all
>>>>> copies of the message from your system and notify the sender
>>>>> immediately by return e-mail. I'm neither liable for incomplete
>>>>> transmission of the information in this communication nor for damage
>>>>> caused by any virus transmitted through this e-mail.
>>>>>
>>>>>
>>>>>
>>>>> On Wed, Mar 15, 2017 at 12:04 AM, V Kurien <kurien.varugis@gmail.com> wrote:
>>>>>> Don't you have to enable timestamp and byte logging support?
>>>>>> /bin/echo "1" > /proc/sys/net/netfilter/nf_conntrack_acct
>>>>>> /bin/echo "1"> /proc/sys/net/netfilter/nf_conntrack_timestamp
>>>>>>
>>>>>> On Tue, Mar 14, 2017 at 11:55 AM, Muhammad Faisal <faisalusuf@gmail.com> wrote:
>>>>>>> Hello,
>>>>>>> I would like to understand is this a feature or a possible bug that
>>>>>>> Year info is missing from the ulogd2 output.
>>>>>>>
>>>>>>>
>>>>>>> Mar 11 15:55:59 wc01 ulogd[14289]: [NEW] ORIG: SRC=5.55.22.172
>>>>>>> DST=192.168.1.3 PROTO=TCP SPT=2083 DPT=5158 PKTS=0 BYTES=0 , REPLY:
>>>>>>> SRC=192.168.1.3 DST=5.55.22.172 PROTO=TCP SPT=5158 DPT=2083 PKTS=0
>>>>>>> BYTES=0
>>>>>>>
>>>>>>>
>>>>>>> Best Regards,
>>>>>>> Muhammad Faisal
>>>>>>> --
>>>>>>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>>>>>>> the body of a message to majordomo@vger.kernel.org
>>>>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
