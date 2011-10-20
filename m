From: Erik Schweigert <ejschweigert@gmail.com>
Subject: Re: Netfilter TCP Established Timeout
Date: Thu, 20 Oct 2011 12:10:44 -0700
Message-ID: <CADVVA49349gKbXWK8j9dhGXQ5o2JRT019Jsxyv1vD7zP6j6B+g@mail.gmail.com>
References: <CADVVA4-XORAyHOLxx-x9RGxEDWmpP=5hxqwxqCaHXv-13WXqaw@mail.gmail.com>
	<1319081811.26694.2.camel@hakkenden.homenet>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=CHWvp8JcwYx6NCL18jsHQc2SCjy1JYFIYJNXyiZLt6o=;
        b=lg2WqrI3PQlkUSBYQ5AAfhSS3hdBcX0dZ4rY0ic7BMTwDHAH7oI1TFNBKlrdYGGsZg
         ym8nh1e0jqy8DE+81+cw4jp91bms7KznlsmoLj8abeMW4dQE6bIp0vjsGgD6yTxLTNEi
         6P4Xszd31kJ/JO8v7s6xqUKm10klb2yqCd+PM=
In-Reply-To: <1319081811.26694.2.camel@hakkenden.homenet>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: "Nikolay S." <nowhere@hakkenden.ath.cx>
Cc: netfilter@vger.kernel.org

On Wed, Oct 19, 2011 at 8:36 PM, Nikolay S. <nowhere@hakkenden.ath.cx> =
wrote:
>
> =F7 =F3=D2=C4, 19/10/2011 =D7 12:03 -0700, Erik Schweigert =D0=C9=DB=C5=
=D4:
> > Hi all,
> >
> > I have noticed an oddity in the timeout values of a TCP Established
> > connection. =9AI currently have the
> > "nf_conntrack_tcp_timeout_established =3D 1800".
> >
> > # cat /proc/net/nf_conntrack =9A| grep EST
> > ipv4 =9A =9A 2 tcp =9A =9A =9A6 1385 ESTABLISHED src=3D192.168.10.2=
5
> > dst=3D192.168.10.134 sport=3D2513 dport=3D1217 packets=3D71 bytes=3D=
10154
> > src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1217 dport=3D2513 =
pac1
> > ----> ipv4 =9A =9A 2 tcp =9A =9A =9A6 1799 ESTABLISHED src=3D192.16=
8.10.25
> > dst=3D192.168.10.134 sport=3D2550 dport=3D1217 packets=3D1142 bytes=
=3D121874
> > src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1217 dport=3D2550 =
1
> > ipv4 =9A =9A 2 tcp =9A =9A =9A6 1413 ESTABLISHED src=3D192.168.10.2=
5
> > dst=3D192.168.10.134 sport=3D2515 dport=3D1217 packets=3D824 bytes=3D=
101370
> > src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1217 dport=3D2515 =
p1
> > ipv4 =9A =9A 2 tcp =9A =9A =9A6 263 ESTABLISHED src=3D192.168.10.25
> > dst=3D192.168.10.134 sport=3D2440 dport=3D1101 packets=3D41 bytes=3D=
6458
> > src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1101 dport=3D2440 =
packe1
> > ipv4 =9A =9A 2 tcp =9A =9A =9A6 1221 ESTABLISHED src=3D192.168.10.2=
5
> > dst=3D192.168.10.134 sport=3D2512 dport=3D1101 packets=3D79 bytes=3D=
13578
> > src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1101 dport=3D2512 =
pac1
> > # cat /proc/net/nf_conntrack =9A| grep EST
> > ipv4 =9A =9A 2 tcp =9A =9A =9A6 1369 ESTABLISHED src=3D192.168.10.2=
5
> > dst=3D192.168.10.134 sport=3D2513 dport=3D1217 packets=3D71 bytes=3D=
10154
> > src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1217 dport=3D2513 =
pac1
> > ----> ipv4 =9A =9A 2 tcp =9A =9A =9A6 296 ESTABLISHED src=3D192.168=
=2E10.25
> > dst=3D192.168.10.134 sport=3D2550 dport=3D1217 packets=3D1166 bytes=
=3D124610
> > src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1217 dport=3D2550 =
p1
> > ipv4 =9A =9A 2 tcp =9A =9A =9A6 1396 ESTABLISHED src=3D192.168.10.2=
5
> > dst=3D192.168.10.134 sport=3D2515 dport=3D1217 packets=3D824 bytes=3D=
101370
> > src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1217 dport=3D2515 =
p1
> > ipv4 =9A =9A 2 tcp =9A =9A =9A6 247 ESTABLISHED src=3D192.168.10.25
> > dst=3D192.168.10.134 sport=3D2440 dport=3D1101 packets=3D41 bytes=3D=
6458
> > src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1101 dport=3D2440 =
packe1
> > ipv4 =9A =9A 2 tcp =9A =9A =9A6 1205 ESTABLISHED src=3D192.168.10.2=
5
> > dst=3D192.168.10.134 sport=3D2512 dport=3D1101 packets=3D79 bytes=3D=
13578
> > src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1101 dport=3D2512 =
pac1
> >
> > You will notice in the two iterations I have marked above, the time=
out
> > values goes from 1799 to 296 within a 16 second span. =9AIs this a =
bug
> > or something inherent to the connection tracking system that I unaw=
are
> > of.
>
> TCP conntrack allows 5 minutes (300 seconds) for hosts to send the
> acknowledge. Once connection has no unacknowledged segments, timeout
> will revert to 1800 seconds.

Is this also a user settable value?

>
> >
> > I am running kernel 2.6.26.5. My current settings of the tunable
> > conntrack features are:
> >
> > nf_conntrack_tcp_be_liberal =3D 0
> > nf_conntrack_tcp_loose =3D 1
> > nf_conntrack_tcp_max_retrans =3D 3
> > nf_conntrack_tcp_timeout_close =3D 10
> > nf_conntrack_tcp_timeout_close_wait =9A=3D 60
> > nf_conntrack_tcp_timeout_established =3D 1800
> > nf_conntrack_tcp_timeout_fin_wait =3D 120
> > nf_conntrack_tcp_timeout_last_ack =3D 30
> > nf_conntrack_tcp_timeout_max_retrans =3D 300
> > nf_conntrack_tcp_timeout_syn_recv =3D 60
> > nf_conntrack_tcp_timeout_syn_sent =3D 120
> > nf_conntrack_tcp_timeout_time_wait =3D 120
> >
> > Any help or suggestions is appreciated,
> > Erik
> > --
> > To unsubscribe from this list: send the line "unsubscribe netfilter=
" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at =9Ahttp://vger.kernel.org/majordomo-info.htm=
l
>
>



--
Erik Schweigert
Email:=9Aejschweigert@gmail.com
Website:=9Ahttp://www.lainoox.com
