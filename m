From: Igor S <nat4592@scarlet.be>
Subject: Re: SNAT range does not use unique IP
Date: Tue, 17 Dec 2013 12:05:53 +0100
Message-ID: <c49582c73d9f5580c01ce5df893044a8@scarlet.be>
References: <e7ab2e194832d5b3253cf7d6cdde9f63@scarlet.be>
 <20131212223443.GA2211@home> <dbbe65eac46a94f6da1bf3b22ec75b34@scarlet.be>
 <20131213172115.GB3067@home> <b52fefde900473c435ec56a50c2f5242@scarlet.be>
 <52AEC675.4020702@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scarlet.be;
	s=scarlet; t=1387278354;
	bh=cXv9pMxNw9NFUM8wuUi1wsCxI87CEmcV988ZwasPOWA=;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:
	 Cc:Subject:In-Reply-To:References:Message-ID;
	b=uxqxeKzgB4w9/qeeQjxIbM0k0QQcFjqxCWFCsV5/zHF8ww8SYgulHLEXvp8H7TgXW
	 KZFi/HAvuCfyc5bXfEOujciGre5eTbcldvaCRy0lI8DGei7n+FiDRzOGHmURrVJ4hR
	 3HBc9YbKrlSKJ8mZFqbtBiHBfzMWU1KcK/JKWuUM=
In-Reply-To: <52AEC675.4020702@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

On Mon, 16 Dec 2013 10:23:01 +0100, Pascal Hambourg wrote:
> Igor S a =C3=A9crit :
>>
>> Understood. But is it normal that NAT uses absolutely the same=20
>> IP/port
>> combination for different source IP's?
>
> Yes, as long as the destination address/port are different.

OK. that does not allow to maintain the required consistency in the=20
target network. Different clients may use the same SRC IP; the same=20
client may appear to use different SRC IP addresses when talking to=20
different servers in the same destination network.

Any suggestions how I could change the NAT code to prevent it from=20
using the same SNAT IP address for different clients?

Thanks,
Igor

