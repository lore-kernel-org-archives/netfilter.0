From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: Re: basic understanding of iptables - some questions
Date: Sun, 20 Nov 2016 16:14:18 -0500
Message-ID: <20161120161418.2ca1938b@playground>
References: <560733058.4361908.1479674705472.JavaMail.zimbra@helmholtz-muenchen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 MAIL1.WPI.EDU uAKLELb3030698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wpi.edu; s=_dkim;
        t=1479676461; i=@wpi.edu;
        bh=PUC6ftzcs1sXaUVTSSRgo4sGKsEQvZRXVWVcX/JgBGg=;
        h=Date:From:Cc:Subject:In-Reply-To:References;
        b=enO8w2DCDf2UQvok0GIm4VAZcn7Q7uUnK9Zlcm4Trpjx7A0t4hPTDEtgo8K0QRWJz
         O/LGWbKPlYMIbeV78dC0sfTN7/huGtZ23IXuWZx1tS11SgmaqZnTwOFwfO4YBLbxir
         hpf74F1eJyz3L7WuQvnpKvabj4Zi0CSDEr6d8H8A=
In-Reply-To: <560733058.4361908.1479674705472.JavaMail.zimbra@helmholtz-muenchen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 
Cc: Netfilter <netfilter@vger.kernel.org>

Unless I misunderstand or things have changed in recent years,
  - NEW refers to an unanswered SYN (for TCP) or the first packet of a UDP conn
  - RELATED refers to (1) an unanswered SYN (for TCP), or (2) the first packet of
    a UDP conn, that a conntrack helper has determined is related to an existing conn.
  - ESTABLISHED refers to all subsequent packets in any conn.

Therefore, you can only know that a packet is the first packet of a conn or it is a subsequent packet. You can't know which conn a RELATED packet is associated with, and without using CONNMARKs, you cannot know if a conn was RELATED once it is ESTABLISHED.

N


On Sun, 20 Nov 2016 21:45:05 +0100 (CET)
"Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de> wrote:

> Hi,
> 
> 
> 
> I'm trying to understand Ubuntu 16.04 (kernel 4.4.0-45-generic) firewall rules. See the rules for the chain INPUT:
> 
> Chain INPUT (policy DROP 20 packets, 800 bytes)
>  pkts bytes target     prot opt in     out     source               destination
>   880  134K ufw-before-logging-input  all  --  *      *       0.0.0.0/0            0.0.0.0/0
>   880  134K ufw-before-input  all  --  *      *       0.0.0.0/0            0.0.0.0/0
>   481 86297 ufw-after-input  all  --  *      *       0.0.0.0/0            0.0.0.0/0
>    20   800 ufw-after-logging-input  all  --  *      *       0.0.0.0/0            0.0.0.0/0
>    20   800 ufw-reject-input  all  --  *      *       0.0.0.0/0            0.0.0.0/0
>    20   800 ufw-track-input  all  --  *      *       0.0.0.0/0            0.0.0.0/0
> 
> chain ufw-before-logging-input (1 references)
>  pkts bytes target     prot opt in     out     source               destination
> 
> 
> Chain ufw-before-logging-input does nothing, so evaluating the rules continues with ufw-before-input:
> 
> Chain ufw-before-input (1 references)
>  pkts bytes target     prot opt in     out     source               destination
>     0     0 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0
>   317 22568 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED,ESTABLISHED
>     0     0 ufw-logging-deny  all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate INVALID
>     0     0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate INVALID
>     0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0            icmptype 3
>     0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0            icmptype 4
>     0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0            icmptype 11
>     0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0            icmptype 12
>     4   112 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0            icmptype 8
>    72 23616 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0            udp spt:67 dpt:68
>   487 87216 ufw-not-local  all  --  *      *       0.0.0.0/0            0.0.0.0/0
>     6   919 ACCEPT     udp  --  *      *       0.0.0.0/0            224.0.0.251          udp dpt:5353
>     0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            239.255.255.250      udp dpt:1900
>   481 86297 ufw-user-input  all  --  *      *       0.0.0.0/0            0.0.0.0/0
> 
> First question: 
> second rule: is that the rule for responses from outgoing packets ? E.g. i start a browser and open a web page. First my host does a TCP SYN to the web server, and this one answers with a tcp SYN ACK.
> Because man iptables-extensions says:
> 
> ESTABLISHED: The packet is associated with a connection which has seen packets in both directions.
> RELATED: The packet is starting a new connection, but is associated with an existing connection, such as an FTP data transfer or an ICMP error.
> 
> Because ESTABLISHED must have seen packets in BOTH directions. When i open a web page and the first packet comes back from the webserver (SYN ACK), this connection does not have seen packets in both directions.
> And RELATED, as i understand, is e.g. for ftp, which uses in one session different destination ports (i think one for control and one for data ?).
> 
> But if this is not the rule for the first packet coming back, where is this rule ?
> 
> This chain also accepts packets for icmp, dhcp, upnp and mDNS. Right ?
> 
> OK. Evaluating continues with ufw-user-input, which are e.g. the services opened by the admin for some services, like ssh ...
> 
> Chain ufw-user-input (1 references)
>  pkts bytes target     prot opt in     out     source               destination
> 41587 1849K ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:22
>     0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0            udp dpt:22
>     1    60 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:7937
>     5   300 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:7938
>     0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0            udp dpt:7938
> 
> 
> Evaluating continues with ufw-after-input, which drops e.g. some packtes for windows services (file sharing ...) and dhcp.
>   It does this by calling another chain which drops the packets.
> 
> Chain ufw-after-input (1 references)
>  pkts bytes target     prot opt in     out     source               destination
> 18978 1486K ufw-skip-to-policy-input  udp  --  *      *       0.0.0.0/0            0.0.0.0/0            udp dpt:137
>  5358 1231K ufw-skip-to-policy-input  udp  --  *      *       0.0.0.0/0            0.0.0.0/0            udp dpt:138
>     0     0 ufw-skip-to-policy-input  tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:139
>     0     0 ufw-skip-to-policy-input  tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:445
> 67988   25M ufw-skip-to-policy-input  udp  --  *      *       0.0.0.0/0            0.0.0.0/0            udp dpt:67
>     0     0 ufw-skip-to-policy-input  udp  --  *      *       0.0.0.0/0            0.0.0.0/0            udp dpt:68
>  159K   20M ufw-skip-to-policy-input  all  --  *      *       0.0.0.0/0            0.0.0.0/0            ADDRTYPE match dst-type BROADCAST
> 
> Chain ufw-skip-to-policy-input (7 references)
>  pkts bytes target     prot opt in     out     source               destination
>  251K   48M DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0
> 
> 
> And THEN comes ufw-after-logging-input, which logs all the packets which survived all the previous rules.
> 
> Chain ufw-after-logging-input (1 references)
>  pkts bytes target     prot opt in     out     source               destination
> 42933 1717K LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0            LOG flags 8 level 4 prefix "[UFW BLOCK INPUT] "
> 
> 
> So ufw-after-logging-input comes into play when there is a packet which has no previous packet in any direction, is not for the allowed services nor for the denied services.
> E.g. i do a port scan to 12345 on that host. Right ? It should be logged by that rule. Because i don't have a service running on port 12345.
> 
> The reason i'm asking is that i have some logging from this rule with ip addresses not from our network, and i'd like to know when this rule comes into play.
> 
> I'd appreciate any help, if you want to know more please ask me.
> 
> Thanks.
> 
> Bernd
> 
> 

