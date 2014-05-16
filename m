From: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Subject: Re: randomly SNATed devices after reboot
Date: Fri, 16 May 2014 16:59:31 -0300
Message-ID: <20140516165931.274ae0c2@pulsar>
References: <20140515104238.26ce6626@pulsar>
	<53759AB5.6050101@atc.tcs.com>
	<537660A1.9060907@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <537660A1.9060907@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter <netfilter@vger.kernel.org>

> > 
> > May be, some phones are trying to register via ESTABLISHED connections 
> > which not getting SNATed. So, the registration fails.
> 
> Not ESTABLISHED (that would require return traffic, but existing (NEW).
> 
> If a phone sends a SIP packet before the SNAT rule is active, then the
> whole SIP flow, including further packets, will not be SNATed until the
> related conntrack entry expires. Expiration never happens if the sending
> period is shorter than the UDP conntrack expiration delay.

The phone must send keep-alive in a period shorter than conntrack expiration
period.
If they don't what is the point sending the refresh, right?

> 
> If you don't want this to happen, just DROP all FORWARDed traffic until
> the SNAT rule is active.

<side comment>
Hmmm! I am looking to Jan Engelhardt's Packet Flow picture (2014-Feb-28) and
can not find conntrack in the output path for forwarded packets. I think we
found a glitch in his drawing. Does he read this list?
</side comment>

Nope. I think this is not a ultimate solution because packets still may flow
before FORWARD DROP rule is in place. Your suggestion does not kill the race
condition.
This is what I see, please correct me if I'm wrong:
	1) IP stack is in place during boot 
	2) network parameters are configured (ip addrs, routes, etc)
	3) nf modules are loaded (/etc/modules.d??)
	4) conntrack modules are loaded (also /etc/modules.d)
	5) user scripts are loaded (iptables snat or FORWARD rules included)

If any packets slip between 2 and 5, conntrack already saw the incorrect src
addr.

I need to ensure no packet cross at least before conntrack is loaded, therefore,
before any action I can take via normal boot scripts given the above scenario.

Regards

Ethy
