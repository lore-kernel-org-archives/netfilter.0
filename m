From: Bill <boober95@rogers.com>
Subject: Connection tracking Cli and an ALG for DNS
Date: Wed, 4 Nov 2015 14:32:09 -0400
Message-ID: <201511041332.09522.boober95@rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rogers.com; s=s2048; t=1446661931; bh=w6J/jUlcmUxDLUDoxy6/eZ97olowDzdsZg0JWLAF7ig=; h=From:To:Subject:Date:From:Subject; b=Q0bykPqKpJrjPyPu8HVEssnVFpbkj1b2/NxWRs2veOKOakYqd0/N1xKPsNGuf0Q6s0UVA8gOhBYRYKzLwd8fNGf2UF5wLGo2kU+0oQFwac3oMOifrRFw/hN+0sQC0akAGmIUfOCYz0F0LsM1MxRQZ2kLcTjhU4rzzasbwgP5+oBT1qMiJ2tuUGTDNsQt943ESDoy0lW3eSQlPi6WSMR2JBZw9JIbubWTsRmmOv3RTDzf5rR0cLWL7FDHpKG7CpeKE+fdo9d0azzQtz/3zSZpSLSOmlnE99HWpQERbZpJX4fzrrCk5TF2A79KQNkj6s2RbO/Bakhpfh8Ctqq1BUdv8Q==
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter Users Mailing list <netfilter@vger.kernel.org>

I am looking at creating a DNS_ALG using netfilter connection tracking.  I 
believe I understand most of what is needed but am having problems testing 
the ideas using the Cli from the conntrack-tools package.

Basically I have a setup that looks like this, a NAT gateway (with DNS) a 
local host inside the NAT, and a remote host outside the NAT:

local host               dns/nat gateway              remote host
192.168.20.171      192.168.20.170                192.168.30.172
                              192.168.30.170
inside               ----->>> nat >>> ------          outside

Thus local host can connect to remote host and is natted thru the gateway, but 
remote host can't connect to local host as it is blocked by the NAT gateway.

What want ultimately is for remote to do a DNS on the gateway, and have the 
gateway configure the NAT to allow the incoming connection.  I want the 
connection to look as if local has initiated it, ie I want it natted so the 
connection is between the gateway and the remote host IPs on the outside.

Ultimately I want to program this into a DNS server or build a DNS_ALG, but 
for now I am just testing out the ideas and trying to test using the 
conntrack-tools, but I have having limited success.  I can add/delete/modify 
connections but I haven't been able to create a conntrack 'expectation'.

In the conntrack-tools there is a set of tests 'test.sh' file that has 
examples, and they work, but not the 'expectation', test as it is missing 
some options.

What I'd like to know is given the above example, where I'd like 
192.168.30.172 to connect to an expectation on 192.168.30.170 and be passed 
thru the NAT to 192.168.20.171, what are the right commends to use? 

I am pretty sure I need an 'expectation' and not a connection in one of the 
initial state machine states, but please correct me if I am wrong.

/bill
