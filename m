From: "Mark Ackerman" <mark.ackerman@gmail.com>
Subject: Netfilter source port manip question
Date: Fri, 21 Sep 2007 15:25:49 -0600
Message-ID: <1a0258560709211425n575a5ff1k550fa7bad0e7b040@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=K4ZAKX2A8q3VOevP6XOCoy2RRHeubQqZ4Ea9TTb9tV0=;
        b=H5tKbM9Di73d/C4BiHQhIPpNugrvDn+LAb8QlYFPluPu5/7zo+qbfo4wLQX/Si25CH1UCk6hFQk9sN/7ZY8R33HPASnvjNdCnozSbq2mXYfMtU/x4eYpX+JLMouirUnmctmH8azU3wfJMQ6WHlohgVgfTu8Ive5zxaDJdlmol4M=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Another try:

I am writing a transparent proxy kernel module to fit an existing
proxy code base. Currently, I am only having problems on packets that
are targetting the proxy directly (ie. the switch issues a GET on the
transparent proxy address).

The iptable rule used is:

iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 36250

I have 3 netfilter hooks coded.

PreRoute: (NF_IP_PRI_NAT_DST + 1)
The preroute hook point looks at the packet and modifies the packet
back to port 80 which the listener is using.  (I know I could modify
the port the listener is using to 36250 etc. But for various reasons
that is not desired.)
For this problem, the daddr is already hitting local so no rewrite is necessary.

PostRoute: (NF_IP_PRI_FIRST)
For locally bound traffic (original daddr and port targetted at
transparent proxy) the packet is just accepted.
For off-box traffic the daddr is changed back to point at the origin server.

LocalOut: (NF_IP_PRI_NAT_SRC - 1)
Here is where I hit the problem.  If the source port is 80, the code
rewrites the port to 3620 (attempting to make NAT happy again).
However, when the ip_nat_fun is called the source port has been set to
1.

Starting to think maybe I need to use a helper function but I am not sure.

Any ideas?

Mark Ackerman
mark.ackerman@gmail.com
