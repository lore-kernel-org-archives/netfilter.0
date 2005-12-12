From: "Pete Davis" <peted@springisd.org>
Subject: Re: netfilter Digest, Vol 17, Issue 15
Date: Mon, 12 Dec 2005 16:10:01 -0600
Message-ID: <s39da0de.089@gwadmin.springisd.org>
Reply-To: peted@springisd.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

hgfhg

>>> "netfilter@lists.netfilter.org" 12/12/05 16:10 >>>

Send netfilter mailing list submissions to
	netfilter@lists.netfilter.org

To subscribe or unsubscribe via the World Wide Web, visit
	https://lists.netfilter.org/mailman/listinfo/netfilter
or, via email, send a message with subject or body 'help' to
	netfilter-request@lists.netfilter.org

You can reach the person managing the list at
	netfilter-owner@lists.netfilter.org

When replying, please edit your Subject line so it is more specific
than "Re: Contents of netfilter digest..."


Today's Topics:

   1. connection time (jonathan)
   2. Re: connection time (Sp0oKeR)
   3. RE: connection time (Rob Sterenborg)
   4. Re: Very wierd problem (Svenne Krap)
   5. RE: FORWARD Chain Question (Gene Dellinger)
   6. Allowing Samba Access to certain IPs (Jason)
   7. Re: Allowing Samba Access to certain IPs PLEASE DISREGARD
      THIS EMAIL (Jason)


----------------------------------------------------------------------

Message: 1
Date: Mon, 12 Dec 2005 18:24:27 +0100
From: jonathan <support-squid@bfinance.fr>
Subject: connection time
To: netfilter@lists.netfilter.org
Message-ID: <1134408268.2824.2.camel@localhost.localdomain>
Content-Type: text/plain

hi,
Is there a way to limit the ssh connection time through via an Iptables
rule ?




------------------------------

Message: 2
Date: Mon, 12 Dec 2005 15:40:14 -0200
From: Sp0oKeR <spooker@gmail.com>
Subject: Re: connection time
To: jonathan <support-squid@bfinance.fr>
Cc: netfilter@lists.netfilter.org
Message-ID:
	<9255886c0512120940o17c537e4m9a0ca237e7ecbb61@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8

     I think uou can use time patch ( Patch O Matic) to do this.
  
http://www.netfilter.org/projects/patch-o-matic/pom-base.html#pom-base-time

Regards,

Sp0oKeR

On 12/12/05, jonathan <support-squid@bfinance.fr> wrote:
> hi,
> Is there a way to limit the ssh connection time through via an
Iptables
> rule ?
>
>
>


--
=====================
 Rodrigo Ribeiro Montoro
Desenvolvedor BRMAlinux
  spooker@brc.com.br
       RHCE/LPIC-I
=====================

------------------------------

Message: 3
Date: Mon, 12 Dec 2005 19:00:22 +0100
From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: connection time
To: <netfilter@lists.netfilter.org>
Message-ID: <000001c5ff45$ec1cbda0$0101000a@sterenborg.info>
Content-Type: text/plain;	charset="US-ASCII"

> hi,
> Is there a way to limit the ssh connection time through via an
> Iptables rule ?

- If you are referring to a start date/time and stop date/time, you can
use the time patch.

- If you are referring to limiting a connection to eg 20 minutes from
the time the connection was initiated, you can use the expire patch.


Gr,
Rob




------------------------------

Message: 4
Date: Mon, 12 Dec 2005 20:20:37 +0100
From: Svenne Krap <svenne@krap.dk>
Subject: Re: Very wierd problem
To: Derick Anderson <danderson@vikus.com>
Cc: netfilter@lists.netfilter.org
Message-ID: <439DCD85.6020800@krap.dk>
Content-Type: text/plain; charset="iso-8859-1"

Hi again.

Well you intuition wasn't far off. After an uncanny amount of hours of 
testing different things, I found the solution. (I did learn that for 
the next time, tcpdump has the first try to find the problem ;)

It seems like the firewall in front of the customer (or perhaps his 
computer/application) sets the "dont fragment" bit on the packages (I 
believe that is fairly uncommon?). The package arrives fine at my 
firewall, but as there are VLANs behind the firewall, the MTU of 1500 is

four bytes too long to continue past the firewall. Normally, the package

would be fragmented by my firewall (as I understand it) and served.
Unfortunately, the DF-flag prevents this, so my firewall bails out with 
an ICMP type 3 message subtype 4 (unreachable - need to frag). This 
message seems to get lost at the firewall  in front of my customer (of 
which he has no control). So his application waits for an acceptance of 
the package which my firewall dropped due to being too big.

The problem has been verified by setting the MTU to 1496 on his 
computer, after which everything runs flawlessy.

I must admit, that I am not that strong within MTU discovery and ICMP 
messages (the above is based on what I have read to day and found out by

tcpdump).

Here is the relevant piece of tcpdump (81.7.170.138 is my firewall, 
81.7.185.77 is a temp IP used for debugging his server (oh, the joy of 
DNAT ;) and 80.63.34.250 is my clients ip:

14:26:45.691261 IP 80.63.34.250.2831 > 81.7.185.77.22: . 5460:5672(212)
ack 305 win 64671

14:26:45.691333 IP 80.63.34.250.2831 > 81.7.185.77.22: P 6588:7100(512)
ack 305 win 64671

14:26:45.691386 IP 81.7.185.77.22 > 80.63.34.250.2831: . ack 6588 win
12040 <nop,nop,sack sack 1 {7432:11100} >

14:26:45.691480 IP 81.7.185.77.22 > 80.63.34.250.2831: . ack 7100 win
12800 <nop,nop,sack sack 1 {7432:11100} >

14:26:45.692357 IP 80.63.34.250.2831 > 81.7.185.77.22: P
11100:12560(1460) ack 305 win 64671

14:26:45.692368 IP 81.7.170.138 > 80.63.34.250: icmp 556: 81.7.185.77
unreachable - need to frag (mtu 1496)

14:26:45.692471 IP 80.63.34.250.2831 > 81.7.185.77.22: P
12560:13920(1360) ack 305 win 64671

14:26:45.692711 IP 81.7.185.77.22 > 80.63.34.250.2831: . ack 7100 win
12800 <nop,nop,sack sack 2 {12560:13920}{7432:11100} >

14:26:45.695955 IP 80.63.34.250.2831 > 81.7.185.77.22: P
13920:15380(1460) ack 305 win 64671

14:26:45.695965 IP 81.7.170.138 > 80.63.34.250: icmp 556: 81.7.185.77
unreachable - need to frag (mtu 1496)

14:26:46.047387 IP 80.63.34.250.2831 > 81.7.185.77.22: P 7100:8560(1460)
ack 305 win 64671

14:26:46.047401 IP 81.7.170.138 > 80.63.34.250: icmp 556: 81.7.185.77
unreachable - need to frag (mtu 1496)

14:26:46.812538 IP 80.63.34.250.2831 > 81.7.185.77.22: P 7100:8560(1460)
ack 305 win 64671

14:26:46.812552 IP 81.7.170.138 > 80.63.34.250: icmp 556: 81.7.185.77
unreachable - need to frag (mtu 1496)

14:26:48.125581 IP 80.63.34.250.2831 > 81.7.185.77.22: P 7100:8560(1460)
ack 305 win 64671

14:26:48.125592 IP 81.7.170.138 > 80.63.34.250: icmp 556: 81.7.185.77
unreachable - need to frag (mtu 1496)

14:26:50.641188 IP 80.63.34.250.2831 > 81.7.185.77.22: P 7100:8560(1460)
ack 305 win 64671

14:26:50.641201 IP 81.7.170.138 > 80.63.34.250: icmp 556: 81.7.185.77
unreachable - need to frag (mtu 1496)

14:26:55.563161 IP 80.63.34.250.2831 > 81.7.185.77.22: P 7100:8560(1460)
ack 305 win 64671

14:26:55.563174 IP 81.7.170.138 > 80.63.34.250: icmp 556: 81.7.185.77
unreachable - need to frag (mtu 1496)

The customer offered his NOC my number so that I could tell what I found

out, but he declined as "my network is running fine!".

So I am very interested in knowing :
- whether or not you agree with me, that this is a problem of the 
firewall in front of the customer (as opposed to a flaw my setup)?
- this could be a potential problem for other people (my mtu of 1496 
instead of 1500) ?
- if it is his firewall, can I stille use the TCPMSS extension to 
corretct this problem, and if so, how ?

Thanks in advance

Svenne

Derick Anderson wrote:

>Inline.
>
>  
>
>>-----Original Message-----
>>From: netfilter-bounces@lists.netfilter.org 
>>[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of 
>>Svenne Krap
>>Sent: Saturday, December 10, 2005 8:23 AM
>>To: netfilter@lists.netfilter.org
>>Subject: Very wierd problem
>>
>>Hi.
>>
>>I have quite a problem.
>>
>>One of my customer is suddently unable to upload data to his 
>>machine (neither via SFTP/SCP nor regular FTP nor HTTP) 
>>behind my firewall. I believe it is due to something changed 
>>on the network he is connected to (as I have not changed 
>>anything during that period). He has no problems downloading 
>>data, but when uploading the upload stalls after 4kb of transfer.
>>What is even worse, I cannot recreate the problem from 
>>anywhere I have tried (>5 different ISP's).
>>    
>>
>
>I interpret this to mean that the problem is with a particular customer
>on a particular ISP - your other customers can upload just fine. The
>fact that data can be downloaded (but not uploaded) is very strange.
>
>[snip]
>
>  
>
>>This has worked flawlessy for half a year or so. But 
>>suddently it stop working.
>>The customer's upstream provider blames my firewall. An 
>>interesting point is that the customer CAN upload to the 
>>firewall itself by scp through it's /29 adress (it has no /26).
>>But as said, I have not changed anything in the way the 
>>firewall works around when the problem arose, and any attempt 
>>to recreate it has been a failure.
>>    
>>
>
>Of course they blame your firewall. Did they give a reason? I assume
>when you attempt to recreate the problem you are uploading to the
>customer's server on your network and it works fine, and that your
other
>customers are not having problems with similar rulesets.
>
>If you haven't changed anything, I would recommend not messing with
your
>firewall. My first urge when there is a problem is to check everything
>and start changing things which "don't look right". However if there is
>a system which is the same now as it was when things were working then
I
>stifle that urge and look elsewhere. Maybe there's something with the
>client's internal server or settings on the VLAN switch... Verify your
>settings but don't go changing them without a good reason. If you do
>find something odd change one thing at a time and then test - otherwise
>you'll never know exactly what the problem was.
>
>  
>
>>I have tried to log packets both in the filter tables and the 
>>prerouting chain of the nat filter (before doing the nat). 
>>But nothing really catches my eyes.
>>
>>Any suggestions to what could be the problem ? Or how I could 
>>zero in on it ? What to log and so on?
>>
>>I am not really keen on publishing the firewall script, but I 
>>will send it to helpful individuals by email on request.
>>
>>Thanks in advance
>>
>>Svenne
>>
>>    
>>
>
>I would set up ethereal on your firewall and monitor both sides of a
>transfer from this client. See who sends the last packet before the
>connection is dropped. Since this problem appears to be protocol
>independent, I would pay close attention to the TCP connections, but I
>would also be curious about HTTP and FTP since they are cleartext and
>may have some additional information about what might be going on
>(timeouts, etc.).
>
>Derick Anderson
>
>  
>

-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3254 bytes
Desc: S/MIME Cryptographic Signature
Url : /pipermail/netfilter/attachments/20051212/4ba10ac3/smime-0001.bin

------------------------------

Message: 5
Date: Mon, 12 Dec 2005 11:46:09 -1000
From: "Gene Dellinger" <gene@poh.com>
Subject: RE: FORWARD Chain Question
To: <netfilter@lists.netfilter.org>
Message-ID: <BOEKIIIKCIBKDMDMHHLLAEHGDFAA.gene@poh.com>
Content-Type: text/plain;	charset="iso-8859-1"

To All:
I got some helpful information, thanks to those who responded, I am
still a
bit fuzzy though.
A packet coming in ETH0 destined for a system connected to ETH1, will
that
packet begin in the PREROUTING
chain on ETH1(sample 1) and then out or go to the FORWARD chain(sample
2)
and then out.

ETH0:PREROUTING---->FORWARD---->POSTROUTING---->OUT
         |	           |            |
       INPUT  	     |         OUTPUT
         |	          \|/	      |
      Local Process    |         Local Process
		           |
	   ----<---<-----|
	   |
        \|/
ETH1:PREROUTING---->FORWARD---->POSTROUTING---->OUT
         |			            |
       INPUT  		          OUTPUT
         |			            |
      Local Process		   Local Process

sample 1
_________________________________________________________

ETH0:PREROUTING---->FORWARD---->POSTROUTING---->OUT
         |	           |            |
       INPUT  	     |  	   OUTPUT
         |	          \|/	      |
     Local Process     |         Local Process
		           |
		           |
		           |
		          \|/
ETH1:PREROUTING---->FORWARD---->POSTROUTING---->OUT
         |			            |
       INPUT  		          OUTPUT
         |			            |
     Local Process		 Local Process

sample 2
_________________________________________________________


Thanks Again
Gene D.


-----Original Message-----
From: Gene Dellinger [mailto:gene@poh.com]
Sent: Friday, December 09, 2005 2:40 PM
To: netfilter@lists.netfilter.org
Subject: FORWARD Chain Question


On a multi-homed machine being used as a firewall, if
a packet is forward'd from one interface to another.
Does the packet enter the in at PRE-ROUTING portion of iptables
chain again for that interface? It may seem obvious but
I just want to make sure I am clear on that aspect of the
chain traversal.

Thanks
Gene D.



------------------------------

Message: 6
Date: Mon, 12 Dec 2005 14:01:30 -0800
From: "Jason" <jason@oregonemt.net>
Subject: Allowing Samba Access to certain IPs
To: <netfilter@lists.netfilter.org>
Message-ID: <009001c5ff67$9b95fe60$2e01a8c0@jasonspc>
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original

I am running a Samba server on Fedora Core 4 that I would like to open
up 
access only to certain networks and block all others.

How Would I accomplish this using iptables?   Here is my firewall script
so 
you can see what it is I am doing wrong.

Thanks

Jason

# import this saved configuration into your iptables configuration with
the 
following command:
# iptables-restore < web_server.config

*nat
:PREROUTING ACCEPT [127173:7033011]
:POSTROUTING ACCEPT [31583:2332178]
:OUTPUT ACCEPT [32021:2375633]
COMMIT

*mangle
:PREROUTING ACCEPT [444:43563]
:INPUT ACCEPT [444:43563] :FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [402:144198]
:POSTROUTING ACCEPT [402:144198]
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG 
FIN,PSH,URG -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j
DROP
-A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST SYN,RST -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
COMMIT

*filter
:INPUT DROP [1:242]
:FORWARD DROP [0:0]
:OUTPUT DROP [0:0]
:icmp_packets - [0:0]
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p tcp -m tcp --dport 20 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 21 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 25 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 43 -j ACCEPT
-A INPUT -p udp -m udp --dport 53 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 106 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 110 -j ACCEPT
-A INPUT -p udp -m udp --dport 123 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 143 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 783 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 901 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 993 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 3306 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 10000 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 12000 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 15000 -j ACCEPT
-A INPUT -s 127.0.0.1 -j ACCEPT
-A INPUT -s 192.168.1.0/24 -i eth0 -p udp -m udp -d 192.168.1.41 --dport

137 -j ACCEPT
-A INPUT -s 192.168.1.0/24 -i eth0 -p udp -m udp -d 192.168.1.41 --dport

138 -j ACCEPT
-A INPUT -s 192.168.1.0/24 -i eth0 -p tcp -m tcp -d 192.168.1.41 --dport

139 -j ACCEPT
-A INPUT -s 192.168.1.0/24 -i eth0 -p tcp -m tcp -d 192.168.1.41 --dport

445 -j ACCEPT
-A INPUT -s 66.220.104.76 -i eth0 -p udp -m udp -d 71.111.151.20 --dport

137 -j ACCEPT
-A INPUT -s 66.220.104.76 -i eth0 -p udp -m udp -d 71.111.151.20 --dport

137 -j ACCEPT
-A INPUT -p icmp -j icmp_packets
-A INPUT -j LOG --log-prefix "IPTABLES-IN Default Drop: " --log-level 7


-A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 20 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 21 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 22 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 23 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 25 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 43 -j ACCEPT
-A OUTPUT -p udp -m udp --dport 53 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 80 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 106 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 110 -j ACCEPT
-A OUTPUT -p udp -m udp --dport 123 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 143 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 443 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 783 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 901 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 993 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 3306 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 10000 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 12000 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 15000 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 2210 -j ACCEPT
-A OUTPUT -d 127.0.0.1 -j ACCEPT
-A OUTPUT -p icmp -j icmp_packets
-A OUTPUT -j LOG --log-prefix "IPTABLES-OUT Default Drop: " --log-level
7


-A icmp_packets -p icmp -m icmp --icmp-type 0 -j ACCEPT
-A icmp_packets -s 127.0.0.1 -p icmp -m icmp --icmp-type 8 -j ACCEPT
-A icmp_packets -p icmp -m icmp --icmp-type 8 -j DROP
-A icmp_packets -p icmp -m icmp --icmp-type 3 -j ACCEPT
-A icmp_packets -p icmp -m icmp --icmp-type 11 -j ACCEPT
COMMIT





------------------------------

Message: 7
Date: Mon, 12 Dec 2005 14:08:14 -0800
From: "Jason" <jason@oregonemt.net>
Subject: Re: Allowing Samba Access to certain IPs PLEASE DISREGARD
	THIS EMAIL
To: "Jason" <jason@oregonemt.net>,	<netfilter@lists.netfilter.org>
Message-ID: <009d01c5ff68$8c58f910$2e01a8c0@jasonspc>
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=response

I'm Sorry.  I accidentally sent this before I was finished composing. 
Please disregard this email message.  I will resend when I am finished. 
My 
apologies

Jason

----- Original Message ----- 
From: "Jason" <jason@oregonemt.net>
To: <netfilter@lists.netfilter.org>
Sent: Monday, December 12, 2005 2:01 PM
Subject: Allowing Samba Access to certain IPs


>I am running a Samba server on Fedora Core 4 that I would like to open
up 
>access only to certain networks and block all others.
>
> How Would I accomplish this using iptables?   Here is my firewall
script 
> so you can see what it is I am doing wrong.
>
> Thanks
>
> Jason
>
> # import this saved configuration into your iptables configuration
with 
> the following command:
> # iptables-restore < web_server.config
>
> *nat
> :PREROUTING ACCEPT [127173:7033011]
> :POSTROUTING ACCEPT [31583:2332178]
> :OUTPUT ACCEPT [32021:2375633]
> COMMIT
>
> *mangle
> :PREROUTING ACCEPT [444:43563]
> :INPUT ACCEPT [444:43563] :FORWARD ACCEPT [0:0]
> :OUTPUT ACCEPT [402:144198]
> :POSTROUTING ACCEPT [402:144198]
> -A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG 
> FIN,PSH,URG -j DROP
> -A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE
-j 
> DROP
> -A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST SYN,RST -j DROP
> -A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
> COMMIT
>
> *filter
> :INPUT DROP [1:242]
> :FORWARD DROP [0:0]
> :OUTPUT DROP [0:0]
> :icmp_packets - [0:0]
> -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 20 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 21 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 25 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 43 -j ACCEPT
> -A INPUT -p udp -m udp --dport 53 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 106 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 110 -j ACCEPT
> -A INPUT -p udp -m udp --dport 123 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 143 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 783 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 901 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 993 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 3306 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 10000 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 12000 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 15000 -j ACCEPT
> -A INPUT -s 127.0.0.1 -j ACCEPT
> -A INPUT -s 192.168.1.0/24 -i eth0 -p udp -m udp -d 192.168.1.41
--dport 
> 137 -j ACCEPT
> -A INPUT -s 192.168.1.0/24 -i eth0 -p udp -m udp -d 192.168.1.41
--dport 
> 138 -j ACCEPT
> -A INPUT -s 192.168.1.0/24 -i eth0 -p tcp -m tcp -d 192.168.1.41
--dport 
> 139 -j ACCEPT
> -A INPUT -s 192.168.1.0/24 -i eth0 -p tcp -m tcp -d 192.168.1.41
--dport 
> 445 -j ACCEPT
> -A INPUT -s 66.220.104.76 -i eth0 -p udp -m udp -d 71.111.151.20
--dport 
> 137 -j ACCEPT
> -A INPUT -s 66.220.104.76 -i eth0 -p udp -m udp -d 71.111.151.20
--dport 
> 137 -j ACCEPT
> -A INPUT -p icmp -j icmp_packets
> -A INPUT -j LOG --log-prefix "IPTABLES-IN Default Drop: " --log-level
7
>
>
> -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 20 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 21 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 22 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 23 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 25 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 43 -j ACCEPT
> -A OUTPUT -p udp -m udp --dport 53 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 80 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 106 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 110 -j ACCEPT
> -A OUTPUT -p udp -m udp --dport 123 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 143 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 443 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 783 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 901 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 993 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 3306 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 10000 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 12000 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 15000 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 2210 -j ACCEPT
> -A OUTPUT -d 127.0.0.1 -j ACCEPT
> -A OUTPUT -p icmp -j icmp_packets
> -A OUTPUT -j LOG --log-prefix "IPTABLES-OUT Default Drop: "
--log-level 7
>
>
> -A icmp_packets -p icmp -m icmp --icmp-type 0 -j ACCEPT
> -A icmp_packets -s 127.0.0.1 -p icmp -m icmp --icmp-type 8 -j ACCEPT
> -A icmp_packets -p icmp -m icmp --icmp-type 8 -j DROP
> -A icmp_packets -p icmp -m icmp --icmp-type 3 -j ACCEPT
> -A icmp_packets -p icmp -m icmp --icmp-type 11 -j ACCEPT
> COMMIT
>
>
>
>
>
>
> -- 
> No virus found in this incoming message.
> Checked by AVG Free Edition.
> Version: 7.1.371 / Virus Database: 267.13.13/198 - Release Date: 
> 12/12/2005
>
> 




------------------------------

_______________________________________________
netfilter mailing list
netfilter@lists.netfilter.org
https://lists.netfilter.org/mailman/listinfo/netfilter


End of netfilter Digest, Vol 17, Issue 15
*****************************************

