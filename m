From: raviraj joshi <raviraj.j1991@gmail.com>
Subject: kenel level packet capturing
Date: Wed, 19 Oct 2011 12:24:01 +0530
Message-ID: <CAKj1SsOnYsOXjRBKm+=hTnEiesXrC3h0Q-KN2b61nPSQud9wMA@mail.gmail.com>
References: <CAKj1SsP+GE=QqN8nx7aaAxXE8BODKb=vns_=SnbyySQjZp3-pg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=obbZbTxWEUqu/T9B4hRJ4teR1wHMNcO56G0vBQObIVs=;
        b=FZ5mK4V/OaepdFKzgwOcW49kNefQ4yTqj3EtgSBR1j/fZb+Ipvdkv0PTpVKFxK31mI
         52+sDea6g6ZCoKIYaRp9Iev+iqk/4CIoECA75iAg+mZkOpnE6Vlv+WQBFHXzGeIJU0pP
         6oC6gR59NNBDzWTXZMry/hhPrOpwzxlOVo1kk=
In-Reply-To: <CAKj1SsP+GE=QqN8nx7aaAxXE8BODKb=vns_=SnbyySQjZp3-pg@mail.gmail.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

Hi,

We are making a kernel level packet capture module as a part of our BE project .
We are finding it difficult to understand kenel networking code.
We studied structures and functions like sk_buff, netif_rx(),dev_alloc_skb.

However we were not able to trace the actual path a simple packet follows.

Moreover we tried to count the no of times netif_rx function was
called it was much much lower than amount of packets actually being
received.

Can anyone please let us know the reason for this and how to approach
the problem of writing a kernel level packet capture module ,resoruces
we need to refer to (we are currently constrained to documents on
kernel-networking available online).

And even from where to get information about how forwarding(or packet
flow) occours when we have virtual bridges (in terms of networking
code).

regards,
Raviraj Joshi
PICT,Pune.
