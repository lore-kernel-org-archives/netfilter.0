From: Kfir Lavi <lavi.kfir@gmail.com>
Subject: send packet received by nflog
Date: Tue, 30 Nov 2010 17:21:53 +0200
Message-ID: <AANLkTi=Ef8ac6OzjYf0pmxr5R03=9TzZ-U5U6eE-vi1P@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type:content-transfer-encoding;
        bh=4g+Fj/7fu62XHYxwRaRTH1o2bvFasc3DWwMtwgDZB/E=;
        b=c5luONBZoCE47ODP/E/CQD4AWnpTWCzKOnTDDbBYL/BmdzJX/t+dFzTjOKh8+fB40B
         N73cWR1lfUpvK2Fj4ZE0RY/edvj6I5svro2eW7QqDikvvfunywpymABHpe5CMJ3v7Sm6
         JOZgnFVjBuZlZZzdJ6f+GSc1TvqykSLvxxh3A=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi,
I try to hack a simple demo program to forward each packet received by =
nflog.
I'm creating two rules:
=C2=A0/sbin/ebtables --table broute --append BROUTING -i eth0 --nflog-g=
roup
5 --jump DROP
/sbin/ebtables --table broute --append BROUTING --jump DROP

Then I run a listener on group 5.
In order to send the packet I need the hw header and the payload.
I can get them like this:
nflog_get_msg_packet_hwhdr(nfa)
payload_len =3D nflog_get_payload(nfa, &payload);

To send I use write:
write(rawsock, pkt, pkt_len)

The problem is that the hardware header and the payload are not one
after the other in the memory, so I need to concatenate them to new
buffer.
This seems non intuitive for me, so I'm asking here.

There are 6 bytes between the hw header and the payload in the memory.
Those 6 bytes in between look like this in hex:
0000 2000 0900

Is it possible to concatenate two buffers to send as one packet?
Sending those two buffers one after the other looks like two packets
and not one.

Thanks,
Kfir
