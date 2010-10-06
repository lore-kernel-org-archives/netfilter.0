From: Christoph Anton Mitterer 
	<christoph.anton.mitterer@physik.uni-muenchen.de>
Subject: how to best limit "rate of rejects"
Date: Wed, 06 Oct 2010 14:21:49 +0200
Message-ID: <20101006142149.95231l9rz87p044g@webmail.physik.uni-muenchen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	physik.uni-muenchen.de; h=user-agent:content-transfer-encoding
	:content-disposition:content-type:content-type:mime-version
	:subject:subject:from:from:date:date:message-id:received
	:received:received:received; s=sel-2010; t=1286367709; bh=gyLeni
	z2sEr8TrU1+HfvUk5wVh17WkNXlnMD181qZ48=; b=PZYIcY3L9wuaGP62rLxq4i
	Pk2+Zobf7E9X6e/o/MU/VmXZrvmUDNHXnxnKbJAISa2YlGbSnhR10y8dM1PQWfkb
	5/QEAa/S8B1Xp+9fgsi9dZs4dRpAN5E5d5xxmS/t7Q21xYT8S8rTBiKI/nksFUYp
	IJ2a7WB4E4kBNiEXOhnjA=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: netfilter@vger.kernel.org

Hi.

Using the same setup as described here  
(http://thread.gmane.org/gmane.comp.security.firewalls.netfilter.general/40849) I have one  
problem:

At least ping (if not limiting with -c), and possibly other service,  
just goes crazy and massively sends ECHO request when the packets are  
rejected (because no IPsec handling would be done).
This really eats up my CPU ;)


Is there some smart way to just limit the rate on those rejects? e.g.  
something like a "wait with sending the reject for a second" target?
And would that even make sense?

I've tried it using the limit match and following rules (see the other  
rules in the link above):
-A ipsec-only-in        ! --protocol esp  -m limit --limit 10/second    
  -j REJEC
T  --reject-with icmp-admin-prohibited
-A ipsec-only-in        ! --protocol esp                                
  -j DROP
-A ipsec-only-out       ! --protocol esp  -m limit --limit 10/second    
  -j REJECT  --reject-with icmp-admin-prohibited
-A ipsec-only-out       ! --protocol esp                                
  -j DROP

The intention was that if the limit is reached, no REJECTS are no  
longer produced but the packages are dropped (and the client then  
hopefully waits some time before sending again).
But this is obviously rather ugly and doesn't work very well.


Are there any other possibilities?


Thanks,
Chris.

----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.

