From: Lars Nooden <lars.curator@gmail.com>
Subject: CPU-based load balancing and IPTables
Date: Thu, 15 Oct 2009 21:36:06 +0300
Message-ID: <4AD76B96.10406@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:x-enigmail-version:content-type
         :content-transfer-encoding;
        bh=wl0sUyz73rRh4GinD3eIWbT1AGC781oaSQF9JTn5ELM=;
        b=RnR6PYWkM6ctuctHCQld7MHslPr+Y8b9ViN6cgQWTeWqhKIPN+ip6QtCIPC5YTyHX2
         CBliJl95sbdGO9WmJJCkS14uGje4fWT+J2GKGp0pKLpFuGQVrLQ5YU8MrWt39AW3999b
         cjqkOswfVTRNT3IRU2jDr8uUTjyeUE6DB6Hj4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Where should I look for putting together IPTables based load balancing
based on CPU-load of the targets so that new connections would be
distributed to machines with the lowest CPU load?
(IFF that is the 'right' way)

The load balancing I've seen mentioned in the archives and in the man
page for iptables seems to be traffic-based or some kind of probability
or round-robin.  There are also prominent load balancing software
specializing in HTTP/HTTPS, but how about generic traffic, such as a
terminal server?  The traffic load to any given terminal server might
not be that great nor in proportion to the CPU activity.

	                      net
	                       |
	                    iptables
	                       |
	         +------+------+------+------+
	         |      |      |      |      |
		LTS1   LTS2   LTS3   ...    LTSn

Is there some pre-existing example, or a sensor that can be monitored on
the servers and used to nudge IPtables on the switch?

Regards
/Lars
