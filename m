From: Auro Benas <ebay.omg@gmail.com>
Subject: IPTables Filtering traffic before Natting HOW TO?
Date: Tue, 21 Jun 2011 00:45:19 +0200
Message-ID: <BANLkTim1uqdSWuQwsiJvEuw=cD0Pfi0=Zg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=vtalGiMb4VxKj+3gr7swxuidG6vUHRTW3sMXAQ9gMzI=;
        b=W9/LpzUJkB8cLZJoezXEDq7GeuuNP0m2g8Up7MX/eUTxAMQm5aVpqdQCRw7HtxD6lq
         sZL+JtfnJjutFNxzF66W+8c1PWJaMOn2411LetM8QhZK0dO7Wrp2nvOMirAM2ZetfYv1
         X6OIQfD6SHmMh02cPbS22s21cGGj01FVzpfkc=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Dear Readers,
I'm sorry to waste your time but I'm in death point of developing and
today is 12Th day that I passed more than 13 hours a day on reading
about IPTables and trying to make it work, i

started dream about PREROUTING and POSTROUTING and I'm almost fused.

I'm not an expert but I'm writing this message with hope that some one
will be so kind to reply and help me or at least indicate me the way.

- What am I trying to get?
I'm developing a DMZ with IPTable (from now on I'll refer as
IPGServer) that behind the IPGServer will be between 10 to 30 apache
servers witch will be connected to the Internet.

1 - I need AS FIRST OF ALL that the IPGServer do the job as IP BLACK
LIST filter.
2 - I need AS SECOND that IPGServer route ONLY the filtered and
allowed connections to the servers inside the DMZ.
3 - I need that the routing of the connections/request that was made
by visitors with 10 to 30 third level domains (example:
xx1.domain.com, xx2.domain.com, --- x30.domain.com)
are recognize, converted to the apropriate private IP (I don't use DNS
server as suggested to do that I found file HOSTS more clean and fast
as solution) and forwarded to the apache

destination server so xx1.domain.com --> 10.10.0.1 and so on.

- My Data Flow Logic (I omitted some fases as input, output, forward
in what follows):
Client - Internet (Request xx1.domain.com) -->
IPGServer-eth0 (Ex:62.10.30.30) -->
Filter Source IP (IF match black list DROP  ELSE log connections and
forward to destination server) -->
IPGServer-eth1 (10.0.0.1)-->
PREROUTING -s xx1.domain.com DNAT --to 10.10.0.1 -->
Internal Netowrk/switch -->
Apache Web Server accept, process and send reply back to
IPGServer-eth1 (10.0.0.1) -->
POSTROUTING -s 10.10.0.1 --> SNAT xx1.domain.com -->
eth0 (Ex:62.10.30.30) -->
Internet (Request xx1.domain.com) -->
Final Client --|


- What have I accive till now?
Well I accived to make the DMZ working as it must do with all the
MASQUERADE stuff, PREROUTING, POSTORUTING, etc.
I found the HOSTS file to configure to avoid DNS server configuration
and network overuse.
My APACHE WEB Servers are contacted from the Internet and thay can
connect outside (Ex: sudo apt-get update - and so on).
DMZ is really nice stuff and it works GREAT!


- What is my problem than?
Well in the DATA FLOW of the IPTAbles:
http://www.linuxhomenetworking.com/wiki/index.php/Quick_HOWTO_:_Ch14_:_Linux_Firewalls_Using_iptables

I see that the first table that is "touched" by the incoming packet is
the PREROUTING and I you can believe me it works precisely in this
way, I tested and retested this tenths of

times
So I conclude that PREROUTING is my MAIN problem!!!!!

Why??
Well How do I filter witch IPs are allowed and witch no to pass inside
the private network if PREROUTING exlude my FILTER table?

Why I need PREROUTING?
I'll not teaching you nothing new but I need it to NAT the third level
domains and redirect tham to the defined APACHE WEB server that stay
in the private network.

I'm unable to do this.
I readed and re readed the HOWTO guides that I found on netfilter.org as:
http://netfilter.org/documentation/HOWTO//NAT-HOWTO.txt

Mylast hope before contacting you guys was the point 9 ( 9. Mixing NAT
and Packet Filtering) in this guide:
http://netfilter.org/documentation/HOWTO//packet-filtering-HOWTO.txt

but I'm sorry I surrender I really don't understand how that works.

I hope to get a reply to solve my problem because I'm really don't
know what I'm doing wrong or what I'm not doing.

Thank you in advance for any suggestion or solution related to my problem.

Best regards,
Auro B.
