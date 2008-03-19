From: rigoberto perez <rigo666beast@yahoo.com>
Subject: Tcp segment size in linux
Date: Wed, 19 Mar 2008 05:05:21 -0700 (PDT)
Message-ID: <195342.17620.qm@web33204.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter <netfilter@vger.kernel.org>

I need grow up the packets in netfilter hooks by
padding some information but it leads a fragmentation
in packets with size near to 1500 (MTU).=20

In others Operating System like UNIX and WINDOWS, I
can tell to TCP layer that not use the MTU to adjust
packets size. For example, in SCO UNIX, the paramater
is the tcp segment size, and it can be change using
the ifconfig command. In Windows, I can change some
register key and change the MTU reported to tcp layer
in order to do that. In both cases TCP using less size
to create packets and when this packets arrives to my
hook i can increment it=B4s sizes without generate
fragmentation.

My question is: Using netfilter or another system tool
i can do the same or similar thing in Linux?

Thanks.


      _________________________________________________________________=
___________________
Be a better friend, newshound, and=20
know-it-all with Yahoo! Mobile.  Try it now.  http://mobile.yahoo.com/;=
_ylt=3DAhu06i62sR8HDtDypao8Wcj9tAcJ
