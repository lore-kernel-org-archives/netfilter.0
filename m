From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: basic understanding of iptables - some questions
Date: Wed, 23 Nov 2016 23:54:09 +0100
Message-ID: <a07f78ad-c0f7-21a4-890c-87b9b89269cb@plouf.fr.eu.org>
References: <560733058.4361908.1479674705472.JavaMail.zimbra@helmholtz-muenchen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <560733058.4361908.1479674705472.JavaMail.zimbra@helmholtz-muenchen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>, Netfilter <netfilter@vger.kernel.org>

Le 20/11/2016 à 21:45, Lentes, Bernd a écrit :
>
> I'm trying to understand Ubuntu 16.04 (kernel 4.4.0-45-generic) firewall rules. See the rules for the chain INPUT:
>
> Chain INPUT (policy DROP 20 packets, 800 bytes)
>  pkts bytes target     prot opt in     out     source               destination
>   880  134K ufw-before-logging-input  all  --  *      *       0.0.0.0/0            0.0.0.0/0

I always recommend to use iptables-save or iptables -S instead of 
iptables -L because I find the output format much easier to read.

> Chain ufw-before-input (1 references)
>  pkts bytes target     prot opt in     out     source               destination
>     0     0 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0
>   317 22568 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED,ESTABLISHED
(...)
> second rule: is that the rule for responses from outgoing packets ? E.g. i start a browser and open a web page. First my host does a TCP SYN to the web server, and this one answers with a tcp SYN ACK.

Yes.

> Because man iptables-extensions says:
>
> ESTABLISHED: The packet is associated with a connection which has seen packets in both directions.

Hint : including the packet being processed.

> RELATED: The packet is starting a new connection, but is associated with an existing connection, such as an FTP data transfer or an ICMP error.
>
> Because ESTABLISHED must have seen packets in BOTH directions.

Yes, including the packet being processed.

> When i open a web page and the first packet comes back from the webserver (SYN ACK), this connection does not have seen packets in both directions.

It just did. See above.

> And RELATED, as i understand, is e.g. for ftp, which uses in one session different destination ports (i think one for control and one for data ?).

Yes, and ICMP errors.

> This chain also accepts packets for icmp, dhcp, upnp and mDNS. Right ?

Except for ICMP errors and replies to unicast packets, probably not 
because the other listed protocols use broadcast or multicast, but 
conntrack only handles correctly unicast traffic.

> OK. Evaluating continues with ufw-user-input, which are e.g. the services opened by the admin for some services, like ssh ...
>
> Chain ufw-user-input (1 references)
>  pkts bytes target     prot opt in     out     source               destination
> 41587 1849K ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:22
>     0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0            udp dpt:22

Silly. SSH does not use UDP.

> And THEN comes ufw-after-logging-input, which logs all the packets which survived all the previous rules.
>
> Chain ufw-after-logging-input (1 references)
>  pkts bytes target     prot opt in     out     source               destination
> 42933 1717K LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0            LOG flags 8 level 4 prefix "[UFW BLOCK INPUT] "
>
>
> So ufw-after-logging-input comes into play when there is a packet which has no previous packet in any direction, is not for the allowed services nor for the denied services.
> E.g. i do a port scan to 12345 on that host. Right ? It should be logged by that rule.

Guess so.

> Because i don't have a service running on port 12345.

It does not matter to iptables whether a service is running on that port 
or not.
