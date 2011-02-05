From: Andrew Beverley <andy@andybev.com>
Subject: Re: good tutorial
Date: Sat, 05 Feb 2011 22:44:41 +0000
Message-ID: <1296945881.1663.15.camel@andybev>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
	 <20110203120131.38cd818d@catus> <4D4C0B8F.10005@unipex.it>
	 <20110205155829.3a5ebc7b@catus> <1296923860.1695.20.camel@andybev>
	 <BLU0-SMTP7495DFC8C5F2213D76D1D2F3E90@phx.gbl>
	 <1296933724.1617.10.camel@andybev>
	 <BLU0-SMTP140C2CE9F593F7CCFDC80F0F3E90@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1296945885; bh=4VptJIh4ZfoBY9e5s3CdWkZUJEMNsZltIRHbS
	jzsutU=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=K32skJjE
	09CLR+Jc42nE730LHVaAN0rikMfeXZrMn8lmKCT9mhvqvMATvzKOfqhRiF4Y89y6ltz
	CdlKCekJNkfcX8EEbxYDhgQM7VIbdcWbn7kskOhTe5q87NQgw8+j3Cf/mnO53IRlaSx
	sxwWv0axQzBuATdoa7czl0lpTIXgg=
In-Reply-To: <BLU0-SMTP140C2CE9F593F7CCFDC80F0F3E90@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: J Webster <webster_jack@hotmail.com>
Cc: netfilter@vger.kernel.org

On Sat, 2011-02-05 at 20:33 +0100, J Webster wrote:
> Thanks.
> Out of interest will this only limit connects incoming to the server and 
> not outgoing?

It will limit the *outgoing* traffic on whichever interface you attach
it to, but from your perspective this may actually result in traffic
incoming to the server (which I guess is what you want).

So if you attach to your LAN interface, and you actually mean "will this
only limit traffic being downloaded from the internet", then the answer
is yes.

> For example, a user connects via VPN to the server, their connection 
> should be limited to 2Mbps (3in the example below) but they are 
> connecting to say www.youtube.com. I do not want the connection to 
> youtube.com to be restricted as maybe 10 users might be accessing 
> youtube at the same time.

It won't in the example. However, even if you were doing egress shaping
on the internet interface, you'd have to specifically specify youtube's
IP address for the above to happen anyway.

> So the server can have an unlimited outgoing connection to youtube but 
> when it passes on the connection to the client (much like a proxy server 
> might do), they should only have 2Mbps.

Sort of - when you say "outgoing" connection to youtube, I assume you
mean traffic "incoming" from youtube to the server. So if you egress
shape on the LAN interface, then there will be no restrictions for the
overall traffic coming the internet, but the client will be limited
depending on your filters. 

Remember that traffic goes both ways - you'll need to egress shape on
the internet interface if you want to also limit the traffic to the
internet (ie uploads).

> Now the reason I asked for a tutorial somewhere is I went through the 
> LARTC tutorial (which just looks like a blank white document) and my 
> understanding of leaf, HTB, U32, qdisc, etc is kind of lacking :)

Well I found this to be pretty good:

http://www.opalsoft.net/qos/DS.htm

Andy


