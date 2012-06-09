From: Julien Vehent <julien@linuxwall.info>
Subject: Conntrack & Unreplied exhausts hashsize
Date: Sat, 09 Jun 2012 11:12:47 -0400
Message-ID: <f8da378bd8c865bf9618b0d52f7b4441@njm.linuxwall.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=linuxwall.info; h=
	mime-version:content-type:content-transfer-encoding:date:from:to
	:subject:message-id; s=lnw-dkim; bh=fS0vXG7blXUImTbr2HP71Bf0re9+
	wrmXjjbOatg3pe8=; b=kBroqIkAA4XqZei5MKQ6mK8W1QmLcT1BWyVHOOREsnwE
	MEM/5MU2l2mzU42zgKVCsRPQC8xWrJugysxB+mKaa5vk3fC0+TjnguY/J4t9l+9E
	NXaZMWTb6MV50iZe6NgzpScO+YEjnXu+7tOMnO/OIeQz4pD75EwrDXG7IMxxLQ0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi everyone,

I'm analyzing a configuration problem that we are encountering with 
conntrack at work. We have a farm of frontend servers that run apache. Those 
servers run into the classical table full problem:

     Jun 5 09:57:51 web-front1 kernel: [7177214.445925] nf_conntrack: table 
full, dropping packet.

So I started tuning the kernel of one member of the farm. This server has 2 
interfaces: one public and one in the LAN. The problem is on the public 
interface, it seems that connections in the UNREPLIED state continue to grow 
and never get cleaned up by conntrack. Below is a diagram that shows the 
issue:

http://4u.1nw.eu/conntrack_stat3.png

The orange line counts connections on the public IP that are in the 
unreplied state. The script parses /etc/net/ip_conntrack every 10 minutes 
(nothing fancy, see https://gist.github.com/2901349 ).

My questions are:

Should these UNREPLIED connection get removed from conntrack after a certain 
timeout?

What is the parameter that controls this timeout ?
I'm afraid it might be `net.netfilter.nf_conntrack_tcp_timeout_established = 
432000`, which is 5 days. If this is the case, would it be safe to set this 
parameter to 300 seconds instead (5 minutes) ?

Note: apache runs with `KeepAlive On` and `KeepAliveTimeout 3`, in case this 
might be relevant.


Thanks a lot,
Julien


-- 
Julien Vehent - http://1nw.eu/!j
