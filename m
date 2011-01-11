From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Best way to kill a live TCP connection?
Date: Tue, 11 Jan 2011 15:10:24 -0600
Message-ID: <4D2CC740.9090007@riverviewtech.net>
References: <4D2C4E92.6040902@tana.it> <alpine.LNX.2.01.1101111537180.8612@obet.zrqbmnf.qr> <4D2C8374.70408@tana.it> <4D2C95ED.70805@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D2C95ED.70805@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 01/11/11 11:39, Pascal Hambourg wrote:
> However this sends only one RST to one side of the connection,
> leaving the connection half-open - until the other side sends a
> packet and gets a RST too. IMO it would be more elegant to send RSTs
> to boths sides of the connection.

Wouldn't it be possible to send packet to user space and have something 
else send the reset packets to both ends?  I.e. use IPTables to match 
the packets and have a user space daemon act on what IPTables matched.

(I'm speaking out of my arse here, so ignore me if I'm way off base.)



Grant. . . .
