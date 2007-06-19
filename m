From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: REJECT doesnt work
Date: Tue, 19 Jun 2007 11:47:34 +0200
Message-ID: <003001c7b256$dd268810$0b0ffe0a@NS006819>
References: <34b8543c0706182222i307aa705y6e705857428eb9ee@mail.gmail.com>
	<01c501c7b236$54be1530$0b0ffe0a@NS006819>
	<34b8543c0706190127h41d80c97yec8606b03f72a7f1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <34b8543c0706190127h41d80c97yec8606b03f72a7f1@mail.gmail.com>
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

Please reply to the list.

Mohammad Norouzi wrote:
> Thanks Rob
> so please tell me how to use it to filter INPUT or FORWARD?
> I mean is it possible to filter any packet that are not coming from
> the specific mac address? I want to prevent any IP cloning to access
> the internet
> -A INPUT -s 192.168.0.157 -m mac --mac-source ! 00:11:2F:29:96:84 \
>   -j REJECT

Well, this rule generates no error for me. Doesn't it for you?

I think you're working the other way around. If you have a DROP policy
and ACCEPT a match on IP and MAC I think you should be set.
Alternatively, you can add a *last* rule that REJECT's everything that
didn't match anything.

-P INPUT DROP
[...]
-A INPUT -s 192.168.0.157 -m mac --mac-source 00:11:2F:29:96:84 \
  -j ACCEPT

or

-A INPUT -s 192.168.0.157 -m mac --mac-source 00:11:2F:29:96:84 \
  -j ACCEPT
[...]
-A INPUT REJECT [--reject-with ...]


Grts,
Rob

> On 6/19/07, Rob Sterenborg <rob@sterenborg.info> wrote:
>>> Hi All
>>> I have following line to drop any request that is not from the
>>> original computer and it works fine
>>> -A PREROUTING -s 192.168.0.157 -p tcp -m mac --mac-source !
>>> 00:11:2F:29:96:84  -j DROP 
>>> 
>>> but now I want to change it to REJECT but it doesnt work and
>>> iptables will fail 
>>> 
>>> -A PREROUTING -s 192.168.0.157 -p tcp -m mac --mac-source !
>>> 00:11:2F:29:96:84  -j REJECT --reject-with=icmp-host-pro hibited
>>> 
>>> what is the problem?
>> 
>> # man iptables
>> 
>> REJECT
>> [...]
>> This target is only valid in the INPUT, FORWARD and OUTPUT chains,
>> and user-defined chains which are only called from those chains.
>> [...] 
>> 
>> The PREROUTING chain doesn't fit into this category thus REJECT
>> cannot be used. 
>> 
>> 
>> Grts,
>> Rob



-- 
Disclaimer: Any errors in spelling, tact, or fact are transmission
errors. 



