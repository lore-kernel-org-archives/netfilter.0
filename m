From: Shihwei Li <lishihwei@gmail.com>
Subject: Re: nfqnl_test exits abnormally while monitoring some TCP packets.
Date: Thu, 30 Sep 2010 16:34:35 -0400
Message-ID: <AANLkTikR7ok7i+bv7yHS+3HpnsUCNdHyU9zvO=_JrNjQ@mail.gmail.com>
References: <AANLkTikz1tOWnvTYXZ1Z3cBh+mZLZ_qz2sgmFS94fT3g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=IIMLbqzAGxxOtEpUOVspfsUS2VQ2CyqyviCpsBikJmQ=;
        b=ol9pFV8ZVwExI7DyFOdFETYClutXp0Qdq89+6bjj8PH4zLIaQ4xIipjku5Apn4miB6
         mTxuMSxGp+Kian3E/jHeNZDAJkUyN8kdLScCowvwNiR7zX1SMXLrdQMX00QZTplnHQxK
         kHvqwO+BjpTW1yiXJoYBXwVd4URSA6b8mQcN4=
In-Reply-To: <AANLkTikz1tOWnvTYXZ1Z3cBh+mZLZ_qz2sgmFS94fT3g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi,

More information about the problem. I added perror() to the
nfqnl_test.c, it seems that there no buffer space available. Anyway to
increase the buffer space? Thanks.

--peter

entering callback
pkt received
hw_protocol=3D0x0800 hook=3D3 id=3D148 outdev=3D2 payload_len=3D1500
entering callback
recv:: No buffer space available
unbinding from queue 0
 rv=3D-1
, errorno=3D29


2010/9/30 Shihwei Li <lishihwei@gmail.com>:
> Hi,
>
> I am new to libnetfilter_queue and I need some helps. In short, I use=
d
> the distributed nfqnl_test.c to monitor some HTTP/TCP packets and the
> nfqnl_test exits abnormally.
>
> I will try to describe my situation as accurately as possible.
>
> I plan to develop a program upon libnetfilter_queue to filter/inspect
> some HTTP/TCP packets.
> As a starter, I tried to run the test program, nfqnl_test.c from the
> libnetfilter_queue distribution.
>
> Here is what I did:
> * Set up a simple python http server on port 50007.
> (http://docs.python.org/library/basehttpserver.html)
>
> * Running iptables rules to pipe outgoing tcp packets from port 50007
> to the queue 0:
> ** The rule is " /sbin/iptables -A OUTPUT -p tcp --sport 50007 -j
> NFQUEUE --queue-num 0"
> ** The iptables output is
>
> =C2=A0 =C2=A0 Chain OUTPUT (policy ACCEPT)
> =C2=A0 =C2=A0 target =C2=A0 =C2=A0 prot opt source =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 destination
> =C2=A0 =C2=A0 NFQUEUE =C2=A0 =C2=A0tcp =C2=A0-- =C2=A0anywhere =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 anywhere =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0tcp
> spt:50007 NFQUEUE num 0
>
> * Running the nfqnl_test program on the web server side.
>
> * On another machine, open a web browser, and connect to the python w=
eb server.
>
> Everything went well, the browser could browse normally, and
> nfqnl_test on the server side could print the outgoing TCP packets
> info and reinject the packet into the queue ( verdict=3D NF_ACCEPT).
>
> UNTIL (see below) when the browser started to try to download (or
> open) a (big) zip file on the server side. The nfqnl_test program
> always exited from the callback loop during the middle of file
> downloading. I repeated five or so times (even trying open different
> file), the behavior is quite persistent.
>
> Is it possible a bug in the system? Or did I use the nfqnl_test
> wrongly? Or something else? Any suggestion?
> Thanks a lot.
>
> --peter
>
> Here are the details of my system:
>
> * OS: =C2=A0Linux .. 2.6.21-2950.fc8xen #1 SMP Tue Oct 23 12:24:34 ED=
T 2007
> i686 i686 i386 GNU/Linux
> * libnfnetlink-1.0.0
> * libnetfilter_queue-1.0.0
> * iptables v1.3.8
>
>
> Here is the output of the nfqnl_test:
>
> [root@ar21-222 utils]# ./nfqnl_test
> opening library handle
> unbinding existing nf_queue handler for AF_INET (if any)
> binding nfnetlink_queue as nf_queue handler for AF_INET
> binding this socket to queue '0'
> setting copy_packet mode
> pkt received
> hw_protocol=3D0x0000 hook=3D3 id=3D1 outdev=3D2 payload_len=3D60
> entering callback
> pkt received
> hw_protocol=3D0x0000 hook=3D3 id=3D2 outdev=3D2 payload_len=3D52
> entering callback
> pkt received
> hw_protocol=3D0x0000 hook=3D3 id=3D3 outdev=3D2 payload_len=3D52
> entering callback
> pkt received
> hw_protocol=3D0x0000 hook=3D3 id=3D4 outdev=3D2 payload_len=3D1500
> entering callback
> pkt received
> hw_protocol=3D0x0000 hook=3D3 id=3D5 outdev=3D2 payload_len=3D69
> entering callback
> pkt received
> hw_protocol=3D0x0000 hook=3D3 id=3D6 outdev=3D2 payload_len=3D1500
> entering callback
> pkt received
> hw_protocol=3D0x0000 hook=3D3 id=3D7 outdev=3D2 payload_len=3D60
> entering callback
> pkt received
> hw_protocol=3D0x0000 hook=3D3 id=3D8 outdev=3D2 payload_len=3D52
> ....
> hw_protocol=3D0x0800 hook=3D3 id=3D366 outdev=3D2 payload_len=3D1500
> entering callback
> pkt received
> hw_protocol=3D0x0800 hook=3D3 id=3D367 outdev=3D2 payload_len=3D1500
> entering callback
> pkt received
> hw_protocol=3D0x0800 hook=3D3 id=3D368 outdev=3D2 payload_len=3D1500
> entering callback
> pkt received
> hw_protocol=3D0x0800 hook=3D3 id=3D369 outdev=3D2 payload_len=3D1500
> entering callback
> pkt received
> hw_protocol=3D0x0800 hook=3D3 id=3D370 outdev=3D2 payload_len=3D1500
> entering callback
> pkt received
> hw_protocol=3D0x0800 hook=3D3 id=3D371 outdev=3D2 payload_len=3D1500
> entering callback
> unbinding from queue 0 =C2=A0 <---------------------------------out f=
rom the loop
> hw_protocol=3D0x0800 hook=3D3 id=3D372 outdev=3D2 payload_len=3D1500
> entering callback
> hw_protocol=3D0x0800 hook=3D3 id=3D373 outdev=3D2 payload_len=3D1500
> entering callback
> hw_protocol=3D0x0800 hook=3D3 id=3D374 outdev=3D2 payload_len=3D1500
> entering callback
> hw_protocol=3D0x0800 hook=3D3 id=3D375 outdev=3D2 payload_len=3D1500
> entering callback
> hw_protocol=3D0x0800 hook=3D3 id=3D376 outdev=3D2 payload_len=3D1500
> entering callback
> hw_protocol=3D0x0800 hook=3D3 id=3D377 outdev=3D2 payload_len=3D1500
> entering callback
> hw_protocol=3D0x0800 hook=3D3 id=3D378 outdev=3D2 payload_len=3D1500
> entering callback
> ...
> hw_protocol=3D0x0800 hook=3D3 id=3D426 outdev=3D2 payload_len=3D1500
> entering callback
> hw_protocol=3D0x0800 hook=3D3 id=3D427 outdev=3D2 payload_len=3D1500
> entering callback
> hw_protocol=3D0x0800 hook=3D3 id=3D428 outdev=3D2 payload_len=3D1500
> entering callback
> hw_protocol=3D0x0800 hook=3D3 id=3D429 outdev=3D2 payload_len=3D1500
> entering callback
> hw_protocol=3D0x0800 hook=3D3 id=3D430 outdev=3D2 payload_len=3D1500
> entering callback
> hw_protocol=3D0x0800 hook=3D3 id=3D431 outdev=3D2 payload_len=3D1500
> entering callback
> hw_protocol=3D0x0800 hook=3D3 id=3D432 outdev=3D2 payload_len=3D1500
> entering callback
> closing library handle =C2=A0<---- finish close the library
>
