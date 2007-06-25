From: Jan Kogut <jkogut@genesilico.pl>
Subject: Re: Limitations on connections
Date: Mon, 25 Jun 2007 13:47:34 +0200
Message-ID: <467FAB56.5010906@genesilico.pl>
References: <dac71d7b0706100212u52e0f7bep9ad3644f19332875@mail.gmail.com>
	<467E6B16.4090601@rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <467E6B16.4090601@rtij.nl>
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
To: Martijn Lievaart <m@rtij.nl>
Cc: netfilter@lists.netfilter.org

Martijn Lievaart wrote:
> Christos Panagiotakis wrote:
>> Hi people!
>>
>> Please don't flame/blame me I don't know much about iptables (yet, I
>> hope so.. :-)
>>
>> I was wondering if I can limit the established connections on a
>> specific port
>> using iptables rules.
>>
>> For example, lets say that we have an irc daemon (ircd) running on
>> 6667,6668 etc
>> and/or (another example to be more specific) a shout cast streaming
>> server
>> listening to 8000 or other port.
>>
>> Can I limit on a) ircd the users connecting or b) e.g. the listeners
>> on shout cast to a
>> specific number?
>> Lets say that I don't want more than 20 listeners simultaneously.
>> If I am not wrong, that means I don't want more than 20 established
>> connections on port 8000.
>>
>> Is this possible using iptables rules and if yes, it is going to work
>> properly ?
>>
>
> Yes this is possible using connlimit. It SHOULD work properly, but as
> I haven't used it for a while I cannot comment on how it works. It may
> also be dependent on your kernel version if you need to patch your
> kernel or wether it is already included.
>
> M4
>
Hello,

if You are using Debian (Etch), here is a nice tutorial how to compile
iptables with p-o-m and kernel.

http://www.howtoforge.com/forums/archive/index.php/t-21.html

Cheers,
JK


-- 
Regards,

Jan Kogut
Computer Systems Administrator
Laboratory of Bioinformatics and Protein Engineering
International Institute of Molecular and Cell Biology

ul. Ks. Trojdena 4
02-109 Warsaw, Poland 
http://genesilico.pl


:.


