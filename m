From: "valerio balbi" <valerio.balbi@gmail.com>
Subject: The strange Packets Duplicated bug
Date: Wed, 12 Mar 2008 01:15:30 +0100
Message-ID: <edd0054b0803111715x530d4a85qe240ee2c9359239d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=UOtzUgZQ3dBci9ZS+Q/HFkqXSkgoKCms1zrZ++LpdfU=;
        b=Ilj0GtOGdIzu/S2MKrcgM5cokw4q93I3XH7zQMzE1w/R46rTmv8FqBkmRWAoLGqKmI4aKCv/DSk9rY8+FbFGu3gNqHOET5Cq1CFgPnfFZJZ7SZ2qo9B22YEFK/3KjnspAkqaZOjSNm5E/INb1XTI7V8e2vMlX2HXCZ5PM2S31iQ=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 

linux-net@vger.kernel.org       netfilter@vger.kernel.org


Hi ML!

Sometime time ago, an idea began knocking into my mind.
Precisly I want to build a box, linux based of course, to implement a
sort of "private virtual firewall".
I build a very nice "mini-itx" box with 6 network eth real device.

Before going straight forward, I tested my box for a checkpoint.
But in this checkpoint I found a annoying error.
I titled this error

"The strange Packets Duplicated bug"

Crime Scene
                     -----------------------
I   )    |           |       |       |       |     |      -------
N  (     +-----------+ eth2 -+       +- eth4 +-----|     |       |
T   )    |           |       |       |       |     |-----+       |
E  (     |           |      br0     br1      |     |     |       |
R   )    |           |                       |     |     |       |
N  (     |           |        ipTables       |    [B]     -------
E   )    |           |      kernel 2.6.18    |
T  (    [A]           -----------------------

I introduced the kernel bridge to split the packet traffic into
several virtual tun
(one for each virtual device).
Now let me show You the bug.
A client located into network B is trying to download a considerable
dimention file like
the kernel vanilla, after a time the transfer is frozen then
connection is resetted.
In my box the iptables filtering and source-natting rules refer
bridges interface.


C.S.I
It's time to deep dig so I instrument a trace with wireshark both in
network A and
in network B and I realize that in network B there are a lot of
retransmissions...
(already changed hubs and cables)

In particular:
1 SYN packet from client to br1 seen in B
2 SYN packet from br0 (NAT-ed) towards Internet seen in A
3 SYNACK packet from Internet towards br0 seen in A
4 SYNACK packet from Internet to client coming from br1 seen in B
5 SYNACK packet from Internet to client coming from br1 seen in B

Packet5 leads me to think a bug, IMHO packet5 should not exist at all!
Anyway the only difference between packet4 and packet5 is TTL value:
TTL(packet5)=TTL(packet4)+1
I suppose this duplication shall produce a flood and the box would
perform the kill action of the download session.

Causes
I'm thinking to some trouble in sundance driver, used for D-Link
DFE-580TX (haven't seen interesting issues in ML)
Or some misconfiguration in /proc/sys/net/ipv4/conf/br*/*.
Or a design limit of the kernel virtual bridge (stp disabled).

In which point I'm in error?
Thank's in advance

pvb265
