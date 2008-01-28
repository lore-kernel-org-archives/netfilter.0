From: "Ashok Rao" <greatarbor@gmail.com>
Subject: Re: SNAT every packet in a connection
Date: Mon, 28 Jan 2008 12:44:39 -0500
Message-ID: <68252ab80801280944r6f1df61btd74b0feff72be92@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=IEa0Rk7LPa0VEjUfWMzHOeckNcZygAu3/gBQ6jg+cNI=;
        b=QCuW5Dc5LNKysQoWJl54Z4H2Kr28ZEk+eoWNwbsSktFCNh4kRTsU0sdtn9LlJWaaUvWHf+I0JOlLkPUrhCo6lxgGA2dlE0IJUKDuAxx8L+EKpD1SYfsKjsQvgij4hrvT1tYDWOoLKrYdlherDbQXgfEfNH/jsv26f5mXXmSKG9Q=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I should have explained in my original posting that this is for Point
to Point application. I have a
server at the other end  (receiving end of the connection) which will
receive these packets, make the source IP the same and
deliver to the LAN.
And as I said - I am already doing this today - albeit with many caveats such as
a) Point to Point load-balancing only (remote to central site)
b) Currently handle only one host in remote site





"Ashok Rao" <greatarbor@gmail.com> writes:

> From whatever I've read and seen myself, the NAT table is only
> traversed for the first packet of a connection. Hence packets in a
> single connection will always be SNATed to the same IP - Hence the
> packets going out on one of the interfaces will not have the right
> source IP.

The receiving end of the connection will be rather confused when it
gets 10 packets from 1.1.1.1 followed by 10 packets from 2.2.2.2 in
the same connection. Or rather, it should just drop the ones from
2.2.2.2.

What you want is basically impossible.


/Benny
