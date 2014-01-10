From: maom_onet <maom_onet@poczta.onet.pl>
Subject: Packet logging with dynamic config?
Date: Fri, 10 Jan 2014 11:07:46 +0100
Message-ID: <59896600-eba4f9864a79309ed6ed960ea05c85dc@pmq5.m5r2.onet>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poczta.onet.pl;
	s=2011; t=1389348468;
	bh=/1czStwgBgjoT0psyddlxj4K2P/4wzfCVAQu+DOjXXE=;
	h=Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Date:
	 Message-Id:Subject;
	b=ezJcHPLhDrprGMEZmHdD1DxXVsOPSa9iW1WXKiBHp3ezDNA/RqfyWOpCUuHz3tReW
	 /putN1do9cPp8ZvYXK13R1Vn90PLycO+Qk36C4VbLUZZG2btMQftNEi1yQ1uEUx0MH
	 PdUbEbjmLOAEG1UxRWST+G775DItZniSdi5yFjzw=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Dear Sirs,

I need to capture packets from some subset of interfaces (on a given Linux host), then:
- log all the packets in the pcap format, which is the easy part
- match the packets against a dynamically changing configuration and generate alarms on mismatch

My software is notified about current configuration by a userspace application, probably using dbus, if it matters. So, the software should probably be a userspace application itself.

I have read about possible approaches to achieve this, there are quite many: libpcap, PF_RING, netfilter/iptables probably with ulogd2. I just think that modifying iptables rules according to config changes would be quite complex (opposed to checking if a packet complies with the config or not).

As I am not an experienced networking Linux developer, I would like to ask what would be the best approach from
1. Performance
2. Easy of implementation (the less/easier code, the better),

in that order, point of view?

Thank you,

Marek
