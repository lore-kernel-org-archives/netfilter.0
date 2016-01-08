From: Hannes Frederic Sowa <hannes@stressinduktion.org>
Subject: Re: Configure ICMP error source address
Date: Fri, 8 Jan 2016 17:21:13 +0100
Message-ID: <568FE1F9.9020101@stressinduktion.org>
References: <568F8207.9040305@heinlein-support.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	stressinduktion.org; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=Zlo+hGQllpSZGkQQ
	J1frNcEkil4=; b=iH5NPoeB8hcghSrcwD/JZ/l+FaNfRYg/zuk5LKbuP4g8eF7A
	o+ggCEVUCcaJnVWt6k7zJZ7S7LlhAsgEvp5pZMGNPvu5BZlyqEKdmjJazARjhLyG
	SmJZYdYpSd1illNQSSWrJkwbEO8XGNynQYZX1LhvPG5MG6iR61pwR62B3fE=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=Zlo+hGQllpSZGkQ
	QJ1frNcEkil4=; b=iTIx5ANL0Rvp+/G+N6pRONXk8GGDBRiYAjHWL59YtdJu2+n
	qb0HAJW1TGXMP5STiAmmZayXGWtg/tNwUH7Jz39dofIznhLILjdVSrOwpy8EJDj4
	o/+K9GiDIIsEXMVJ9EC7ILlmdaeRBddOAn0k6TfxA9Cm6xJ+5tadycrr/piA=
In-Reply-To: <568F8207.9040305@heinlein-support.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Robert Sander <r.sander@heinlein-support.de>, netfilter@vger.kernel.org, netdev@vger.kernel.org

On 08.01.2016 10:31, Robert Sander wrote:
> Is it a good idea to develop a kernel patch that makes it possible to
> select the first IPv4 address on dev lo with scope global as the source
> address for ICMP errors? Would that do any harm to the Internet at large?

I think the way to go is to have a ip rule option in which the admin can 
add routes which get consulted only by the icmp source address 
determination logic. I can assume that some other installations use 
other interface number logic or multiple public addresses. This kind of 
lookup seems to allow all possible lookup scenarios.

Thoughts?

Hannes

