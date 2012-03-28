From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables and the owner module
Date: Wed, 28 Mar 2012 22:48:23 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1203282242140.22987@frira.zrqbmnf.qr>
References: <20120327194521.00a33d86@gmail.com> <alpine.LNX.2.01.1203280325160.14701@frira.zrqbmnf.qr> <20120328124332.66e7ad79@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120328124332.66e7ad79@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Firstname Lastname <forbiddentransition@gmail.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2012-03-28 18:43, Firstname Lastname wrote:
>
>>>-A OUTPUT -o eth0 -p tcp -m tcp --sport 32768:61000 -m multiport
>>>--dports 80,443 -m conntrack --ctstate NEW,ESTABLISHED -m owner
>>>--uid-owner 1000 -j ACCEPT
>>
>> ct state is [perhaps] not NEW nor EST.  
>
>If the ct state is not NEW nor EST, then its my understanding that none 
>of the rules should match.
>
>The order through the chain is as stated previously: 
>
>  -A OUTPUT -o eth0 -p tcp -m tcp --sport 32768:61000 -m multiport --dports 80,443 -m conntrack --ctstate NEW,ESTABLISHED -m owner --uid-owner 1000 -j ACCEPT
>  -A OUTPUT -o eth0 -p tcp -m tcp --sport 32768:61000 -m multiport --dports 80,443 -m conntrack --ctstate NEW,ESTABLISHED -m owner --socket-exists -j LOG --log-tcp-options --log-ip-options --log-uid --log-level 7
>  -A OUTPUT -o eth0 -p tcp -m tcp --sport 32768:61000 -m multiport --dports 80,443 -m conntrack --ctstate NEW,ESTABLISHED -m owner --socket-exists -j DROP

But are these really all the rules? It has happened too often that users 
only ever appended rules, such that the trailing ones were never 
executed, since some old rules occurring before them already rendered a 
final verdict.
Never post iptables -L -- always post iptables-save, unabridged.

N.B.: Unrelated to the observed packet, as for rule content goes, 
32768:61000 looks highly suspicious of "I know better than the RFC"[sic] 
and is a recipe for some program to stumble and fall on.

>The 3 rules are nearly equivalent, the difference being the owner module option, --uid-owner vs. --socket-exists (and, of course, the target).
>The initial SYN packet to google.com is not matched in the first rule, and thus passed to the second rule where the packet is matched and logged.
>The packet is then passed to the third rule and dropped.
>
>Oddly, though, if I add "173.194.73.103 www.google.com" to the hosts file, the intial SYN packet is matched in the first rule and thus accepted.

So perhaps you have a specific (not shown) -d 173.194.73.103 match 
somewhere and ran afoul of google.com having multiple addresses.

>When google's IP is obtained from a DNS query, the initial SYN packet to google.com is not matched in the first rule, but is matched in the second and third rule.
>So far, I've only observed this with google.com (and bing.com).
>
>In any case, thanks for the response.
>
>Bill
>
>--
>To unsubscribe from this list: send the line "unsubscribe netfilter" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

