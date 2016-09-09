From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Linux - nf_conntrack_count = 30684?
Date: Fri, 9 Sep 2016 15:29:45 +0200
Message-ID: <20160909132945.GA23757@salvia>
References: <CAL7_A_XQXMFP598iP1nhUqvvmzE7GC5GUXcOoQ_2Y9YvRx8TOw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL7_A_XQXMFP598iP1nhUqvvmzE7GC5GUXcOoQ_2Y9YvRx8TOw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Koehler <jenskxxx@googlemail.com>
Cc: netfilter@vger.kernel.org

On Fri, Sep 09, 2016 at 10:29:33AM +0200, Jens Koehler wrote:
>  A Linux application reads cyclically data from up to 32 severs by
> Tcp. After disconnecting of many/ all servers another Linux
> application could not send data via the network interface by UDP.
> nf_conntrack_count shows an unexpected high value:
> 
> net.netfilter.nf_conntrack_count = 30684
> 
> What means the number exactly?

This is the number of conntrack entries in the table.

> And what could be reason for so many open connections if no server
> is connected?

Do `conntrack -L' or `cat /proc/net/nf_conntrack' show entries?
