From: "david" <david@suarapembaruan.co.id>
Subject: Re: Blocking IP
Date: Thu, 29 Jul 2004 19:40:51 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004201c47569$4838bbb0$858310ac@suarapembaruan.com>
References: <5.1.0.14.2.20040602145807.00b74bf8@pop3.netcologne.de> <001601c47565$8e0ba110$858310ac@suarapembaruan.com> <200407291410.24531.victor@nk.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Dear Victor,

I still receive traffic from that ip.......


IPTABLES Rules
#iptables -I INPUT 1 -s 202.145.10.147 -j DROP

IPTRAF Monitoring
??202.145.10.147:1668                                                    =
31           19815     DONE       eth0       ?
??202.46.146.164:25                                                      =
33            1485     CLOSED     eth0       ?
??206.190.39.164:8

I try :
#iptables -I INPUT 1 -s 202.145.10.147 -j LOG
after that ip show again :
#iptables -L -nvx

Chain INPUT (policy ACCEPT 1532113 packets, 168017560 bytes)
    pkts      bytes target     prot opt in     out     source
destination
       0        0 LOG        all  --  *      *       202.145.10.174
0.0.0.0/0          LOG flags 0 level 4
       0        0 DROP       all  --  *      *       202.145.10.174
0.0.0.0/0

Chain FORWARD (policy ACCEPT 8470318 packets, 3950493169 bytes)
    pkts      bytes target     prot opt in     out     source
destination

Chain OUTPUT (policy ACCEPT 2106115 packets, 361037890 bytes)
    pkts      bytes target     prot opt in     out     source
destination

Chain RH-Lokkit-0-50-INPUT (0 references)
    pkts      bytes target     prot opt in     out     source
destination


Thank's
David



----- Original Message ----- 
From: "Victor Julien" <victor@nk.nl>
To: <netfilter@lists.netfilter.org>
Cc: "david" <david@suarapembaruan.co.id>
Sent: Thursday, July 29, 2004 7:10 PM
Subject: Re: Blocking IP


> Try #iptables -I INPUT 1 -s 202.145.10.146 -j DROP
>
> It will insert the rule on the top of the ruleset, so it matches first.
>
> Regards,
> Victor
>
> On Thursday 29 July 2004 14:14, david wrote:
> > Dear all,
> >
> > My mail server received so many virus mails from ip 202.145.10.147 and
> > after i look at gateway (linux) and i using iptraf i see so many traffic
> > from 202.145.10.147.
> > After that i try to block all traffic from 202.145.10.147 with command :
> > #iptables -A INPUT -s 202.145.10.146 -j DROP
> >
> > but i still receiveall traffic from 202.145.10.146......
> > Can anybody help me ........... that ip send virus in to mail server
more
> > then 20 mails per minute.......
> >
> >
> > Regards,
> > David Kandou
> >
> > Help me ... iam so confused
> >
> > FYI :
> > Iam using RedHat 9
> > eth0 --> ippublic
> > eth1 --> local ip
> > mail server --> local ip
>
>


