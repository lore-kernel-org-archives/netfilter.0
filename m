From: Bill <boober95@rogers.com>
Subject: Re: [Bulk] Connection tracking Cli and an ALG for DNS
Date: Fri, 6 Nov 2015 17:27:36 -0500
Message-ID: <201511061727.37090.boober95@rogers.com>
References: <201511041332.09522.boober95@rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rogers.com; s=s2048; t=1446848858; bh=Gcin3JvPZS5te87A/dU/kqX2Y2uXsq2echaedAXU1O4=; h=From:To:Subject:Date:References:In-Reply-To:From:Subject; b=BAz7XZ1RnwiQxf4DQHfisETlYaUE+7pM2K4Bi2TMmp5SyyeKnCJI83o+0A0PNDgweUxhjRV3uSvGodV7GUGPVQPI8Jn8cV/fjLDyPXbxpO1+J586hNwrEthgi/CIpzESBXd7i05Giy1LpsqLUikrNAlB6ZcxcZNQs2y6eTTYWyTWRWED8wP+i3ZLD7l4oAG4YRkhsW3GLWBS0byqC6lnnZaovsF+CDCXDNrTGLLgdKo9eouWxeZiyCjZCYDMWElGEgFfeHCPVcugsmAhIgAnopFghF2hLeF61FRDk0uPLoLKSbtDD3sFmgcQ9CI9dBlZ9U2fwBSSDov7wsGmmysf7g==
In-Reply-To: <201511041332.09522.boober95@rogers.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter Users Mailing list <netfilter@vger.kernel.org>

I've been looking at this a bit more and it occurs to me that it may be I 
don't need 'expect', but can use the regular connection tracking table.

So I have tried adding a connection that would allow me to traverse the NAT in 
the opposite direction but haven't had any success with this either.

conntrack -I -s 192.168.30.172 -d 192.168.20.171 -p tcp --sport 50000 --dport 
22 --state LISTEN -u SEEN_REPLY -t 600 --reply-src 192.168.20.171 --reply-dst 
192.168.20.170 --reply-port-src 22 --reply-port-dst 5000

I came up with the options by looking at an established connection in the 
other direction, so there is some guess work here.

If anyone can tell me definitively if I can use a connection or an expect to 
do what I want, as described below, I'd appreciate it.

/bill


On Wednesday 04 November 2015 13:32, Bill wrote:
> I am looking at creating a DNS_ALG using netfilter connection tracking.  I
> believe I understand most of what is needed but am having problems testing
> the ideas using the Cli from the conntrack-tools package.
>
> Basically I have a setup that looks like this, a NAT gateway (with DNS) a
> local host inside the NAT, and a remote host outside the NAT:
>
> local host               dns/nat gateway              remote host
> 192.168.20.171      192.168.20.170                192.168.30.172
>                               192.168.30.170
> inside               ----->>> nat >>> ------          outside
>
> Thus local host can connect to remote host and is natted thru the gateway,
> but remote host can't connect to local host as it is blocked by the NAT
> gateway.
>
> What want ultimately is for remote to do a DNS on the gateway, and have the
> gateway configure the NAT to allow the incoming connection.  I want the
> connection to look as if local has initiated it, ie I want it natted so the
> connection is between the gateway and the remote host IPs on the outside.
>
> Ultimately I want to program this into a DNS server or build a DNS_ALG, but
> for now I am just testing out the ideas and trying to test using the
> conntrack-tools, but I have having limited success.  I can
> add/delete/modify connections but I haven't been able to create a conntrack
> 'expectation'.
>
> In the conntrack-tools there is a set of tests 'test.sh' file that has
> examples, and they work, but not the 'expectation', test as it is missing
> some options.
>
> What I'd like to know is given the above example, where I'd like
> 192.168.30.172 to connect to an expectation on 192.168.30.170 and be passed
> thru the NAT to 192.168.20.171, what are the right commends to use?
>
> I am pretty sure I need an 'expectation' and not a connection in one of the
> initial state machine states, but please correct me if I am wrong.
>
> /bill
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
