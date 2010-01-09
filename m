From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: passive mode ftp high ports driving me nuts
Date: Sat, 09 Jan 2010 15:04:36 +0100
Message-ID: <4B488CF4.40506@chello.at>
References: <4B46323E.1050106@gmail.com> <4B4707EA.9010301@chello.at> <4B47F11D.1000507@gmail.com> <4B488ABD.6050603@chello.at>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B488ABD.6050603@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: margoandtodd@gmail.com

On 09.01.2010 14:55, Mart Frauenlob wrote:
> On 09.01.2010 03:59, MargoAndTodd wrote:
>> On 01/08/2010 02:24 AM, Mart Frauenlob wrote:
>>
>>>> It is the "--sport $unassgn --dport $unassgn" that is killing me.
>>>> How do I restrict the last three to just passive mode ftp?
>>>>
>>>
>>> use the 'helper' match extension. i.e: -m helper --helper ftp.
>>> if you need to distinguish between active and passive, you still can use
>>> the port and state matches for that.
>>
>> Hi Mart,
>>
>> Works perfectly.  Thank you!
>>
>> -T
>>
>> p.s. my new rules:
>>

[...]

> 
> if you use user-defined chains (which is good), take full advantage of
> it, by not repeating so many values in your ruleset. i.e. dsl-in will
> always have -i eth1 and -d $eth1_addr.
> you don't need -d $ANY_IP, just leave it out, gives the same result.
> you don't need --syn, if you rely on conntrack helper match.
> 
> let me suggest a more structured approach:
> 

[...]

> 
> as an untested example with some additional design considerations for
> invalid packets and related icmp.
> 

sorry had the naming for dsl-for and dsl-fwd mixed up, again corrected:

# assuming DROP policy for INPUT,OUTPUT,FORWARD...


for x in dsl-in dsl-out dsl-for invalid; do
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
for x in dsl-in dsl-out dsl-for; do
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
