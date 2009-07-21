From: Fabio Marcone <fabio.marcone@duet.it>
Subject: Re: postrouting and mac address
Date: Tue, 21 Jul 2009 15:36:48 +0200
Message-ID: <4A65C470.60301@duet.it>
References: <4A65AF17.70002@duet.it> <c7a3bdd5fcb7f7152ae1a453651aa9d1@localhost> <4A65BE5F.4090007@duet.it> <4A65C2F8.2050407@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A65C2F8.2050407@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org


>
> It is possible (DROP exists in all tables), but should not be done.
I know that drop is only in INPUT, FORWARD and OUTPUT chain...

> Can't you MARK packets in earlier chains (PREROUTING or FORWARD) and 
> use the mark in POSTROUTING ?

perhaps it is the only solution but I would to recognize packets in 
POSTROUTING to send them in a IMQ virtual interface.

Fabio
