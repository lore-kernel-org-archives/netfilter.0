From: mouss <mouss@netoyen.net>
Subject: Re: iptables block samba or not?
Date: Fri, 25 Jan 2008 17:13:40 +0100
Message-ID: <479A0AB4.4070104@netoyen.net>
References: <200801251602.m0PG2Cbi026447@indigo.cs.bgu.ac.il>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200801251602.m0PG2Cbi026447@indigo.cs.bgu.ac.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Eial Czerwacki <eial@cs.bgu.ac.il>
Cc: netfilter@vger.kernel.org

Eial Czerwacki wrote:
> works with it and without that, one more question, is there a way to approve a input only if I initiated the connection?
>   

that's what your "accept all previously established connections" does if 
you don't add other INPUT rules.
> On Fri 25 Jan 17:15 2008 mouss wrote:
>   
>> Eial Czerwacki wrote:
>>     
>>> the general rules has been changed abit, here:
>>>
>>> #!/bin/bash
>>> #PlasmaWall rules
>>> NET_IPS="132.72.144.0/20 192.168.114.0/24"
>>> #setup defaults
>>> echo "  - Flushing rules..."
>>> iptables -F
>>> echo "  - Setting default policy..."
>>> iptables -P INPUT DROP
>>> iptables -P OUTPUT ACCEPT
>>> iptables -P FORWARD DROP
>>>
>>> echo "  - Setting input rules..."
>>> # accept all from localhost
>>> /sbin/iptables -A INPUT -s 127.0.0.1 -j ACCEPT
>>>
>>> # accept all previously established connections
>>> /sbin/iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
>>>
>>> #input
>>> # ssh
>>> #/sbin/iptables -A INPUT -p tcp -m state --state NEW --dport 22 -j ACCEPT
>>>
>>> # ftp / webserver related
>>> /sbin/iptables -A INPUT -p tcp -m state --state NEW --dport 21 -j ACCEPT
>>> /sbin/iptables -A INPUT -p tcp -m state --state NEW --dport 443 -j ACCEPT
>>> /sbin/iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j ACCEPT
>>>
>>> # Windows / Samba
>>> for host in $NET_IPS; do
>>>  /sbin/iptables -A INPUT -p tcp -m state --state NEW --dport 135 -s $host -j ACCEPT
>>>  /sbin/iptables -A INPUT -p tcp -m state --state NEW --dport 139 -s $host -j ACCEPT
>>>  /sbin/iptables -A INPUT -p udp -m state --state NEW --dport 137 -s $host -j ACCEPT
>>>  /sbin/iptables -A INPUT -p udp -m state --state NEW --dport 138 -s $host -j ACCEPT
>>>  /sbin/iptables -A INPUT -p tcp -m state --state NEW --dport 426 -s $host -j ACCEPT
>>>  /sbin/iptables -A INPUT -p tcp -m state --state NEW --dport 445 -s $host -j ACCEPT
>>> done
>>>
>>> # up to 5 Bit-torrent connections
>>> /sbin/iptables -A INPUT -p tcp -m state --state NEW --dport 6881:6886 -j ACCEPT
>>>
>>> #flood defence
>>> #-N syn-flood
>>> #/sbin/iptables -A INPUT -p tcp --syn -j syn-flood
>>> #/sbin/iptables -A syn-flood -m limit --limit 1/s --limit-burst 4 -j RETURN
>>> #/sbin/iptables -A syn-flood -j DROP
>>> # Handle fragment flood attacks
>>> /sbin/iptables -A INPUT -f -j LOG --log-prefix "IPTABLES FRAGMENTS: "
>>> /sbin/iptables -A INPUT -f -j DROP
>>>
>>> #else
>>> /sbin/iptables -A INPUT -j LOG --log-prefix "Rejected: "
>>> /sbin/iptables -A INPUT -j REJECT --reject-with icmp-port-unreachable
>>>
>>> echo "  - Setting output rules..."
>>> #output
>>>
>>> # accept all previously established connections
>>> /sbin/iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
>>>
>>> /sbin/iptables -A OUTPUT -p tcp -m state --state NEW --dport 22 -j ACCEPT
>>> echo " done."
>>>   
>>>       
>> comment out the last output rules and try again just to make sure the 
>> solution is elsewhere!
>>
>> -
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>     
>
>
>
>
>   

