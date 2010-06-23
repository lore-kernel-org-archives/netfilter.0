From: Thomas Jacob <jacob@internet24.de>
Subject: Re: Blocking Ads.
Date: Wed, 23 Jun 2010 13:09:49 +0200
Message-ID: <1277291389.18773.10.camel@enterprise.ims-firmen.de>
References: <215194.52736.qm@web112405.mail.gq1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <215194.52736.qm@web112405.mail.gq1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ninad A <ninad_adi@yahoo.com>
Cc: netfilter@vger.kernel.org

On Wed, 2010-06-23 at 02:37 -0700, Ninad A wrote:
> Thanks, for so prompt answers to all.
> 
> I am sorry for this state, but I am bit confused.
> 
> INFO : Mine is a simple UBUNTU system with kernel 2.6.34 behind ppp0 not a 
>        security device which has LAN and WAN ports so that FORWARD chain 
>        can be used.
> 
> 1) Using REJECT target will definitely send an ICMP error message to the   
>    opposite party but still that doesnt help connection at my machine  
>    which times out and thats why application delay is caused.
>    What might be the problem ?

Try it with a TCP reset instead

As an example:

dig +short www.leo.org

iptables -A OUTPUT -p tcp -d 80.190.158.9 -j REJECT \
  --reject-with tcp-reset


time telnet www.leo.org
Trying 80.190.158.9...
telnet: Unable to connect to remote host: Connection refused

real    0m0.008s
user    0m0.000s
sys     0m0.010s

Apparently ICMP messages generated for local processes when going thru
OUTPUT somehow don't find their way back to the upper layers of the TCP
stack, or are possibly not generated at all.



