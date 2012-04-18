From: "MadLoisae@gmx.net" <MadLoisae@gmx.net>
Subject: wrong order of received packets/bytes and sent packets/bytes with
 local incoming connections
Date: Wed, 18 Apr 2012 21:13:40 +0200
Message-ID: <4F8F1264.7070403@gmx.net>
Reply-To: MadLoisae@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

hi,

in /proc/net/nf_conntrack (and also in conntrack -L) i can see received 
packets/bytes and sent packets/bytes.
with connections, which are local incoming connections (i.e. a 
ssh-connection from anywhere to my machine) these fields are mixed, 
means that the received / sent is "wrong".

with local outbound connections or forwarding connections these fields 
are correct filled.

is there anywhere a configuation option to fix this?

I am using kernel 3.3.2 (I can see this issue already very long, not 
since this kernel) and conntrack 0.9.14 (sebian squeeze).

Best regards
Alois
