From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: passive mode ftp high ports driving me nuts
Date: Sat, 09 Jan 2010 14:55:09 +0100
Message-ID: <4B488ABD.6050603@chello.at>
References: <4B46323E.1050106@gmail.com> <4B4707EA.9010301@chello.at> <4B47F11D.1000507@gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B47F11D.1000507@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: margoandtodd@gmail.com

On 09.01.2010 03:59, MargoAndTodd wrote:
> On 01/08/2010 02:24 AM, Mart Frauenlob wrote:
> 
>>> It is the "--sport $unassgn --dport $unassgn" that is killing me.
>>> How do I restrict the last three to just passive mode ftp?
>>>
>>
>> use the 'helper' match extension. i.e: -m helper --helper ftp.
>> if you need to distinguish between active and passive, you still can use
>> the port and state matches for that.
> 
> Hi Mart,
> 
> Works perfectly.  Thank you!
> 
> -T
> 
> p.s. my new rules:
> 
> # ftp passive mode (browser) stuff.  Note: ftp_conntrack module is
> required, e.g.:
> # /etc/sysconfig/iptables-config:
> # IPTABLES_MODULES="ip_conntrack_ftp"
> #
> $tbls -A dsl-out  -o eth1  -p tcp  -s $eth1_addr --sport $unassgn
> --dport ftp         -m state --state NEW,ESTABLISHED           -j ACCEPT
> $tbls -A dsl-in   -i eth1  -p tcp  ! --syn --sport ftp -d $eth1_addr
> --dport $unassgn -m state --state RELATED,ESTABLISHED       -j ACCEPT
> $tbls -A dsl-for  -i eth1  -p tcp  ! --syn --sport ftp -d $internal_net
>  --dport $unassgn  -m state --state RELATED,ESTABLISHED  -j ACCEPT
> # The "ftpdata" session is a "new" one when it sends the SYN.  However,
> the ftp_conntrack module marks it as related to its controlling
> # ftp session, so that state=related matches.  This should deny any
> "ftpdata" session that doesn't have a controlling ftp session.
> #$tbls -A dsl-out  -o eth1  -p tcp  -s $eth1_addr --sport $unassgn -d
> $ANY_IP --dport $unassgn -m state --state RELATED,ESTABLISHED      -j
> ACCEPT
> #$tbls -A dsl-in   -i eth1  -p tcp  ! --syn  -s $ANY_IP --sport $unassgn
> -d $eth1_addr --dport $unassgn  -m state --state RELATED,ESTABLISHED  
> -j ACCEPT
> #$tbls -A dsl-for  -i eth1  -p tcp  ! --syn  -s $ANY_IP --sport $unassgn
> -d $internal_net --dport $unassgn   -m state --state RELATED,ESTABLISHED
>  -j ACCEPT
> $tbls -A dsl-out  -o eth1  -p tcp  -s $eth1_addr       -d $ANY_IP -m
> helper --helper ftp -m state --state RELATED,ESTABLISHED  -j ACCEPT
> $tbls -A dsl-in   -i eth1  -p tcp  ! --syn  -s $ANY_IP -d $eth1_addr -m
> helper --helper ftp -m state --state RELATED,ESTABLISHED  -j ACCEPT
> $tbls -A dsl-for  -i eth1  -p tcp  ! --syn  -s $ANY_IP -d $internal_net
> -m helper --helper ftp -m state --state RELATED,ESTABLISHED  -j ACCEPT
> 

if you use user-defined chains (which is good), take full advantage of
it, by not repeating so many values in your ruleset. i.e. dsl-in will
always have -i eth1 and -d $eth1_addr.
you don't need -d $ANY_IP, just leave it out, gives the same result.
you don't need --syn, if you rely on conntrack helper match.

let me suggest a more structured approach:


# assuming DROP policy for INPUT,OUTPUT,FORWARD...


for x in dsl-in dsl-out dsl-fwd allow_ftp invalid; do
	$ipt -N $x
done

# sort out the illegal packets - could add more eventually...
$ipt -A invalid -p tcp ! --syn -m state --state NEW -j DROP
$ipt -A invalid -m state --state INVALID -j DROP

# global rules:
# allow established - speed up processing by placing rule on top
# then sort out bad ones
# allow related icmp
for x in INPUT OUTPUT FORWARD; do
	$ipt -A $x -m state ESTABLISHED -j ACCEPT
	$ipt -A $x -j invalid
	$ipt -A $x -p icmp -m state --state RELATED -j ACCEPT
done

# allow the related ftp packets
for x in dsl-in dsl-out dsl-fwd; do
	$ipt -A $x -m helper --helper ftp -j ACCEPT
done

# allow new outgoing ftp connections
$ipt -A dsl-out -p tcp --dport 21 -m state --state NEW -j ACCEPT
$ipt -A dsl-for -s $internal_net -p tcp --dport 21 -m state --state NEW
-j ACCEPT

# jump tree
$ipt -A INPUT -i eth1 -d $eth1_addr -j dsl-in
$ipt -A OUTPUT -o eth1 -s $eth1_addr -j dsl-out
$ipt -A FORWARD -i eth1 -d $internal_net -j dsl-for
$ipt -A FORWARD -o eth1 -s $internal_net -j dsl-for


as an untested example with some additional design considerations for
invalid packets and related icmp.

regards

Mart

