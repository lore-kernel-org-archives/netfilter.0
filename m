From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Best way to kill a live TCP connection?
Date: Tue, 11 Jan 2011 23:31:10 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1101112328480.25575@obet.zrqbmnf.qr>
References: <4D2C4E92.6040902@tana.it> <alpine.LNX.2.01.1101111537180.8612@obet.zrqbmnf.qr> <4D2C8374.70408@tana.it> <4D2C95ED.70805@plouf.fr.eu.org> <4D2CC740.9090007@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D2CC740.9090007@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Tuesday 2011-01-11 22:10, Grant Taylor wrote:

> On 01/11/11 11:39, Pascal Hambourg wrote:
>> However this sends only one RST to one side of the connection,
>> leaving the connection half-open - until the other side sends a
>> packet and gets a RST too. IMO it would be more elegant to send RSTs
>> to boths sides of the connection.
>
> Wouldn't it be possible to send packet to user space and have something else
> send the reset packets to both ends?  I.e. use IPTables to match the packets
> and have a user space daemon act on what IPTables matched.

Well, you could augment ipt_REJECT to send two packets. It does not have 
to just send one.
