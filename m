From: whiplash <whiplash@bofhland.org>
Subject: Re: NAT Port Forward problem in a not so simple network
Date: Tue, 15 Apr 2008 14:15:25 +0200
Message-ID: <48049C5D.8040104@bofhland.org>
References: <480479E8.3040904@naxe.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <480479E8.3040904@naxe.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Fabio De Paolis <fabiodepaolis@naxe.it>
Cc: netfilter@vger.kernel.org

Fabio De Paolis ha scritto:

> Packet 4 Cisco1 reset the communication, perhaps because he wait a reply 
> from HPpro1 and not Cisco2?

Of course.
A possible solution is to SNAT packets exiting from 192.168.0.11
with destination 192.168.0.2.
