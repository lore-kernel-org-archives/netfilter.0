From: Greg Oliver <oliver.greg2@gmail.com>
Subject: ebtables to copy traffic
Date: Fri, 29 Jul 2011 09:08:31 -0500
Message-ID: <CACsKbv0r4PcDp0zKV53n=oAOYkvkPbOCtN8LE=L2zQPcUyasew@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=m/mwJX+h6lrSt3RgyE5yozKP9hKqbhmkvqw3Z1dfHLY=;
        b=DwS0vfBnlAjyIrHIgg67FLMENKKgXznQqLcuJJERrJREoOMAL/mZ7ucp/GQWHLmFXF
         MEJnUHbIR6x30kNdkiaBBrftGgNAWrT5bOFdQGtwT2tbp9FyyLjQxy9uiw8CS1wXeHda
         4Ay8ydddRSEEctTaGaTV5fs6xOILxGqlTuWc8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

So, I am pretty new to all of this, but we use port mirroring from
ethernet switches to record voip calls in our business.  We usually have
no issues due to using a physical port on the servers, but we are
migrating to a virtual model.

I am planning on using ebtables to copy all traffic on the mirror port
from the switch to a list of receiving MACs on the network, but I cannto
for the life of me get it right I guess.

I am trying to use dnat.

Server0 -
        eth0 - connected to switch mirror port
        eth1 - connected to LAN A
        eth2 - connected to LAN B (recording LAN)

Server1 -
        eth0 - connected to LAN A
        eth1 - connected to LAN B

What I am attempting is to dnat all incoming traffic on Server0/eth0 to
the MAC of Server1/eth1

ebtables -t nat -A PREROUTING -i eth0 -j dnat --to-destination
00:22:19:e2:9b:24
ebtables -t broute -A BROUTING -i eth0 -p ipv4 -j redirect
--redirect-target DROP

are the 2 methods I have tried (00:22:19:e2:9b:24) is server1/eth1

Not knowing whether or not bridging is actually required for the
interfaces in question, I have also reconfigured Server0 for bridging on
all of it's interfaces, and attempted both the bridged and physical -i
in the ebtables command line.

Am I obviously overlooking something simple here?  Thsi should be the
most basic of basic things for ebtables to do right?

Thanks for any insight!

-Greg
