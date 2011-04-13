From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: Problem with iptables -j TEE
Date: Wed, 13 Apr 2011 14:10:20 +0200
Message-ID: <20110413141020.4d30dca1@catus>
References: <BANLkTik2sHtuWOr64ty4yQhjP5EYwD20pg@mail.gmail.com>
	<BANLkTik_H3PYFvWde5c2MOGtEeAdYvOz9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTik_H3PYFvWde5c2MOGtEeAdYvOz9Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: JOSE FELIX HERNANDEZ BARRIO <jose.hernandez@isthari.com>
Cc: netfilter@vger.kernel.org

Hi,

>I'm trying to copy the incoming traffic by tcp to another host using
>TEE.
>My command:
>iptables -t mangle -A PREROUTING -p tcp -j TEE --gateway 192.168.0.100
>And the error:
>iptables: No chain/target/match by that name.
>any tip?

Answer is in the thread from 8 days ago:
http://www.spinics.net/lists/netfilter/msg50656.html

Best regards,
Marek Kierdelewicz
