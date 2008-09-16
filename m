From: John Haxby <john.haxby@oracle.com>
Subject: Re: Https website is not accessible once transparent proxy is set
   up
Date: Tue, 16 Sep 2008 14:50:12 +0100
Message-ID: <48CFB994.1060404@oracle.com>
References: <A42989E6EE1BCE4C9C1FF7DE428FF3C6630F@mos-exchange.mosmsg.com.sg>    <18b30431bfdfb986412e296c4bc9aad1.squirrel@www.arcoscom.com>    <48CF9644.7010504@oracle.com> <fb6debad85eb3106cd197c989db6027c.squirrel@www.arcoscom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <fb6debad85eb3106cd197c989db6027c.squirrel@www.arcoscom.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux@arcoscom.com
Cc: netfilter@vger.kernel.org

ArcosCom Linux User wrote:
> El Mar, 16 de Septiembre de 2008, 13:19, John Haxby escribi=F3:
>  =20
>> Well, not by squid, but the connection can be transparently proxied.=
   I
>> have a tiny transparent proxy that redirects all connections to any =
port
>> outside an intranet to a connection through an HTTP CONNECT request.
>>
>>    =20
> As I now (and have working some HTTP proxyes with squid+iptables), th=
e
> problem are the requests.
>
> Well, when you do a REDIRECT from 80 to 3128 (for squid), the squid m=
ust
> know that it is working in transparent mode to process correctly the =
HTTP
> requests, because they aren't directly for the proxy.
>
> If you use the same theory for any other protocol, the "proxy" must k=
now
> how to process correctly these type of connections.
>
> What "tiny transparent proxy" are you using? Perhaps, anybody could h=
elp
> you in any trick with it!!.
>
>  =20

It's a small program that basically accepts connections, creates an=20
onward connection to the http proxy at the periphery and sends an=20
appropriate CONNECT <addr>:<port> request.

The address and port come from this

    struct sockaddr_in sin;
    socklen_t len =3D sizeof(sin);
    getsockopt (sock, SOL_IP, SO_ORIGINAL_DST, &sin, &len);
    sprintf(buf, "CONNECT %s:%d HTTP/1.0\r\n\r\n",
           inet_ntoa(sin.sin_addr), ntohs(sin.sin_port));

I can't remember if I found this by grepping the squid source code or=20
from a different web proxy.  I really must find the time to pretty up m=
y=20
program (and remove the bug that makes it crash from time to time) so I=
=20
can publish it somewhere for general consumption.   It saves having to=20
configure world+dog to use a proxy.

jch
