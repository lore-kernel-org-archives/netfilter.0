From: gapsf@yandex.ru
Subject: Is DDR qdisc capable for bandwidth sharing between classes in a specific proportion?
Date: Tue, 17 Sep 2013 12:02:57 +0700
Message-ID: <578924965.20130917120257@yandex.ru>
Reply-To: gapsf@yandex.ru
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1379394178;
	bh=vRiUUMbaMFJfPYUJV7HmX24b2lvc/dO4B1Bu9F9Ljws=;
	h=Date:From:Reply-To:X-Priority:Message-ID:To:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	b=stw+LGp6SCYo3XWB8NH3wbhC62QMRI6XxUTzXBqnJ8XxYolvF0iWMMC2lfBzEpVKt
	 48VtWMH3cUFGOzj2HWfi6UlhEVKhAMLCnGGH5DYPVY5EhxlGYADE9F02/dB12OaBDm
	 +NyzLYlL0MFizi/pfgyFWMFHdt5wMhrDHX7zpJa0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi!
I would like to ask question about DRR qdisc.
Is DDR designed for bandwidth sharing between classes proportionally to 'quantum' parameter?

Consider example:
tc qdisc add dev eth0 root handle 1: htb
tc class add dev eth0 parent 1: classid 1:1 htb rate 100mbit ceil 100mbit
tc qdisc add dev eth0 parent 1:1 handle 2: drr
tc class add dev eth0 parent 2: classid 2:1 drr quantum 1500
tc class add dev eth0 parent 2: classid 2:2 drr quantum 3000
tc filter add dev eth0 parent 1: protocol ip prio 1 u32 match ip dport 8111 0xffff classid 2:1
tc filter add dev eth0 parent 1: protocol ip prio 1 u32 match ip dport 8112 0xffff classid 2:2

Here, for 1500 byte packets, I expect packets classified for 2:2 will be dequeued as twice often
as packets for class 2:1.
The result is a 2:2 class will receive two times greater bandwidth than the class 2:1, isn't it?

Regards.

