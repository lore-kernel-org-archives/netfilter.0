From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: Implications of a permissive FORWARD chain
Date: Wed, 19 Feb 2014 10:03:38 +1300
Message-ID: <f076ff4850264eaf59f4fe96b8ba5169@treenet.co.nz>
References: <loom.20140218T183628-993@post.gmane.org>
 <5303B490.6070606@solutti.com.br> <loom.20140218T205158-486@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <loom.20140218T205158-486@post.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mark Fox <mark.fox@gmail.com>
Cc: netfilter@vger.kernel.org, netfilter-owner@vger.kernel.org

On 2014-02-19 09:02, Mark Fox wrote:
> Leonardo Rodrigues writes:
>>      There's no right or wrong on how your FORWARD default rule should
>> be. Being DROP or ACCEPT depends on your network security policies.
>> 
>>      Being ACCEPT the default action for FORWARD, your linux router 
>> will
>> forward anything from one side to the other, unless it's explicity
>> DROPped on the rules. Being DROP the default action, everything will 
>> be
>> dropped, except explicitely ACCEPTed by your rules.
>> 
>>      Which one fullfit you demands ? So that's the right one for you !
>> No one can tell you, giving only the information you wrote, that DROP 
>> or
>> ACCEPT is right or wrong. There's really no right or wrong here, 
>> there's
>> what fullfilts your demands/needs and what doesnt.
> 
> Thanks for the reply, Leonardo. I'm not asking someone else to tell me 
> what
> is the right thing to do. What I'm wondering is what kind of damage 
> someone
> else on the network could use a machine with a permissive forwarding 
> policy
> to do. Spoofing obviously, but anything else?
> 
> With that better understanding, I'll be equipped to make that call.
> 
> In the larger context, the fact that several popular Linux 
> distributions
> come configured with a firewall that allows all forwarding, all 
> incoming
> connections and all outgoing connections is somewhat surprising.

That "all incoming connections" surprises me to. But then you are asking 
about FORWARD not INPUT.


Like you surmised earlier the implications for the client hosts is the 
same as if your forwarding host was not there at all.

IMHO, a permissive rule is warranted but you can do somewhat better than 
the black and white situation of accept all. Your host is in the 
position to set a few basic security policies for specific ports and 
services (eg FINGER, Windows RPC perhapse) and definitely block bogon 
traffic.

Amos
