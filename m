From: Christoph Anton Mitterer 
	<christoph.anton.mitterer@physik.uni-muenchen.de>
Subject: Re: dropping UNTRACKED packets, breaks IPv6 - why?
Date: Fri, 26 Jul 2013 22:20:39 +0200
Message-ID: <1374870039.5456.9.camel@fermat.scientia.net>
References: <1374803962.5489.12.camel@fermat.scientia.net>
	 <CAOkSjBggVWoGj-Kin3fwDx+1pjpHyB2MSxna86-X7ik90iSeQA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-JxeH6YGULT0kbAn7jIN+"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	physik.uni-muenchen.de; h=x-mailer:mime-version:message-id:date
	:date:organization:content-type:content-type:references
	:in-reply-to:from:from:subject:subject:received:received; s=
	sel-2011; t=1374870041; bh=+UqfZ1ow9q83ysFcBiSNtOPhWDikPbO15Ga6V
	mzGjOs=; b=xMeHWRLLk4f0OSoxrdBJFX7zuNmLjbRfYUmB2LUSf1lI+z2TLNOWI
	uBk/BBO127AqYSyF1B+9sNZ/RDcRCfXz2X0l+zR787JIXxp3n6olR11QK2ikzdFB
	CVX0rcxqVwWlEOPoXHBiBoADJG+Xvpa5CbmKmKLlA1L0YnzUbCmfo4=
In-Reply-To: <CAOkSjBggVWoGj-Kin3fwDx+1pjpHyB2MSxna86-X7ik90iSeQA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>


--=-JxeH6YGULT0kbAn7jIN+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi.

On Fri, 2013-07-26 at 09:07 +0200, Arturo Borrero Gonzalez wrote:
> Could you provide a ip6tables-save format ruleset?
see attachment...


> What is the default policy? I guess you are not allowing ICMP messages
> in OUTPUT. ICMP messages are important in IPv6.
No I do...

It's as if ICMP was UNTRACKED.

Just removing either
-A INPUT -m state --state UNTRACKED -j DROP
or
-A OUTPUT -m state --state UNTRACKED -j DROP
alone isn't enough... I really need to remove both (for the first time).

Cheers,
Chris.

--=-JxeH6YGULT0kbAn7jIN+
Content-Disposition: attachment; filename="rules.v6"
Content-Type: text/x-iptables; name="rules.v6"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

*filter




:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [0:0]




-A INPUT	--in-interface lo	-j ACCEPT
-A OUTPUT	--out-interface lo	-j ACCEPT

-A INPUT	-m state  --state UNTRACKED	-j DROP
-A FORWARD	-m state  --state UNTRACKED	-j DROP
-A OUTPUT	-m state  --state UNTRACKED	-j DROP

-A INPUT	-m state  --state INVALID	-j DROP
-A FORWARD	-m state  --state INVALID	-j DROP
-A OUTPUT	-m state  --state INVALID	-j DROP

#handle IPsec only sources/destinations
-A INPUT	--protocol udp  -m multiport  --destination-ports isakmp,isakmp-nat_espinudp	-j ACCEPT
-A OUTPUT	--protocol udp  -m multiport  --destination-ports isakmp,isakmp-nat_espinudp	-j ACCEPT
-N ipsec-only-in
-N ipsec-only-out

-A INPUT	-m state  --state ESTABLISHED,RELATED	-j ACCEPT

-A INPUT	--protocol icmpv6	-j ACCEPT




#do not handle packets that were or are going to be IPsec processed
-A ipsec-only-in	-m policy  --strict --dir in --pol ipsec --mode tunnel --proto esp	-j RETURN
-A ipsec-only-out	-m policy  --strict --dir out --pol ipsec --mode tunnel --proto esp	-j RETURN
#deny all non-ESP packets (packets that are not subject to IPsec)
-A ipsec-only-in	! --protocol esp	-j REJECT  --reject-with icmp6-adm-prohibited
-A ipsec-only-out	! --protocol esp	-j REJECT  --reject-with icmp6-adm-prohibited



# other stuff...


-A INPUT	-j REJECT  --reject-with icmp6-port-unreachable




COMMIT

--=-JxeH6YGULT0kbAn7jIN+--

