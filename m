From: Eli Hadad <elhadad@cisco.com>
Subject: iptables and performance
Date: Tue, 13 May 2008 09:59:25 +0300
Message-ID: <1210661965.5829.227.camel@localhost.localdomain>
References: <1210661080.5829.225.camel@localhost.localdomain>
Reply-To: elhadad@cisco.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1210661080.5829.225.camel@localhost.localdomain>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=495; t=1210661967; x=1211525967;
	c=relaxed/simple; s=amsdkim1002;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=elhadad@cisco.com;
	z=From:=20Eli=20Hadad=20<elhadad@cisco.com>
	|Subject:=20iptables=20and=20performance
	|Sender:=20;
	bh=gTEkyAgXE2XwMrGOo2u51MzypadDvsoBeT1id7qZCw0=;
	b=qJe2HW6xHas38O3/cTXEjWvzaJfyUf5JkewjMO6Z5uBKfkWVtrq/tOON04
	bOd6exrSA8s7lZ1jte13H1QONwfd/cEZBwdUK9kK4aYVHl0bzYuSovrfC9f6
	QeOsmB5dG8;
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


Hi all,

I am new to iptables and have few question I hope you can help with:
1. Is there a limit to the number of rules I can add to specific chain?
I need to have around 20000 rules.
2. What is the performance implications of using this large number of
rules? Is there any numbers people can share.
3. I also saw the HIPAC project which claim to have much better
performance. Is there any work done to integrate same type of
functionality into iptables?

Thanks in advance,
Eli

