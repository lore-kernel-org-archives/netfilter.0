From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Figuring out odd web traffic from clients
Date: Sat, 17 Mar 2012 20:55:22 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1203172010310.27616@blackhole.kfki.hu>
References: <CABqG1H8VJuXgPuNWa=8it1TCeDOXYL3LtOVKix3Xv7Un-=yRaw@mail.gmail.com> <4F63C987.4000100@mandragor.org> <7F9E8AF0E40846F28C9EA7BCA54D93C2@gmail.com> <15F55D7D8D0B48F8B8B495E62D858E8C@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <15F55D7D8D0B48F8B8B495E62D858E8C@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miles Stevenson <miles@mstevenson.org>
Cc: netfilter@vger.kernel.org

On Sat, 17 Mar 2012, Miles Stevenson wrote:

> I've done a little more digging and I've learned some new things along 
> the way, but I don't have a solution yet. One thing that was 
> illuminating, was learning that you can enable logging in the conntrack 
> kernel module for any packets that conntrack discards because it 
> considers the packet to be invalid. You can do this with:
> 
> echo 255 > /proc/sys/net/netfilter/nf_conntrack_log_inavlid
> 
> Looking in the /proc/sys/netfilter/ directory, it is obvious that we are 
> able to tune the kinds of things that conntrack will consider to be 
> invalid. But I'm not going to mess with other settings until I 
> understand more about how conntrack is evaluating what is considered 
> "invalid".
> 
> After running the above, I start to get interesting logs such as these:
> nf_ct_tcp: invalid packet ignored IN= OUT= SRC=<dmz server> DST=<web client> LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=80 DPT=49673 SEQ=3022090550 ACK=328069967 WINDOW=5840 RES=0x00 ACK SYN URGP=0 OPT (020405B40
> 101040201030308) 
> 
> Notice that this is an outgiong packet from my web server, indicating 
> that there is something wrong on my web server. I don't have a tcpdump 
> to see the context of this packet, but I don't see anything about this 
> that seems invalid (no invalid flag combinations, TTL is fine, can't 
> tell if ACK or SEQ numbers are correct without seeing the rest of the 
> data stream though). Analysis of the kernel source code for conntrack 
> might be helpful in understanding what criteria needs to be met for 
> packets to get "ignored": 
> http://tomoyo.sourceforge.jp/cgi-bin/lxr/source/net/netfilter/nf_conntrack_proto_tcp.c
> 
> But I haven't spent much time going down that road yet.
> 
> One interesting thing about this, is that there is no accompanying log 
> from the iptables filter logging this as a rejected packet. Which means 
> that conntrack will drop packets silently without you knowing unless you 
> enable the conntrack logging through /proc like I mentioned above. 

No, conntrack did not drop the packet.

[...]
> It's really strange. The more I play with this, the more confused I 
> start to get and realize that I don't really understand the 
> inner-workings of netfilter as well as I thought I did. So I guess I'm 
> at a point where I could use help with the following questions:
> 
> 1. What has to be wrong with a packet for conntrack to drop it before it 
> gets evaluated by the filter rules?

The packet was not dropped but ignored by conntrack.

> 2. If I grab a tcpdump to try and look at one of these dropped packets 
> in more detail, what kinds of things should I be looking for? Invalid 
> ACK or SEQ numbers? One side sending more data than the tcp window calls 
> for? Anything else?

You'd see that there was a TCP three way handshake attempt beforehand with 
the same tuple parameters (source IP+port, destination IP+port), but with 
different SEQ/ACK parameters. That means that the conntrack state table 
might be out of sync with respect of the given connection. So in order to 
play safely, conntrack stores the relevant parameters of the packet but 
otherwise ignores it: doesn't flag it as INVALID and doesn't change it's 
state. Your rules let the packet pass and conntrack will be able to 
correct its state table from the reply packet, if it's state was really 
out of sync.

>3. How common is this kind of thing? Is this just
> garbage noise that is hitting everyones' firewall and you just don't 
> notice it until you enable conntrack logging?

It can happen easily: packets seen by the firewall can get lost in either 
direction or client-server can be out of sync. In your case it's a 
webserver: probably the client might just try to re-establish a timed out 
connection attempt: it sent a SYN which was not answered by the server 
(overloaded, slow to answer, etc) and sent a SYN with new parameters, and 
both attempts were seen by conntrack. However the webserver was slow to 
process the first connection attemtp and just sends the SYN/ACK answer to 
the first SYN attempt, which is detected by conntrack - and the 
packet ignored.


> 4. If this indicates some kind of network configuration error on my web 
> server, what kinds of things should I be looking for? Network buffers 
> tunable via /proc? ulimits? routing table errors? ethernet media type 
> mismatches? I'm not sure where to start, and a cursory look at my web 
> server config seems fine.

Maybe the webserver cannot cope with the connection load. Or it's a client 
side issue. A full tcpdump can help to tell what happens exactly.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
