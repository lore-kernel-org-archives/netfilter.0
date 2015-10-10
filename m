From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: iptables 1.4.21 'transient' error
Date: Sat, 10 Oct 2015 01:25:00 -0400
Message-ID: <20151010012500.4b7111aa@playground>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 MAIL1.WPI.EDU t9A5P3vN027888
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wpi.edu; s=_dkim;
	t=1444454703; i=@wpi.edu;
	bh=J5oDlUs92fu6+gGGC0VJ1AXXdKbRQ8cB0aKJ4Hrx6bg=;
	h=Date:From:To:Subject;
	b=p26thHGavQSctF28HPpQKCz9e3r3neDfbvwffUOxjrMC6+Pv2Ls5ygjW81NCY3Kan
	 m/eLE0PchT3AfsSC5RAtCGOpZ4P2m7sD0AnYCcXcROH+TcUHPTsfTPYTwYCEd3y2aT
	 zRAN6hpwkjdmp0Sd0v/XMt9ivn6katZZJqTjjE/w=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I recently bumped Smoothwall to 1.4.21. Now I am seeing the error "commit failed on table mangle: Resource temporarily unavailable" during system boot. I know what is being executed; it always worked on the previous version (1.4.14). And it works OK when I bounce the links after startup. It only fails during boot, and possibly only under certain conditions.

What exactly is this message telling me? That some parts of netfilter are slow to initialize? That 1.4.21 has interlocks that cause failure instead of delay in the case of concurrent access? I need some clues to figure out what's happening and how to work around (or otherwise avoid) the problem.

Thanks!
Neal
