From: Andrew Beverley <andy@andybev.com>
Subject: Order of match extensions
Date: Thu, 06 Oct 2011 21:55:44 +0100
Message-ID: <1317934544.26402.2370.camel@andybev-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1317934545;
	bh=vdJDhKdy2Lco+uyq/jskQtdC2FB8xqdLkz0sR/WeN60=;
	h=Subject:From:To:Content-Type:Date:Message-ID:Mime-Version:
	 Content-Transfer-Encoding;
	b=WLzZLQe+uIisxbFYVa7j9nwYyAdtdNamnJS0MjssOdE5CbUxFrnnVcEaSBKcZmx/2
	 OpZI4B05DMh/FCuHh5RRgZ3rfFUzpFP3J19HFg7Maa6I/Cm63StHr44fITBjoydppN
	 /3sMqk2d+0GIwa+MDGIOgCr3lK27x6R7RH/TJxrE=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

Does the order of match extensions matter for iptables rules? Can
someone explain why the following 2 rules produce different results:


1. Matches lots of packets as expected:

iptables -t mangle -A FORWARD -i eth0 -m mark ! --mark 99 \
	-m state --state NEW -m statistic --mode nth --every 1 -j LOG


2. Does not match any packets:

iptables -t mangle -A FORWARD -i eth0 -m state --state NEW \
	-m statistic --mode nth --every 1 -m mark ! --mark 99 -j LOG


The only difference is the place of the "mark" match (either at the end
or the beginning).

(Debian iptables v1.4.8)

Andy


