From: =?ISO-8859-1?Q?Fl=E1vio_Costa?= <fcosta75@gmail.com>
Subject: Help with multiple interfaces and aliases
Date: Tue, 9 Feb 2010 13:31:21 -0300
Message-ID: <9b7febdd1002090831s69812ad7l39ba24dbca671571@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=eAy36NV7ToNg8umcitLIU+LGk40BXr45ef2KvN7C+68=;
        b=G5oVkRUUPXreXN6E9JrP3BQxCvZwzYztDRfixTp4AlMyV+FJAYQPm50UDkC4tEYv4K
         UXBND8YM38EeHm4z0YxKxz5NOa7mB2aKTMrjBrYIvAwgTCaAc1EwawlOXRpDy83kBroU
         cU9hD+603BKhNk3ueWb5PO0x00ztJlDcteO44=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi.

I have the following configuration:

- 2 NICs
=A0- 1 NIC is connected to a cable modem with dynamic IP. This is my de=
fault
route to all garbage traffic.
=A0- 1 NIC is connected to a dedicated line, fixed IP address, through =
a
CISCO router. With this kind of connection, I have 4 available IP addre=
sses,
but at this moment, I'm using only one. This is used to host webserver,=
 ssh,
vpn, mail.

Everything is working fine.My domains are served by an external DNS ser=
ver.

I want to host a DNS server to serve my domains, and my registrar requi=
res 2
DNS servers, one master and one secondary. I configured bind and it's
working fine for my external interface, so I have my main DNS server. A=
ll I
have to do now is create the secondary DNS server.

The idea I had is to use an alias for my external interface (eth4:1) an=
d
assign one of the remaining available IP addresses. So I created the et=
h4:1
interface, and configured bind to listen that new interface. But the pr=
oblem
is that I cannot ping that interface from outside. I don't know what's =
going
wrong. Ping packets appear in syslog, but it seems my machine cannot re=
ply
back. I tried to mark them, but didn't work out.

Any help?

Thanks in advance.

=46lavio
