From: =?UTF-8?Q?Bj=C3=B8rnar_Ness?= <bjornar.ness@gmail.com>
Subject: "random" syn packets dropped
Date: Mon, 7 Nov 2016 20:45:30 +0100
Message-ID: <CAJO99T=_zW8vgaWM5zCKxC65XmXSGmodcwXOCg7iRjr+Z4cHsQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to;
        bh=elfb52XQpkweNu4sd6DLC+Kh9B5ZHopAaLhzDLjLIHE=;
        b=sU+WAjC9c03drbMoOoswZrK93ukDnIZlxaaliVAy2LAuna9ZZjKdQF7ehLF/VEAKeB
         SOeFdrinP5I0gwYgLLSyD1KZutCnnnXq6A3e6ya1RqMWtLCwyo3bQ4zFyd8q/9N3B1lL
         nLnEqpw4OLKop1SKNTPOSSjBArLDyKdDRv1o02GshGEtRNRU+tdb1sj6cF4QD13GPN40
         RGvaqA0dOO6iBFSgJVImXNRhBYDPXuobDYzptu0ymxiLjrfH8VAOChnMISX6u0O501Ko
         ms2zjNXeYifpzKcfYP4emb+THDq2h40IzuRnYedkxeDzo0zVFDKBDL6i8VdkcT5Oi3Ew
         5R+w==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I am not sure if this is nftables related, but I post this issue here,
and see if any of you can
come up with a clue to what might be going on.

Problem description:

When I create multiple tcp connections from the same client to
multiple dst hosts at the same
time, the n'th syn packet seems to be just discarded by "something".
If I reorder the list of dst
hosts, a different dst host will hang in SYN_SENT.

What I am seeing on the firewall running kernel 4.8.1 is the following:

* the syn packet enters through the eth1.700 interface
* the packet does _not_ exit through eth1.300 interface as supposed to.
* nft trace monitoring shows the packet beeing accepted on eth1.300 in
postrouting.
* rp_filter etc should not be kicking in here, (and also, "random"
hosts are dropped)
* conntrack table is not full
* this issue seem to suddenly appeared, is this a known bug?

-- 
Bj(/)rnar
