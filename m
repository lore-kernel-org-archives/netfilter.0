From: Stefan Sabolowitsch <Stefan.Sabolowitsch@felten-group.com>
Subject: Need help with drop rules and nfqueue
Date: Fri, 28 Feb 2014 09:16:36 +0000
Message-ID: <5E9F3882-4A77-43C6-9E17-434876B8D00F@felten-group.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=felten-group.com;
	s=feltengroup_com; l=869; t=1393579002; x=1394183802; q=dns/txt;
	h=DomainKey-Signature:Received:VBR-Info:Received:From:To:Subject:
	Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	Content-Language:Content-Type:Content-ID:
	Content-Transfer-Encoding:MIME-Version; bh=/7B+wCWPIuJp9yKXjR5yf
	ptWi8joGi5jxM6wjbfQo+0=; b=i8wOSFo8KDD496IcPEr1dJe7GRP0r6iur2MBn
	0XhxGEuIZnYIfF1vlKqNV5+PUTbJiay2mIUT6BfzaionneqhffEuGKPRgoHIEFRz
	dxyqIdnvRHpw8Z8by97dgq/ayK8ioYaU94ISTkNb/9U5IFIqAK1hGY/rm1TtNth0
	GgCGCc=
Content-Language: de-DE
Content-ID: <143635D5C12DC14CA746CE13031F15E3@felten-group.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi all,
need help with a drop rule and nfqueue
Currently i have this filter rule, that sends all traffic from the bridge bra to nfqueue (IPS System).

-A FORWARD -i br0 -j NFQUEUE --queue-balance 0:3 --queue-bypass

But i want to send there only certain traffic, example:

-A FORWARD -i br0 -p udp -j NFQUEUE --queue-balance 0:3 --queue-bypass
-A FORWARD -i br0 -p icmp -j NFQUEUE --queue-balance 0:3 --queue-bypass
-A FORWARD ! -s 192.168.1.43/32 -i br0 -p tcp -m multiport ! --ports 80,443 -j NFQUEUE --queue-balance 0:3 --queue-bypass

This will not work 100%. With this filter rules not all traffic go to the nfqueue.

Therefore my question.
How can i prevent that an IP address (example 192.168.1.43) to certain ports (80,443) comes to nfqueue.
It is important that no traffic in br0 is lost.

Thanks for any help here.
Stefan
 


