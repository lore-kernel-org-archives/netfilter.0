From: vDev <vijaypas@gmail.com>
Subject: Re: TCP LAST ACK incorrectly treated as invalid
Date: Tue, 21 Oct 2014 10:44:57 -0500
Message-ID: <CAC=w+U5v6oj0zJFTZvjPomyf+pFdFCJrXgdWVG7QQDuttuhC1g@mail.gmail.com>
References: <CAC=w+U7t8K2yjKtj7NDfS-xrCLRxoZ_hPxBU=EiD57v+eQnCMA@mail.gmail.com>
	<alpine.DEB.2.10.1410210852310.27469@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=ZiFWQqnBsFbXLuni2Qs7PLw41P0V6UK540kgnD1PTes=;
        b=QGPCPn0cSvLH9MVshSIqx/ebIcby+FxuzhJ1zV2wGt2plUEdofZMickl1jWsFkEdiB
         lW5bl7W8NX8vobRqs/sQqFzKoT5P24AeHDPH6mSZbWZBtTQCzFhiMxuAgtX0/XemTcZw
         8/S1xkhFhXWwnnyRfueZSHMa6JWy2/zwFzRICd9x+NhmVt1AqdVpH2Vxyt1zkdRaIahv
         xpFapLREyKQYGi0WRkpCKrra2ZrVURno0xKRyL1o+vGrnztG1j110T47ukSaS1YVIbi1
         AGSSKjvMRAjqan5ItVATDdSubndoq1ZCx7bDdmB9rd3JFxte5kD402RDwar7sdSippGx
         aLcQ==
In-Reply-To: <alpine.DEB.2.10.1410210852310.27469@blackhole.kfki.hu>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

Thanks, Jozsef. I see sequence number compensation in
segment_seq_plus_len() but does that not cover the ACK sequence
numbers. The variables (sack and receiver->td_end) are off by 1. It
seems like receiver->td_end must be incremented by 1 for last ACK.
Here's a trace:

[  775.980000] seq=726609914 ack=94044192+(0) sack=94044192+(0)
win=14600 end=726609914
[  775.980000] tcp_in_window: sender end=726609914 maxend=726611414
maxwin=14600 scale=0 receiver end=94044191 maxend=94058791 maxwin=1500
scale=0
[  775.980000] tcp_in_window: I=1 II=1 III=0 IV=1
[  775.980000] tcp_in_window: res=0 sender end=726609914
maxend=726611414 maxwin=14600 receiver end=94044191 maxend=94058791
maxwin=1500

As you can see above sack is 94044192 and receiver end is 94044191. As
a result III is 0 and res=0 which causes -NF_ACCEPT to be returned.



On Tue, Oct 21, 2014 at 1:57 AM, Jozsef Kadlecsik
<kadlec@blackhole.kfki.hu> wrote:
> On Mon, 20 Oct 2014, vDev wrote:
>
>> It looks like TCP conntrack is incorrectly treating "LAST ACK" (ACK
>> from peer for last FIN) as the sequence number comparison does not
>> take into account that the last ACK sequence number will be one
>> greater than the previous sequence number.
>>
>> Here's the code that seems to be the cause of it in tcp_in_window()
>> [nf_conntrack_proto_tcp.c]:
>>
>>        pr_debug("tcp_in_window: I=%i II=%i III=%i IV=%i\n",
>>                  before(seq, sender->td_maxend + 1),
>>                  after(end, sender->td_end - receiver->td_maxwin - 1),
>>                  before(sack, receiver->td_end + 1),
>>                  after(sack, receiver->td_end - MAXACKWINDOW(sender) - 1));
>>
>>         if (before(seq, sender->td_maxend + 1) &&
>>             after(end, sender->td_end - receiver->td_maxwin - 1) &&
>>             before(sack, receiver->td_end + 1) &&
>>             after(sack, receiver->td_end - MAXACKWINDOW(sender) - 1)) {
>>
>> III in pr_debug will be 0 as "before(sack, receiver->td_end + 1)" will
>> evaluate to false as sack will be equal to (receiver->td_end + 1) for
>> the last ACK. The sequence number will be one greater in the last ACK.
>>
>> Any feedback will be helpful. Thanks for looking into this.
>
> Maybe you are not taking into account that the last ACK acks FIN+ACK and
> FIN is counted in the sequence numbers and it's stored in td_end. Please
> see segment_seq_plus_len() in nf_conntrack_proto_tcp.c.
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
>           H-1525 Budapest 114, POB. 49, Hungary
