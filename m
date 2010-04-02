From: Dennison Williams <dennison.williams@gmail.com>
Subject: Re: MARK not working
Date: Fri, 02 Apr 2010 00:27:21 -0700
Message-ID: <4BB59C59.50607@gmail.com>
References: <4BB53BEC.9010709@gmail.com> <20100402065742.23be08f0@catlap>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:references:in-reply-to
         :x-enigmail-version:content-type:content-transfer-encoding;
        bh=e0tgrJqs3K+Grp3N9UIlx2NcLEWtmO1fPd98y9RUzTQ=;
        b=iHSmQNYRjtEZnMIwcwTmDZILKkrLtyXii8PqAGDQ7vDbolhqTOXcyuXB9FrEp2pzP/
         dDMI0n0j/QYQu90p4yxrYr+1sbAiB4Jy3viIoyjEsu0458isW5BLyZCIuKnjNGnrW+RJ
         F6buqn1EfjawBtAEBOKYuNenJZW+2WaVlwDpg=
In-Reply-To: <20100402065742.23be08f0@catlap>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Marek Kierdelewicz wrote:
> I think packets marked 0x1 in prerouting should never reach LOG &
> ACCEPT rule because of the following rule before them:
>
>   
>> -A INPUT -i eth1 -p udp -m udp --dport 4500 -j ACCEPT
>>     
>
> You can clear counters, feed some test traffic to the box and send me
> counter information retrieved with following commands:
> iptables -L -nv -t filter
> iptables -L -nv -t mangle

Yes, this is a bit confusing to me as well.  In this scenario we have
the establishing of a vpn connection (udp port 4500), following this is
an attempt to establish a l2tp connection (udp port 1701 encapsulated in
the vpn tunnel).

Before brining up the vpn I flush both mangle/PREROUTING and
filter/INPUT tables:
# iptables -t filter -Z
# iptables -t mangle -Z PREROUTING

I then succesfully bring up the vpn connection and provide a count of
the two tables:
# iptables -t mangle -L PREROUTING -vxn
Chain PREROUTING (policy ACCEPT 97 packets, 10778 bytes)
    pkts      bytes target     prot opt in     out    
source               destination
       2     1004 MARK       udp  --  eth1   *      
0.0.0.0/0            0.0.0.0/0           udp dpt:500 MARK xset
0x1/0xffffffff
       9     1744 MARK       udp  --  eth1   *      
0.0.0.0/0            0.0.0.0/0           udp dpt:4500 MARK xset
0x1/0xffffffff
       0        0 MARK       esp  --  eth1   *      
0.0.0.0/0            0.0.0.0/0           MARK xset 0x1/0xffffffff

# iptables -t filter -L INPUT -vxn
Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out    
source               destination
       0        0 REJECT     all  --  !lo    *      
0.0.0.0/0            127.0.0.0/8         reject-with icmp-port-unreachable
     374    37299 Accounting  all  --  *      *      
0.0.0.0/0            0.0.0.0/0
       0        0 ACCEPT     all  --  lo     *      
0.0.0.0/0            0.0.0.0/0
       0        0 ACCEPT     all  --  eth2   *      
0.0.0.0/0            0.0.0.0/0
     371    36320 ACCEPT     all  --  *      *      
0.0.0.0/0            0.0.0.0/0           state RELATED,ESTABLISHED
       1      620 ACCEPT     all  --  eth1   *      
0.0.0.0/0            0.0.0.0/0           mark match 0x1
       0        0 ACCEPT     esp  --  *      *      
0.0.0.0/0            0.0.0.0/0
       0        0 ACCEPT     udp  --  eth1   *      
0.0.0.0/0            0.0.0.0/0           udp dpt:4500
       0        0 ACCEPT     udp  --  eth1   *      
0.0.0.0/0            0.0.0.0/0           udp dpt:500
       0        0 ACCEPT     icmp --  eth1   *      
0.0.0.0/0            0.0.0.0/0           icmp type 8 limit: avg 1/sec
burst 5
       0        0 DROP       tcp  --  *      *      
0.0.0.0/0            0.0.0.0/0           tcp dpt:22 state NEW recent:
UPDATE seconds: 60 hit_count: 4 name: DEFAULT side: source
       0        0            tcp  --  *      *      
0.0.0.0/0            0.0.0.0/0           tcp dpt:22 state NEW recent:
SET name: DEFAULT side: source
       0        0 ACCEPT     tcp  --  *      *      
0.0.0.0/0            0.0.0.0/0           tcp dpt:80
       0        0 ACCEPT     tcp  --  *      *      
0.0.0.0/0            0.0.0.0/0           tcp dpt:443
       0        0 ACCEPT     tcp  --  *      *      
0.0.0.0/0            0.0.0.0/0           tcp dpt:22
       0        0 ACCEPT     tcp  --  *      *      
0.0.0.0/0            0.0.0.0/0           tcp dpt:5667
       2      359 LOG        all  --  *      *      
0.0.0.0/0            0.0.0.0/0           LOG flags 0 level 4
       2      359 REJECT     all  --  *      *      
0.0.0.0/0            0.0.0.0/0           reject-with icmp-port-unreachable



Then I bring up the l2tp connection, and provide a count.   This is
where the problem is:
# iptables -t mangle -L PREROUTING -vxn
Chain PREROUTING (policy ACCEPT 280 packets, 31531 bytes)
    pkts      bytes target     prot opt in     out    
source               destination
       2     1004 MARK       udp  --  eth1   *      
0.0.0.0/0            0.0.0.0/0           udp dpt:500 MARK xset
0x1/0xffffffff
      17     1976 MARK       udp  --  eth1   *      
0.0.0.0/0            0.0.0.0/0           udp dpt:4500 MARK xset
0x1/0xffffffff
       0        0 MARK       esp  --  eth1   *      
0.0.0.0/0            0.0.0.0/0           MARK xset 0x1/0xffffffff

You can see here that we have an extra 8 packets from the l2tp
connection (the l2tp client tries 8 times before it gives up).

# iptables -t filter -L INPUT -vxn
Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out    
source               destination
       0        0 REJECT     all  --  !lo    *      
0.0.0.0/0            127.0.0.0/8         reject-with icmp-port-unreachable
     433    45512 Accounting  all  --  *      *      
0.0.0.0/0            0.0.0.0/0
       0        0 ACCEPT     all  --  lo     *      
0.0.0.0/0            0.0.0.0/0
       2      130 ACCEPT     all  --  eth2   *      
0.0.0.0/0            0.0.0.0/0
     412    41532 ACCEPT     all  --  *      *      
0.0.0.0/0            0.0.0.0/0           state RELATED,ESTABLISHED
       1      620 ACCEPT     all  --  eth1   *      
0.0.0.0/0            0.0.0.0/0           mark match 0x1
       0        0 ACCEPT     esp  --  *      *      
0.0.0.0/0            0.0.0.0/0
       0        0 ACCEPT     udp  --  eth1   *      
0.0.0.0/0            0.0.0.0/0           udp dpt:4500
       0        0 ACCEPT     udp  --  eth1   *      
0.0.0.0/0            0.0.0.0/0           udp dpt:500
       0        0 ACCEPT     icmp --  eth1   *      
0.0.0.0/0            0.0.0.0/0           icmp type 8 limit: avg 1/sec
burst 5
       0        0 DROP       tcp  --  *      *      
0.0.0.0/0            0.0.0.0/0           tcp dpt:22 state NEW recent:
UPDATE seconds: 60 hit_count: 4 name: DEFAULT side: source
       0        0            tcp  --  *      *      
0.0.0.0/0            0.0.0.0/0           tcp dpt:22 state NEW recent:
SET name: DEFAULT side: source
       0        0 ACCEPT     tcp  --  *      *      
0.0.0.0/0            0.0.0.0/0           tcp dpt:80
       0        0 ACCEPT     tcp  --  *      *      
0.0.0.0/0            0.0.0.0/0           tcp dpt:443
       0        0 ACCEPT     tcp  --  *      *      
0.0.0.0/0            0.0.0.0/0           tcp dpt:22
       0        0 ACCEPT     tcp  --  *      *      
0.0.0.0/0            0.0.0.0/0           tcp dpt:5667
      18     3230 LOG        all  --  *      *      
0.0.0.0/0            0.0.0.0/0           LOG flags 0 level 4
      18     3230 REJECT     all  --  *      *      
0.0.0.0/0            0.0.0.0/0           reject-with icmp-port-unreachable


And you can see here that we do not get anymore matched packets in the
filter/INPUT table nor are anymore vpn packets found (udp port 4500).

Sincerely,
Dennison Williams
