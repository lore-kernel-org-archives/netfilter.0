From: Maximiliano Estudies <maxiestudies@gmail.com>
Subject: extra chains for nftrace
Date: Fri, 10 Jun 2022 10:19:36 +0200
Message-ID: <CAF358wTfUnT44NeJdo2eda3ppukvPapEL18SyB9qbRjkyDXc1A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=Ytb7bVggMh4i4kWFjgWs/oUpSKxl36zSbSBwhhUk9Bg=;
        b=oii2/616ul/4dUTvo0ccn3izgsWYJiNORwGIYig3dGWXVXt3+D38oUB1F2Vbov+f6v
         8OWXmk4qHR6wFblCjaSHlVhsgbMSK4ns6dj4aFpVQ7ohhfJgcChjZPA8+b0pF9kBD40Y
         WHogNrq1vEL0OK4eg0nnMxZwTna3ZlvpQHD2MZg82xT17oce1CY7vGY/bt8ZYanGOspg
         viq3jF5WEJCMqozukXiY6XvYr+nouwQbvBJHMweBlQfUDSJhuGwJ6xeRVOhNGnDVhkjl
         BovO2Y8Fi6tSAFGd1V+JbktcSKWdzjuzZd/A8k5zrZjjHZEalaoLKw92c+YVLPJGNHBb
         j3Kw==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

in the nft wiki is recommended to add an extra chain to do the
tracing. Why is that the case?
Does anything speak against inserting an nftrace rule before the rule
I need to trace in the chain?

e.g
If I have this chain:

table inet example_table {
  chain example_chain {
    type filter hook input priority filter; policy drop;
    tcp dport ssh accept
  }
}

would do this:

table inet example_table {
  chain example_chain {
    type filter hook input priority filter; policy drop;
    tcp dport ssh meta nftrace set 1 <implicit continue>
    tcp dport ssh accept
  }
}
