From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: NFCT writing localhost conntrack entries too
Date: Thu, 24 Aug 2017 18:40:51 +0530
Message-ID: <CAA5aLPg0PnUuiNFq=pvcOXerJJugcLF1bFgwxSC3KV4yEsv0DQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=bAJnLHx41UWWovow8hP7raW4buWLH3bSGE1u9AnCgbQ=;
        b=nrLav/haBrjX4KE8L9y3FBLTwJyjyoL8cHCwhXedCRxcwDiM8CBQvXbQxzgcoSOHEH
         xnFt98p8SRHk78oJIdIOBleYZTDeDnDHLj12ZzPxZRK+mna447hu+roHUl8rQJ3ArX6a
         /CaqhW6ntjUdsfgB6ValW3acJW00nMWDXmuVwiy0gbEq9HHSVC/3WFwNdAfg4dbDH6SY
         aD7yO+UpZKZb5wr6aWA+wJLfe1Jl/oXjY4gsTG+hIk7lNFF6SHO0EwJIAj6G3e/dDTar
         9oJ627hVk5yuJAsn5G4uASmz6opM3YIUia4VqfhtAsEi2qxQ/5OIo86h9NaDQ8g+IDqE
         z83w==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

With ulog, NFCT plugin, is it possible to not log entries with src ip
as 127.0.0.1

I can see following options in ulogd.conf
#accept_src_filter=192.168.1.0/24,1:2::/64 # source ip of connection
must belong to these networks
#accept_dst_filter=192.168.1.0/24 # destination ip of connection must
belong to these networks
#accept_proto_filter=tcp,sctp # layer 4 proto of connections


... but what I am looking for is like deny_src_filter.

Is it possible?
