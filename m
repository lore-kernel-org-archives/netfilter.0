From: Ryan <ryan_gerstenkorn@fastmail.fm>
Subject: Outbound SNAT on non-local connections
Date: Sat, 14 Mar 2015 14:29:00 -0700
Message-ID: <1426368540.2642076.240424705.3B907A6A@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=fastmail.fm; h=
	message-id:x-sasl-enc:from:to:mime-version
	:content-transfer-encoding:content-type:subject:date; s=mesmtp;
	 bh=zPmKxb7zCju8wi34udRRANwiGCM=; b=qWfQWfA2oSbBd4acTngIN/HIdnj4
	gdqy3exBYBwMMECQAV5JeYVo+3NLVYv7t1T+E3dFut4mE4Qg8l3zyTLnoR3P9l6y
	33rDclhdhoT6rpWcjjPkamC6qOniKJ85YNM/fFygUy5jXQHpEbDdO5GI6uPa1L7o
	TKAYPVp9ECHZVxo=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:x-sasl-enc:from:to
	:mime-version:content-transfer-encoding:content-type:subject
	:date; s=smtpout; bh=zPmKxb7zCju8wi34udRRANwiGCM=; b=AR6XYPjrub8
	pippsdpOWxjTZUkMzYKujrDxS3uItfDtVnhHFVa5mjlO/R+P01YPylcl1njy5Ida
	d1BGkVfPwvKmfmTzNq7kNiT2u/H5nl7LpYbv4Tf5nIcMHIrfvpw68m8OJU4oT9nh
	7fjq3EodA1bOnR8M4SnUt9drzgDHAzuc=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,
I have been trying to set up a linux box as a L3 DSR backend and in
order for this to work I need to rewrite the source IP on a outbound
reply to a inbound connection.

So what is happening is I have three machines, client, load balancer,
and server.

The client sends a TCP (in my testing i'm using ICMP though) to the load
balancer. The load balancer then does DNAT to rewrite the destination
address to the server.

So now the server has a connection coming in from the load balancer
however it has the source IP of the client.

The server will respond directly to the client (which is what I want)
however because the client see's the connection coming from a different
IP it will ignore it.

I think the simplest solution here is to have SNAT on the server that
rewrites the source address to the load balancer IP however this does
not seem to work.

If i put log rules for every chain in both the filter and nat tables
(and have no other rules) and send a single ICMP request from the client
to the load balancer I see this on the server:

Mar 14 21:15:35 vagrant-ubuntu-precise-64 kernel: [16634.197968] NAT
PREROUTING IN=eth1 OUT= MAC=08:00:27:d1:0d:09:08:00:27:94:ad:1b:08:00
SRC=192.168.54.20 DST=192.168.54.10 LEN=84 TOS=0x00 PREC=0x00 TTL=64
ID=17427 DF PROTO=ICMP TYPE=8 CODE=0 ID=3724 SEQ=1 
Mar 14 21:15:35 vagrant-ubuntu-precise-64 kernel: [16634.199879] INPUT
IN=eth1 OUT= MAC=08:00:27:d1:0d:09:08:00:27:94:ad:1b:08:00
SRC=192.168.54.20 DST=192.168.54.10 LEN=84 TOS=0x00 PREC=0x00 TTL=64
ID=17427 DF PROTO=ICMP TYPE=8 CODE=0 ID=3724 SEQ=1 
Mar 14 21:15:35 vagrant-ubuntu-precise-64 kernel: [16634.201220] NAT
INPUT IN=eth1 OUT= MAC=08:00:27:d1:0d:09:08:00:27:94:ad:1b:08:00
SRC=192.168.54.20 DST=192.168.54.10 LEN=84 TOS=0x00 PREC=0x00 TTL=64
ID=17427 DF PROTO=ICMP TYPE=8 CODE=0 ID=3724 SEQ=1 
Mar 14 21:15:35 vagrant-ubuntu-precise-64 kernel: [16634.201891] OUTPUT
IN= OUT=eth1 SRC=192.168.54.10 DST=192.168.54.20 LEN=84 TOS=0x00
PREC=0x00 TTL=64 ID=29751 PROTO=ICMP TYPE=0 CODE=0 ID=3724 SEQ=1 

It seems to hit the PREROUTING chain and never touches POSTROUTING.

If I do a connmark -L after the ping I will see the ICMP connection show
up there:

icmp     1 28 src=192.168.54.20 dst=192.168.54.10 type=8 code=0 id=3729
src=192.168.54.10 dst=192.168.54.20 type=0 code=0 id=3729 mark=0 use=1

If I understand correctly the nat table won't be consulted if a
connection exists in conntrack already. However because I can't have
SNAT in PREROUTING I can't really do what I want.

Am I doing something wrong or is am I understanding this behavor
correctly? If so is there a way to work around this issue?


Thanks!
Ryan G.
