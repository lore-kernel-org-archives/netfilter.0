From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: stop accepting new connections on port 80
Date: Fri, 9 Dec 2005 14:08:03 -0500 (EST)
Message-ID: <Pine.LNX.4.60.0512091405130.12372@darkstar.sysinfo.com>
References: <20051207123420.V66917@uberwoo.hedgpeth.com>
	<2486.192.168.3.8.1134153732.squirrel@192.168.3.8>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <2486.192.168.3.8.1134153732.squirrel@192.168.3.8>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Bill Hance <bill@billhance.com>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Fri, 9 Dec 2005, Bill Hance wrote:

> what about entering a new rule, immediately before the one saying
>
> -dport 80 -m state --state NEW -j ACCEPT
>
> the new one would be
>
> -dport 80 -m state --state NEW -j DROP
>
>
> that would drop the new connections before they got to the rule that
> accepts them
>
> and it shouldn't effect establish/related or connection tracking


Of course the question is then how does a connection become established in 
the first place....


I get the impression the only way to try and do what you are attemtping is 
to que to user space, do yer deterministic evaluations there on whether or 
not you have a full port 80 queue, and then deal with the new attempt to 
reach port 80 there, finally pushing it back from user space to the 
FW/iptables rules and such...other with more knowledge on the semantics of 
this can stepup to assist, but, you are not going to accomplish this with 
simple rule sets.

Thanks,

Ron DuFresne


>
>  -Bill
>
>
>
>
>> Hi,
>>
>> I've been trying to figure out how to get iptables to stop accepting new
>> connections on port 80 while letting the existing connections finish up
>> what they're doing.
>>
>> I thought it would be as easy as removing the rule that allows new
>> connections and leaving the rule that allowed related and established
>> connections, but when I remove the rule that allows new connections, all
>> connections stop working.
>>
>> I tried variations with the rule, like changing NEW to ESTABLISHED and the
>> such, but no luck...
>>
>> I was working on this during off hours when the web server only had maybe
>> 5 or 6 active connections, so I'm not sure if the connection tracking
>> module is the problem or if its what I'm doing.  I know the following
>> rules aren't the greatest, but we're behind a firewall and use host based
>> firewalls as just another security measure.
>>
>> This is all on stock RHEL4 kernels and packages - but I tested with gentoo
>> on 2.6.13 and had the same issues.
>>
>> hopefully I've included enough info to help you help me :)
>>
>> Thanks,
>>
>> Mike
>>
>>
>> ####### script to edit iptables rules
>> #!/bin/bash
>> # stop accepting new connections..
>>
>> # this is the default chain on the web servers.
>> chain="RH-Firewall-1-INPUT"
>>
>> case $1 in
>> start)
>>     # umm, yeah, start to stop accepting new connections
>>     echo "removing iptables rule for new connections on port 80"
>>     line=`iptables -nL --line-numbers | awk '$10 ~ /dpt:80/ {print $1}'`
>>     iptables -D RH-Firewall-1-INPUT $line
>> ;;
>>
>> stop)
>>     # re-add deleted chain to accept new connections
>>     echo "now allowing connections"
>>     # inserting it on line 6 because thats where it is when iptables
>> starts after a reboot
>>     iptables -I $chain 6 -p tcp -m state --state NEW -m tcp --dport 80 -j
>> ACCEPT
>> ;;
>> esac
>>
>> ####### end script
>>
>> #### system info
>> [root@www16 ~]# cat /etc/redhat-release
>> Red Hat Enterprise Linux AS release 4 (Nahant Update 2)
>> [root@www16 ~]# uname -a
>> Linux www16 2.6.9-22.ELsmp #1 SMP Mon Sep 19 18:32:14 EDT 2005 i686 i686
>> i386 GNU/Linux
>>
>> [root@www16 ~]# iptables -nL --line-numbers
>> Chain INPUT (policy ACCEPT)
>> num  target     prot opt source               destination
>> 1    RH-Firewall-1-INPUT  all  --  0.0.0.0/0            0.0.0.0/0
>>
>> Chain FORWARD (policy ACCEPT)
>> num  target     prot opt source               destination
>> 1    RH-Firewall-1-INPUT  all  --  0.0.0.0/0            0.0.0.0/0
>>
>> Chain OUTPUT (policy ACCEPT)
>> num  target     prot opt source               destination
>>
>> Chain RH-Firewall-1-INPUT (2 references)
>> num  target     prot opt source               destination
>> 1    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
>> 2    ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           icmp
>> type 255
>> 3    ACCEPT     esp  --  0.0.0.0/0            0.0.0.0/0
>> 4    ACCEPT     ah   --  0.0.0.0/0            0.0.0.0/0
>> 5    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state
>> RELATED,ESTABLISHED
>> 6    ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           state
>> NEW tcp dpt:80
>> 7    ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           state
>> NEW tcp dpt:22
>> 8    ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           state
>> NEW tcp dpt:5666
>> 9    ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           state
>> NEW udp dpt:161
>> 10   REJECT     all  --  0.0.0.0/0            0.0.0.0/0
>> reject-with icmp-host-prohibited
>>
>>
>>
>> [root@www16 ~]# iptables-save
>> # Generated by iptables-save v1.2.11 on Wed Dec  7 12:20:25 2005
>> *filter
>> :INPUT ACCEPT [0:0]
>> :FORWARD ACCEPT [0:0]
>> :OUTPUT ACCEPT [10643556:3502431634]
>> :RH-Firewall-1-INPUT - [0:0]
>> -A INPUT -j RH-Firewall-1-INPUT
>> -A FORWARD -j RH-Firewall-1-INPUT
>> -A RH-Firewall-1-INPUT -i lo -j ACCEPT
>> -A RH-Firewall-1-INPUT -p icmp -m icmp --icmp-type any -j ACCEPT
>> -A RH-Firewall-1-INPUT -p ipv6-crypt -j ACCEPT
>> -A RH-Firewall-1-INPUT -p ipv6-auth -j ACCEPT
>> -A RH-Firewall-1-INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
>> -A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j
>> ACCEPT
>> -A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j
>> ACCEPT
>> -A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 5666 -j
>> ACCEPT
>> -A RH-Firewall-1-INPUT -p udp -m state --state NEW -m udp --dport 161 -j
>> ACCEPT
>> -A RH-Firewall-1-INPUT -j REJECT --reject-with icmp-host-prohibited
>> COMMIT
>> # Completed on Wed Dec  7 12:20:25 2005
>>
>> [root@www16 ~]# iptables --version
>> iptables v1.2.11
>>
>>
>
>

- -- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         admin & senior security consultant:  sysinfo.com
                         http://sysinfo.com
Key fingerprint = 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629

...We waste time looking for the perfect lover
instead of creating the perfect love.

                 -Tom Robbins <Still Life With Woodpecker>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFDmdYWst+vzJSwZikRAoe3AJ4+XsxsQAJsEOjno8GzmACnMjFT1gCgiyfv
DQFvnWRuxP32E11WWHk9+Zw=
=Bi7W
-----END PGP SIGNATURE-----

