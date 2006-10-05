From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: STRING  module : Invalid argument
Date: Thu, 05 Oct 2006 12:34:10 +0200
Message-ID: <4524DFA2.9030504@netfilter.org>
References: <45236AD9.4090300@freemail.hu>	<53842.193.173.147.3.1159955117.squirrel@webmail.sterenborg.info>
	<45239360.6060304@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45239360.6060304@freemail.hu>
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
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?R8Ohc3DDoXIgTGFqb3M=?= <swifty@freemail.hu>
Cc: Rob Sterenborg <rob@sterenborg.info>, netfilter@lists.netfilter.org

Gáspár Lajos wrote:
> Rob Sterenborg írta:
>> On Wed, October 4, 2006 10:03, G�sp�r Lajos wrote:
>>  
>>> Hi,
>>>
>>> fw1:~# iptables -v -A INPUT -j DROP -p tcp -m string --string "test"
>>> DROP  tcp opt -- in * out *  0.0.0.0/0  -> 0.0.0.0/0  STRING match
>>> "test"
>>> iptables: Invalid argument
>>>
>>>     
> Does it means that it fails at insertation of the rule into the chain,
> doesn't?

Yes

>> - You probably don't have the string module installed and/or loaded.
>> - Kernel 2.6.18 is rather new (sep-2006) and iptables 1.2.11 is rather
>> old
>> (june 2004). Upgrade to a new iptables version: 1.3.6 is just released.
>>
>>   
> I have already tried it with the Debian backport of iptables (v1.3.x)
> ... Same results.

Debian backport of iptables? What do mean?

> Right now I am recompiling the kernel and iptables + pom-ng.
> Hope it helps... :)

The string match was introduced in kernel 2.6.16 if my mind serves well,
the old version that was available in pom-ng was broken. You also need a
recent iptables version to make it work as Rob pointed out.

-- 
The dawn of the fourth age of Linux firewalling is coming; a time of
great struggle and heroic deeds -- J.Kadlecsik got inspired by J.Morris

