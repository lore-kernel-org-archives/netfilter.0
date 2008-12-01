From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: RE: Sending packets through different interfaces and with different IPs to the same destination
Date: Mon, 1 Dec 2008 12:25:47 -0800
Message-ID: <49344860.20038e0a.4384.654a@mx.google.com>
References: <145d4e1a0811280708v19e30a20l5c2928fbedf564f9@mail.gmail.com> <145d4e1a0812011137m69f2d524re51aad494c86064@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:references
         :in-reply-to:subject:date:mime-version:content-type
         :content-transfer-encoding:x-mailer:thread-index:content-language
         :message-id;
        bh=kyBynKYIGMMkeIKC6ahfeWrJQRlpYF6ltmP9qt+lMhA=;
        b=qoikcu6Lzlzbq5smjoU7s6yKbZWfhcuSBQfDOyqvOlc7vrw3zNIBuTJAbZZuCJYn4O
         a7q8q7qO2sSARrtlkkp2yxq2t3z05/gN2Ow4IviBgvTsKwTJzRpjpkbeugLqJ2BTXgUA
         hMbrJkKr4wJs/yPQlElXJPYqSVXn5X0ZfrEWg=
In-Reply-To: <145d4e1a0812011137m69f2d524re51aad494c86064@mail.gmail.com>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?'Javier_G=E1lvez_Guerrero'?= <javier.galvez.guerrero@gmail.com>, netfilter@vger.kernel.org

Assuming this is a lab environment, and all you want to do is check
performance, your easiest solution is not iptables related.
You can run your tests in two different IP subnets, one for the wired a=
nd
one for the wireless.
Optimally, your server would have two physical NICs for a clean test.
Even if it doesn't, you can configure alias addresses on a single NIC o=
n the
server.

> -----Original Message-----
> From: netfilter-owner@vger.kernel.org [mailto:netfilter-
> owner@vger.kernel.org] On Behalf Of Javier G?lvez Guerrero
> Sent: Monday, December 01, 2008 11:38 AM
> To: netfilter@vger.kernel.org
> Subject: Re: Sending packets through different interfaces and with
> different IPs to the same destination
>=20
> Any idea about this?
>=20
> Any help would be much appreciated. Thanks
> Javi
>=20
>=20
> 2008/11/28 Javier G=E1lvez Guerrero <javier.galvez.guerrero@gmail.com=
>:
> > Hi all,
> >
> > I want to monitor the quality of two different interfaces on a
> > client-server architecture. Let the interfaces be a wired ethernet
> > (eth0) and a wireless adapter (ath0). I want to use IPERF to get
> > performance statistics from these two interfaces. In the server I
> > start two different IPERF processes with two different ports (60301
> > for ath0 connections and 60302 for eth0 connections) listening to t=
he
> > client to send dummy packets in order to get statistics.
> >
> > In the client side I have configured interface ath0 with IP x.x.x.1=
78
> > and eth0 with IP x.x.x.179 and I want the IPERF process sending
> > packets to server port 60301 (this is an argument for IPERF) sends
> > them through the ath0 interface with IP 178 and IPERF process sendi=
ng
> > packets to server port 60302 does it through the eth0 interface wit=
h
> > IP 179, just as they are configured. Then the server receives these
> > packets and process them properly (acknowledging them through the
> > correct client interface and IP). It could be seen as a sort of
> > interface load balancing, but all load balancing examples I've foun=
d
> > on the Internet are targeted to router load balancing, and that's n=
ot
> > what I want.
> >
> > I've been reading some iptables documentation through the official
> > site and other similar cases found googling and I've tried some
> > configurations with IPTABLES and IP ROUTE (I have used SNAT, TOS an=
d
> > MARK) in order to get this working but everything I've tried hasn't
> > worked. Always some links fail to get the proper IP or MAC and the
> > configuration becomes unstable after a while, working correctly onc=
e
> > and the next time wrong.
> >
> > I would like someone to help me with any piece of advice, idea or
> > similar experience reporting, then I can make this work as desired.
> > Any help would be much appreciated.
> >
> >
> > Regards,
> > Javi
> >
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

