From: Pawel Pilat <poster_pl@yahoo.com>
Subject: ECN problem?
Date: Tue, 22 Jun 2004 01:34:17 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040622083417.10622.qmail@web13425.mail.yahoo.com>
References: <200406220216.i5M2GXh6002287@server5.bandwidthco.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406220216.i5M2GXh6002287@server5.bandwidthco.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

 
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org] On
> Behalf Of Pawel Pilat
> Sent: Monday, June 21, 2004 1:59 AM
> To: netfilter@lists.netfilter.org
> Subject: ECN problem?
> 
> Hello everyone,
> it's my first post on this list so plese
> understanding ...
> I think that i have problem with ECN , this is my
> situation:
> 
> IN--->R--->ISP
> 
> where:
> IN - my internal net
> R - my linux router (2.4.25, ipt-1.2.9)
> ISP - my ISP
> 
> so when i trying to connect from internal net to
> Internet i expirencing very
> slow transfers (500 - 700
> bps) but from router everything is ok (transfer rate
> 50 - 60 kbps) when i
> used tcpdump on external interfece on router i
> realized that my ISP sends to
> me in every TCP packet TOS field set to 0x03 (ECN-CT
> + ECN-CE) i think that
> is the problem
> 
> i tried using:
> 
> iptables -t mangle -A PREROUTING -i $EXTIF -j TOS
> --set-tos 0x00 but without
> any result
> 
> my question is:
> 1.it is possible to set linux box to ignore this
> fields in packets?
> 2. there is another way to solve the problem?
> 
> thank for advices
> best regards
> 
> POSTER PL
> 
> 
> 
> 		
> __________________________________
> Do you Yahoo!?
> Take Yahoo! Mail with you! Get it on your mobile
> phone.
> http://mobile.yahoo.com/maildemo 
> 
> Most ISP have ECN enabled on their routers today, so
> this is not unusual. If
> the packets you are receiving from your ISP have
> Cx=1 (0x03) then this means
> it is indeed experiencing congestion, and if your
> box is also ECN enabled,
> then the congestion windows on both devices are
> probably being cut in half.
> This needs to be confirmed before you do anything.
> To confirm this, I would
> suggest that you first check and see if you box is
> ECN enabled by checking
> your kernel config for CONFIG_INET_ECN=y. If it is,
> check the two high-order
> bits of bite 13 of the suspect TCP packet headers to
> see if the congestion
> windows are being cut. If so, then this is probably
> a correct assumption on
> your part. If so, the easiest solution would be to
> disable ECN on your box.
> You would need to recompile the kernel to that of
> course. However, it would
> seem as though ECN is only doing its job and you may
> want to explore that
> avenue.
> 
> 
> 
>
########################################################
> This message has been scanned for viruses and
> dangerous 
> content by MailScanner, and is believed to be clean.
> 
> postmaster@bandwidthco.com
> MailScanner at bandwidthco.com is for your absolute
> protection.
>
########################################################

Thnx Mark 

my box isn't ECN enabled for sure
to be completly sure I issued: echo "0" >
/proc/sys/net/ipv4/tcp_ecn

but this kind of behavior is strange for me or maybe
my understanding of ECN isn't enough
when i connect directly to ISP link non routing host
everything seems to be OK (transfers rates) but EVERY
returning packet in TCP sequence has TOS set to 0x03.

it seems that every packet in connection from my hosts
makes ISP router congested - I don't think so -
both interfaces of router are ethernet 100
i set MTU on external if to 1460
also tried with lower values and 
iptables ..... -j TCPMSS ... also without results 

so my theories :

1. ISP sets TOS field to 0x03 on purpose on EVERY TCP
packet directed to my host, but why?
NAT preventing or sth ?

2. bad ECN implementation ?
it is possible but affects only those people who share
their connection.
at this point i must say that i dont want to make war
with my ISP - i have 3 PC and i want them all to be
connected (network protocols and features test
purposes)  generally it's not forbidden by ISP

i will examine those bytes just in case 
it's getting much interesting with each packet i
captured ... :)  

i will be grateful for any advices

best regards
POSTER PL

  

 



		
__________________________________
Do you Yahoo!?
Yahoo! Mail - You care about security. So do we.
http://promotions.yahoo.com/new_mail

