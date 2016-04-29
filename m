From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: bursts of INVALID packets
Date: Fri, 29 Apr 2016 19:51:29 -0400
Message-ID: <20160429195129.2e5b9d27@playground>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 MAIL1.WPI.EDU u3TNpXrh025445
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wpi.edu; s=_dkim;
	t=1461973893; i=@wpi.edu;
	bh=xcq2Ita+kf5DzrNAdY2Ha7j0yc1bGPhM7rUL6WIkmo0=;
	h=Date:From:To:Subject;
	b=skTFOfG9J9rzQaNYRr42tWOl9Gk8YwsKrgpe0ChqXitkSiDbHHoCqVgO65uwuM00g
	 vLDfd0Z5HQFOSlR4ZtPvNyYZyzBkQMVZt7BgmX3vHd5ZxbsWuh4nFB8LfBfkYa60r3
	 r1GP3jwkTKECwVva12A+XAPPKhqE4FVCh5rXH+QQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Kernel: 3.4.112
Iptables: 1.4.21
System: Smoothwall Express 3.1

This isn't exactly a problem; it's more of an oddity that raises some questions.

Take two linux systems. Using ssh (and a shell script), transfer /dev/zero from one to /dev/null on the other. With a decent system and 100Mb NICs, they should climb to about 97Mb/s in and out. Very nice. Now interrupt one with CTRL/C. All of a sudden, a burst of INVALID RST packets arrives at (at least) one side. The number of packets in the burst can be from few to many.

I surmise that one side buffered a bunch of packets and continued to transmit them after the transfer was interrupted. The other side received these packets, noted the now-closed connection, and sent RST packets back. The one side, upon receiving the RST packets, marked them INVALID and logged them. All is working as expected.

This leads to my questions. Can (or could, or should) netfilter detect that outgoing packets belong to closed conns and mark them INVALID? Should netfilter be able to detect and drop INVALID packets on output? Or, as an alternative, should netfilter be able to see that a conn is closed and mark outgoing packets INVALID so that rules can handle them? Is it worth the CPU cycles to do this?

Dropping INVALID packets on input (mangle:PREROUTING) works marvelously.

Of course, if the outgoing packets have already left netfilter and are queued for transmission, netfilter is out of the loop and cannot stop them.

Aside, I've bumped SWE3.2 to iptables 1.6.0; but it'll be a long while before 3.2 is releasable.

Thanks,
Neal
