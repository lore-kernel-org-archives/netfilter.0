From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Why is my 443 port blocked
Date: Sat, 21 Oct 2006 10:16:58 +0200
Message-ID: <001301c6f4e9$47280440$0101000a@tanjian>
References: <20061021074630.14729.qmail@web31005.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20061021074630.14729.qmail@web31005.mail.mud.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Adhi Laksono <mailto:wingback06@yahoo.com> wrote:
> OK, thank you very much for the help... I will try
> it...
> 
> Can I write the rules like this too :
> 
> $IPTABLES -A LAN-Internet -p tcp -s $NET_LSN -d 0/0
> --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
> $IPTABLES -A LAN-Internet -p tcp -s 0/0 --sport 443 -d
> $NET_LAN -m state --state RELATED,ESTABLISHED -j
> ACCEPT
> 
> It's the same right??? or it's different???

[quote from previous post:]

>> $ipt -A LAN-Internet -m state --state RELATED,ESTABLISHED \
>>   -j ACCEPT
>> $ipt -A LAN-Internet -m state --state NEW -s $NET_LAN \
>>   -m multiport -p tcp --dports 80,443 -j ACCEPT

As you can see: no, the rules are not the same and do not act the same
(well, they might, but they might not).

You only need to match packets in state NEW (optionally you can also use
--syn when matching tcp packets). After that, packets in a connection
that is validated by such rule are either ESTABLISHED or RELATED.

There's no need to specify -d 0/0. If you omit it, it is asumed.

What is the reason you're using a user defined chain "LAN-Internet"? It
doesn't sound like your ruleset is that complex.

Also, you don't show the rest of your ruleset. It may be irrelevant, but
rules in it could also be preventing the rules you show from working.

> Oh yeah... I have a task in my campus to make a
> firewall with a default policy ACCEPT, but I still
> don't know witch port to block... can you help me with
> this,

I'm sorry but I can't because you don't specify what has to be
firewalled.

> or is there any reference that I can read... my block
> script is this :
> 
> dropport="137:138 5050" <this is where I put my ports
> to block>
> 
> #this is my rule
> for ports in $dropport;do
> $IPTABLES -A LAN-Internet -p tcp -s 0/0 -d $NET_LAN
> --dport $ports -j DROPLOG
> $IPTABLES -A LAN-Internet -p udp -s 0/0 -d $NET_LAN
> --dport $ports -j DROPLOG
> done;

Here you don't specify a state where in previous rules you do. Perhaps
you want to be consistent in this throughout the script, but that's your
call..

There's no need to specify -s 0/0; you don't specify -d 0/0 either (so
it is assumed). Personally I think it just clutters the line to be
executed with useless information.

> DROPLOG is my LOG chain with DROP policy... Is this
> script save??? well, it's easy to block port though, I
> can just add the ports I like to block in the
> "dropport" variable...

I don't consider it safe: you only block the specified tcp and udp
ports. All other traffic is allowed and IMHO a firewall should block
everything that I don't specifically allow.
But again: I don't know what it is you need to achieve.

If you have to make a firewall with policy set to ACCEPT, why not make
the **last** rule in a chain a DROP rule:

$ipt -P <chain> -j ACCEPT
$ipt <stuff to allow>
...
$ipt -A <chain> -j DROP

Here you have an ACCEPT policy but the ruleset will act the same way
when doing this:

$ipt -P <chain> -j DROP
$ipt <stuff to allow>
...


Gr,
Rob


> --- Rob Sterenborg <rob@sterenborg.info> wrote:
> 
>>> I made a script for my firewall, one of the rules is
>>> 
>>> $IPTABLES -A LAN-Internet -p tcp -s $NET_LSN -d 0/0
>>> --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
>>> 
>>> $IPTABLES -A LAN-Internet -p tcp -s 0/0 --sport 443 -d
>>> $NET_LAN -m state --state ESTABLISHED -j ACCEPT
>>> 
>>> with my default policy DROP..
>>> 
>>> I can open http://www.yahoo.com, but how come I can't open the
>>> mail.yahoo.com??? 
>>> 
>>> In my log list, it says that the packet for port 443
>>> is blocked, and sometimes port 80 is blocked to???
>>> what's wrong with my firewall??? why isn't it
>>> stable...
>> 
>> Try this:
>> 
>> $ipt -A LAN-Internet -m state --state
>> RELATED,ESTABLISHED \
>>   -j ACCEPT
>> $ipt -A LAN-Internet -m state --state NEW -s
>> $NET_LAN \
>>   -m multiport -p tcp --dports 80,443 -j ACCEPT
>> 
>> Why not have the RELATED,ESTABLISHED rule in your
>> FORWARD chain? This
>> rule will match most traffic so you want it to be
>> one of the first rules
>> to be checked.
>> 
>> 
>> Gr,
>> Rob


