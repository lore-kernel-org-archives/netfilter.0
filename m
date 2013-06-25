From: Rodrigo Stuffs <rbs@brasilia.br>
Subject: nf_nat_sip questions
Date: Tue, 25 Jun 2013 13:29:46 -0300
Message-ID: <CADOAAgrAR9t+tS7dSHp-FQeQk_6L8JDreb3pF053XzKBC=ccmg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello List,

Let a scenario:

[ Internal network 172.16.9.0/24 eth1 ] ---- <raspberry pi> ---- [
valid internet IP address eth0 ]

Recently, I got myself adventuring on Asterisk, and in order to
address some issues, I found nf_nat_sip. So, my Raspberry Pi is doing
the IP masquerading job for my internal network. And then, I installed
Asterisk in the Pi, which is bound to both internal and external
interfaces.

Ok, the internal softphones works just nicely. It happens that
external phones have 1-way communication (just listens) with internal
phones.

While running a tcpdump, I found that SIP was telling my external
phones to send the RTP data to a internal IP address instead. See a
dump below:

--------------------8<-------------------

INVITE sip:soft-01@179.245.20.148:5060 SIP/2.0
Via: SIP/2.0/UDP <home valid ip address>:5060;branch=z9hG4bK7a17bb7b;rport
Max-Forwards: 70
From: <sip:102@<home hostname>>;tag=as1a71f0f6
To: "soft-01" <sip:soft-01@<home hostname>:5060>;tag=63f8e4a543
Contact: <sip:102@<home valid ip address>:5060>
Call-ID: cf6587a53b2ef650
CSeq: 102 INVITE
User-Agent: Asterisk PBX 1.8.13.1~dfsg-3
Allow: INVITE, ACK, CANCEL, OPTIONS, BYE, REFER, SUBSCRIBE, NOTIFY,
INFO, PUBLISH
Supported: replaces, timer
Content-Type: application/sdp
Content-Length: 265

v=0
o=root 899324373 899324374 IN IP4 172.16.9.5   <------ WRONG!
s=Asterisk PBX 1.8.13.1~dfsg-3
c=IN IP4 172.16.9.5   <-------- WRONG!
t=0 0
m=audio 16428 RTP/AVP 0 125
a=rtpmap:0 PCMU/8000
a=rtpmap:125 telephone-event/8000
a=fmtp:125 0-16
a=silenceSupp:off - - - -
a=ptime:20
a=sendrecv

--------------------8<-------------------

As I highlighted in the dump (seek for WRONG!), SIP is telling my
external phone to talk back to a internal phone, so this is why the
internal peer doesn't hear back.

Ok, just prior to send me to whine to asterisk-users list, here comes
my NF relevant questions.

1. Is just loading the module nf_nat_sip enough, is it active and
mangling packets? Or should I tie it to some fancy iptables rule?
http://people.netfilter.org/chentschel/docs/sip-conntrack-nat.html is
not very clear about it.

2. Does nf_nat_sip mangles that IP address, in o= and c= lines? Does
it mangle whatever else?

3. As I described, the Pi also serves internal network. Is there a
risk to nf_nat_sip *also* mangle the *internal - internal*  SIP
traffic to the server?

4. If 2 is true, how can I mitigate it? -j CT --notrack -o <internal if> ?

Thanks a lot,

- RF.
