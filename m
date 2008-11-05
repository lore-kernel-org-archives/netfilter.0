From: Fu-Tung Cheng <futung.cheng@yahoo.com>
Subject: Re: 2 ips, same port, forward to original ip but different port
Date: Wed, 5 Nov 2008 10:32:28 -0800 (PST)
Message-ID: <682334.72000.qm@web45902.mail.sp1.yahoo.com>
References: <49116A6F.1070508@plouf.fr.eu.org>
Reply-To: futung.cheng@yahoo.com
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49116A6F.1070508@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>

Thank you!!

You understood correctly.  I wanted any incoming on 80 to be forwarded on the same interface to 12080.

> If I understand correctly, you want to change only the
> destination port, not the destination address. But the
> iptables manpage says that the REDIRECT target replaces the
> destination address with the primary address of the incoming
> interface, so it may not be suitable for your purpose.
> 
> You can use the DNAT target instead. Either :
> 
> iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT
> --to :12080
> 
> will translate the destination port 80 into 12080
> regardless of the destination address and without changing
> it,
> 


Not sure what I thought that was supposed to do.  I just copied a couple rules for forwarding from some tutorial and those were included and didn't think to really question them.  I need to spend some more time with the man pages.  I think my big problem was that I thought iptables -F would flush all chains but instead it was likely only flushing the default chain and not the nat chain.

> PS: What is the purpose of the first rule in the FORWARD
> chain ?


Thanks again,

Fu-Tung



      

