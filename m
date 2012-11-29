From: Born Without <blackhole@airpost.net>
Subject: Deleting set/SET rules by exact match fails
Date: Thu, 29 Nov 2012 12:31:10 +0100
Message-ID: <50B7477E.8050603@airpost.net>
Reply-To: blackhole@airpost.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=airpost.net; h=
	message-id:date:from:reply-to:mime-version:to:subject
	:content-type:content-transfer-encoding; s=mesmtp; bh=C4bVPLqmGN
	XqxkYT5GqDAyrsgxs=; b=i0h6cwnaQfDMMpiBA+/S4Kn0KvqEIg5N9pcnP4eEbN
	vgPN4aSPPfmLOnvozJptWhYL5BTTpa9zOtALfL0lHCXH144t8fo5XSvJmvZPLV32
	/ife5R8FjK1G9SP+fdr5iq896/KSOY9RDQJAtIxROEPSrw3OWlXJj2kpD4/gW9N/
	4=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:date:from:reply-to
	:mime-version:to:subject:content-type:content-transfer-encoding;
	 s=smtpout; bh=C4bVPLqmGNXqxkYT5GqDAyrsgxs=; b=MXOMtyCLbJwF/on74
	Zl7d91BcwyCMSagZQ5ioh7+8JkDoq11Ij0iwjWBL84t5iZM1uTYiXpgs2mBORcGe
	kUfb7oOPU2V+DhVo2XPGTlPqszVooVDEPGnlf0ca57PSGdKTjS0x0yxtsQIYEJB4
	dSZN/dL/Df6c/zEY1CSTBk+fwM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello list,

the problem I ran into is, that I'm unable to delete any iptables rule, 
which uses either the set match or the SET target, by the exact matching 
rule options. Deleting by rule number works though.
See below output.

System is Debian squeeze with debian kernel 2.6.32.
I downloaded the debian kernel source package.
Applied the netlink.patch and compiled/run it successfully.
Installed latest ipset successfully:

# ipset version
ipset v6.16.1, protocol version: 6

I tried to apt-src iptables and compile that, but made no difference.

# iptables -V
iptables v1.4.8

Any ideas on that?

Thank you very much!


-----------------------------------------------------------------
iptables -vnL FOO
Chain FOO (1 references)
  pkts bytes target     prot opt in     out     source 
destination

# iptables -A FOO -s 192.168.13.0/24 -p icmp -j SET --add-set foo src
# iptables -A FOO -m set --match-set foo src -j ACCEPT

- generate some traffic...

iptables -vnL FOO
Chain FOO (1 references)
  pkts bytes target     prot opt in     out     source 
destination
     4   240 SET        icmp --  *      *       192.168.13.0/24 
0.0.0.0/0           add-set foo src
    18  1148 ACCEPT     all  --  *      *       0.0.0.0/0 
0.0.0.0/0           match-set foo src

iptables -D FOO -s 192.168.13.0/24 -p icmp -j SET --add-set foo src
iptables: No chain/target/match by that name.

# iptables -D FOO -m set --match-set foo src -j ACCEPT
iptables: Bad rule (does a matching rule exist in that chain?).

# ipset list foo
Name: foo
Type: hash:ip
Revision: 0
Header: family inet hashsize 1024 maxelem 65536
Size in memory: 8288
References: 2
Members:
192.168.13.254
