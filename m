From: Andreas Sikkema <ramdyne@gmx.net>
Subject: Length module, docs "incorrect" or something else?
Date: Fri, 1 Nov 2019 18:14:23 +0100
Message-ID: <CABkXqaN43d3SC+KxzJu0uBZYw0kwoB5A8jO9WazWeEpfF3k7PA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I have a strange problem trying to filter out some unwanted packets
from RTP streams. I have two machines exchanging quite a lot of RTP
traffic between each other, both then send these on to other devices.
For some reason one side is sending empty UDP messages to the other
side which the other side doesn't like which results in loss of media.
I have found that when I use iptables/netfilter to filter out these
empty UDP messages nothing breaks and my users are happy.

The iptables command I use is:
/sbin/iptables -A INPUT -s <source ip>/32 -p udp -m length --length 28 -j DROP

This worked for years without any issue, but the last few months users
have been complaining that the problems started again, possibly after
we've upgraded the machine that's doing the filtering to a much newer
Debian 9, iptables version is currently 1.6.0+snapshot20161117-6

Upon investigation using TCPdump I saw that the UDP messages that were
still being dropped had the expected 28 bytes of IP message size, but
so did the messages that were not being dropped. The only difference
between these two in my captures was that the non-dropped messages
included Ethernet padding and the dropped messages had no padding in
the capture.

I have three questions:
- How do I see (on a production machine) what length the length module
sees on these empty UDP messages?
- Should the length module even (appear to) use the length of the
Ethernet frame body as source of the "length of the layer-3 payload
(e.g. layer-4 packet) of a packet"?
- Have I missed a trick in finding out why these (apparently) larger
messages are not being dropped?

An additional question I have is whether I should even be seeing
padding intermittently using TCPdump? But that is probably off-topic
here.

I am completely lost at this point, can anyone point me in a
potentially correct direction?

-- 
Andreas Sikkema
