From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: TCP LAST ACK incorrectly treated as invalid
Date: Tue, 21 Oct 2014 08:57:42 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1410210852310.27469@blackhole.kfki.hu>
References: <CAC=w+U7t8K2yjKtj7NDfS-xrCLRxoZ_hPxBU=EiD57v+eQnCMA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <CAC=w+U7t8K2yjKtj7NDfS-xrCLRxoZ_hPxBU=EiD57v+eQnCMA@mail.gmail.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vDev <vijaypas@gmail.com>
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

On Mon, 20 Oct 2014, vDev wrote:

> It looks like TCP conntrack is incorrectly treating "LAST ACK" (ACK
> from peer for last FIN) as the sequence number comparison does not
> take into account that the last ACK sequence number will be one
> greater than the previous sequence number.
> 
> Here's the code that seems to be the cause of it in tcp_in_window()
> [nf_conntrack_proto_tcp.c]:
> 
>        pr_debug("tcp_in_window: I=%i II=%i III=%i IV=%i\n",
>                  before(seq, sender->td_maxend + 1),
>                  after(end, sender->td_end - receiver->td_maxwin - 1),
>                  before(sack, receiver->td_end + 1),
>                  after(sack, receiver->td_end - MAXACKWINDOW(sender) - 1));
> 
>         if (before(seq, sender->td_maxend + 1) &&
>             after(end, sender->td_end - receiver->td_maxwin - 1) &&
>             before(sack, receiver->td_end + 1) &&
>             after(sack, receiver->td_end - MAXACKWINDOW(sender) - 1)) {
> 
> III in pr_debug will be 0 as "before(sack, receiver->td_end + 1)" will
> evaluate to false as sack will be equal to (receiver->td_end + 1) for
> the last ACK. The sequence number will be one greater in the last ACK.
> 
> Any feedback will be helpful. Thanks for looking into this.

Maybe you are not taking into account that the last ACK acks FIN+ACK and 
FIN is counted in the sequence numbers and it's stored in td_end. Please 
see segment_seq_plus_len() in nf_conntrack_proto_tcp.c.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
