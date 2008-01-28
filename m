From: Benny Amorsen <benny+usenet@amorsen.dk>
Subject: Re: SNAT every packet in a connection
Date: Mon, 28 Jan 2008 09:27:58 +0100
Message-ID: <m31w82pd69.fsf@ursa.amorsen.dk>
References: <68252ab80801271847s35873e0fs19480eaf9c31f7fa@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

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


