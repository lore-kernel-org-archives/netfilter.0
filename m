From: Oskar Berggren <oskar.berggren@gmail.com>
Subject: nfmark and arp
Date: Thu, 24 Sep 2009 20:31:06 +0200
Message-ID: <33be4bb30909241131ke02cb9r5948e84849528e19@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=yjxMbx1wLWVIu0TZkMm806MPRY7BEw7kQ/Jl6WFTAxY=;
        b=wiYcn4CpgSr8FCyerLVk0n6hVtCxa9ocT9USAG+MOPbuNAQTO+puBOqgA1qdFsctdI
         UFNSbPtsC1+CVFBJbyq6yJ26ujw+w3Twm3nksmbRNIN8JfJypzhZWwh4zXX/mmkPihtk
         zfrSV+DNXAvPZzmWoHVYM2TKaEhih7FSfuzb4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Hi,

Proxy-arp decides if a response is going to be sent based on a route
lookup. This lookup takes rules added with ip rule for policy routing
into account. For example if a rule is present saying that all traffic
coming in on interface eth1 should be routed using table 10, proxy-arp
will look in this table.

However, basing the policy routing on input interface is a bit
cumbersome in this case. I would like to use nfmark instead (which we
use for the other traffic). Is it possible in some way to have an
nfmark apply for an arp packet?

My problem is that the proxy-arp causes the router to answer
gratuitous arp requests, causing the client to complain about
ip-conflict, because the host route for the client is in table X while
proxy-arp will currently look in the default route table. Adding an
individual ip rule for each client seems overkill and probably bad for
performance.


Currently we use arptables to block the problematic and unneeded arp
replies, but it seems a cleaner solution would be to have proxy-arp
actually look in the right table, if possible.


/Oskar
