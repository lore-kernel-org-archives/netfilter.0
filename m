From: =?UTF-8?Q?J=C3=B6rn_Krebs?= <jk@smartbyte.de>
Subject: VoIP conntrack issue
Date: Tue, 13 Nov 2012 13:49:49 +1100
Message-ID: <CABY2qi9ge+3jkt5ePM-iZU2XycBic6orCvjF63WArCvjWPS4og@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:from:date:x-google-sender-auth:message-id
         :subject:to:content-type:content-transfer-encoding;
        bh=HooWKKt7c1wQbrrHuzPWg8pW6aQQFpArgs1r/NT7TgM=;
        b=woKaCM5+5ZlbUAIl4EQbFL3ac1Y6cVlR2Bk03Mj7y2XqaMQHUDv8brESntVow9Y0Mg
         4f/1Q/5H1IQJIIs88yd8iFdwc2Vk2xozxMkhN+n4Runqv9vV1Qk6RHUiEnWlezrbGU59
         hIeEe1GuIXB2ardCrpkXr9yXPYvxEz6z0S2LQbCNoBLSw4GZRRrFU48yq5+ZynF++s28
         gBDSVgrfyjAmYyP/cCKW8ZTvQbXiX56PytWbwrtlUDaZNSwleC/5Brcncy/wDa4AQYpT
         RL0A5UgTQ24ZD7spwc+vbMU2wdM/3AIGdC+g3vzhAUhOxD90UfwVnX1yx6uuvDlhiyZO
         Ro4g==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter <netfilter@vger.kernel.org>

Hi guys, I got the error, that my last mail hasn't been postet, so I tr=
y again:

I know this might have been discussed a thousand times, but actually,
I think, not often enough.
=46irst my situation:
I have a private network, iptables NATed of cause! then I have a
Xen-VoIP-Server(Asterisk) and at last a VoIP provider.
What I like to do is initiate VoIP calls over my VoIP Server and send
the data (RTP audio stream) directly to my provider. The would work
pretty good if ther wasn't my iptables NAT.

What my NAT is doing or what it is not doing is pretty easy:
=46or some reason my phone (Android CSIPSimple) does a stun lookup on
the same port (source port of the packet) it will later on use for the
RTP VoIP stream. So the Linux conntrack "sees" this successful
connection, and once my phone tries to use the same source port for
the RTP connection to the VoIP server, the conntrack module does a
port mapping ... Which is not needed as we are talking about the UDP
protocol. It is O.K. to use one UDP port with many PC's.
Does anyone know how to change my setup to get this working, or is it
simply impossible. Is conntrack that stupid and cannot handle these
kind od connections (our CISCO router at work doesn't seem to have a
problem with this setup...)

Here is my setup:
Linux NAT Box:
Code:

/sbin/iptables -t nat -A POSTROUTING -j MASQUERADE -s 192.168.0.0/16

(I tried it with SNAT as well, but that doesn't make a difference)

and this is my Conntrack -E log for this connection:
Code:

smartbyte:~ # conntrack -E
# Here is the STUN-Part
[NEW] udp      17 60 src=3D192.168.1.38 dst=3D216.93.246.14 sport=3D446=
08
dport=3D3478 [UNREPLIED] src=3D216.93.246.14 dst=3D114.XX.234.123 sport=
=3D3478
dport=3D44608
[NEW] udp      17 60 src=3D192.168.1.38 dst=3D216.93.246.14 sport=3D578=
90
dport=3D3478 [UNREPLIED] src=3D216.93.246.14 dst=3D114.XX.234.123 sport=
=3D3478
dport=3D57890
[UPDATE] udp      17 59 src=3D192.168.1.38 dst=3D216.93.246.14 sport=3D=
44608
dport=3D3478 src=3D216.93.246.14 dst=3D114.XX.234.123 sport=3D3478 dpor=
t=3D44608
[UPDATE] udp      17 59 src=3D192.168.1.38 dst=3D216.93.246.14 sport=3D=
57890
dport=3D3478 src=3D216.93.246.14 dst=3D114.XX.234.123 sport=3D3478 dpor=
t=3D57890
[UPDATE] udp      17 600 src=3D192.168.1.38 dst=3D216.93.246.14
sport=3D44608 dport=3D3478 src=3D216.93.246.14 dst=3D114.XX.234.123 spo=
rt=3D3478
dport=3D44608 [ASSURED]
[UPDATE] udp      17 600 src=3D192.168.1.38 dst=3D216.93.246.14
sport=3D57890 dport=3D3478 src=3D216.93.246.14 dst=3D114.XX.234.123 spo=
rt=3D3478
dport=3D57890 [ASSURED]
# STUN ended - Two connections assureds, ports: 44608 and 57890
# Now we try to connect to the VoIP Server source port 44608 and 57890
[NEW] udp      17 60 src=3D122.XX.115.203 dst=3D114.XX.234.123 sport=3D=
10020
dport=3D44608 [UNREPLIED] src=3D114.XX.234.123 dst=3D122.XX.115.203
sport=3D44608 dport=3D10020
[NEW] udp      17 60 src=3D192.168.1.38 dst=3D122.XX.115.203 sport=3D57=
890
dport=3D10021 [UNREPLIED] src=3D122.XX.115.203 dst=3D114.XX.234.123
sport=3D10021 dport=3D57890
[NEW] udp      17 60 src=3D192.168.1.38 dst=3D122.XX.115.203 sport=3D44=
608
dport=3D10020 [UNREPLIED] src=3D122.XX.115.203 dst=3D114.XX.234.123
sport=3D10020 dport=3D1030
# And from that point on it goes down the drain!
# Se the port mapping to port 1030!!!???!!!! Why?!
[UPDATE] udp      17 59 src=3D192.168.1.38 dst=3D122.XX.115.203
sport=3D44608 dport=3D10020 src=3D122.XX.115.203 dst=3D114.XX.234.123
sport=3D10020 dport=3D1030
[UPDATE] udp      17 600 src=3D192.168.1.38 dst=3D122.XX.115.203
sport=3D44608 dport=3D10020 src=3D122.XX.115.203 dst=3D114.XX.234.123
sport=3D10020 dport=3D1030 [ASSURED]
# The connection is assured, because Asterisk is basically listening
to everything on that port and changes the port it send the data back
# But my VoIP Provider is not that intelligent. :-((( F!
[NEW] udp      17 60 src=3D192.168.1.38 dst=3D62.52.147.185 sport=3D446=
08
dport=3D35642 [UNREPLIED] src=3D62.52.147.185 dst=3D114.XX.234.123
sport=3D35642 dport=3D1030
[NEW] udp      17 60 src=3D62.52.147.185 dst=3D114.XX.234.123 sport=3D3=
5642
dport=3D44608 [UNREPLIED] src=3D114.XX.234.123 dst=3D62.52.147.185
sport=3D44608 dport=3D35642
[NEW] udp      17 60 src=3D62.52.147.185 dst=3D114.XX.234.123 sport=3D3=
5643
dport=3D44609 [UNREPLIED] src=3D114.XX.234.123 dst=3D62.52.147.185
sport=3D44609 dport=3D35643
[NEW] udp      17 60 src=3D192.168.1.38 dst=3D62.52.147.185 sport=3D578=
90
dport=3D35643 [UNREPLIED] src=3D62.52.147.185 dst=3D114.XX.234.123
sport=3D35643 dport=3D57890

Please can anyone tell me what I am doing wrong? Is ther a switch
somewhere to disable port mapping for the UDP protocol? (And have a
real symmetric NAT?)

Please I need that fixed! Any help appreciated, even if you can point
me to the responsible person for the conntrack module.

Thanks for any answer, SB.

--
Bye Bye, J=C3=B6rn Krebs
