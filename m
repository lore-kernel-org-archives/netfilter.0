From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: passive mode ftp high ports driving me nuts
Date: Fri, 08 Jan 2010 11:24:42 +0100
Message-ID: <4B4707EA.9010301@chello.at>
References: <4B46323E.1050106@gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B46323E.1050106@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 07.01.2010 20:13, MargoAndTodd wrote:
> Hi All,
> 
> In my firewall, I deny all and then allow what
> services though that I want.  Problem: on
> passive mode ftp, where the second connection is
> estabilshed using random high ports, other
> services are using my (last three) ftp rules.
> 
> My passive mode rules:
> 
> /etc/sysconfig/iptables-config:
> IPTABLES_MODULES="ip_conntrack_netbios_ns ip_nat_ftp ip_conntrack_ftp
> ip_conntrack_tftp"
> 
> unassgn=1024:65535
> $tbls -A dsl-out  -o eth1  -p tcp  -s $eth1_addr --sport $unassgn
> --dport ftp         -m state --state NEW,ESTABLISHED           -j ACCEPT
> 
> $tbls -A dsl-in   -i eth1  -p tcp  ! --syn --sport ftp -d $eth1_addr
> --dport $unassgn -m state --state RELATED,ESTABLISHED       -j ACCEPT
> 
> $tbls -A dsl-for  -i eth1  -p tcp  ! --syn --sport ftp -d $internal_net
>  --dport $unassgn  -m state --state RELATED,ESTABLISHED  -j ACCEPT
> 
> # The "ftpdata" session is a "new" one when it sends the SYN.  However,
> the ftp_conntrack module marks it as related to its controlling
> # ftp session, so that state=related matches.  This should deny any
> "ftpdata" session that doesn't have a controlling ftp session.
> 
> $tbls -A dsl-out  -o eth1  -p tcp  -s $eth1_addr --sport $unassgn -d
> $ANY_IP --dport $unassgn -m state --state RELATED,ESTABLISHED      -j
> ACCEPT
> 
> $tbls -A dsl-in   -i eth1  -p tcp  ! --syn  -s $ANY_IP --sport $unassgn
> -d $eth1_addr --dport $unassgn  -m state --state RELATED,ESTABLISHED  
> -j ACCEPT
> 
> $tbls -A dsl-for  -i eth1  -p tcp  ! --syn  -s $ANY_IP --sport $unassgn
> -d $internal_net --dport $unassgn   -m state --state RELATED,ESTABLISHED
>  -j ACCEPT
> 
> 
> It is the "--sport $unassgn --dport $unassgn" that is killing me.
> How do I restrict the last three to just passive mode ftp?
> 

use the 'helper' match extension. i.e: -m helper --helper ftp.
if you need to distinguish between active and passive, you still can use
the port and state matches for that.

> Also, what is the lowest port that the random passive mode ftp
> port will choose?  20,000?  That may be all I need to do.

personally i never had problems using '1024:' as unassigned/unprivileged
port range. but as stated before, this is obsolete and / or irrelevant.
the helper match will select the appropriate packets.

> 
> Many thanks,
> -T

regards

Mart
