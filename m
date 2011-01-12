From: Alessandro Vesely <vesely@tana.it>
Subject: Re: Best way to kill a live TCP connection?
Date: Wed, 12 Jan 2011 09:52:24 +0100
Message-ID: <4D2D6BC8.80602@tana.it>
References: <4D2C4E92.6040902@tana.it> <alpine.LNX.2.01.1101111537180.8612@obet.zrqbmnf.qr> <4D2C8374.70408@tana.it> <4D2C95ED.70805@plouf.fr.eu.org> <4D2CC740.9090007@riverviewtech.net> <alpine.LNX.2.01.1101112328480.25575@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tana.it; s=test;
	t=1294822344; bh=yO3IJOgKEAMJMiFYT2s0+JlqKVk7A4XdzxGXWj1KP4o=;
	l=1017;
	h=Message-ID:Date:From:MIME-Version:To:References:In-Reply-To:
	 Content-Transfer-Encoding;
	b=VVzUIFzLuq7b0wgh7DhAywnNsf34/BopJW2IlZt2m968OYJ8XiRlTS5sCVebWaCfq
	 FoBFsBYO/uJwzZ4udrOlnL9J3K8pqvNSOCB8xJfOwK6455XhyAlAPQxGdmXSl1cn0Q
	 tVaCbZ+swqWDzzzhv/GuakWyLtdKloy7XFsoqCMI=
In-Reply-To: <alpine.LNX.2.01.1101112328480.25575@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/Jan/11 23:31, Jan Engelhardt wrote:
> On Tuesday 2011-01-11 22:10, Grant Taylor wrote:
>> On 01/11/11 11:39, Pascal Hambourg wrote:
>>> However this sends only one RST to one side of the connection,
>>> leaving the connection half-open - until the other side sends a
>>> packet and gets a RST too. IMO it would be more elegant to send RSTs
>>> to boths sides of the connection.
>>
>> Wouldn't it be possible to send packet to user space and have something else
>> send the reset packets to both ends?  I.e. use IPTables to match the packets
>> and have a user space daemon act on what IPTables matched.
> 
> Well, you could augment ipt_REJECT to send two packets. It does not have 
> to just send one.

Besides practical issues about augmenting modules, RST will never be
as clean as FIN.  I mean, aborting will still be different from
cleanly shutting down.  This particular difference, the minimal-cost
tarpit that results from sending RST to the local end only, may even
have its merits.
