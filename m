From: Dimitar Katerinski <train@bofh.bg>
Subject: Re: Transparent proxy single machine question
Date: Sun, 27 Jun 2004 01:42:25 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40DDFBD1.2090700@bofh.bg>
References: <40DDE99C.7060001@triad.rr.com>  <40DDEFEC.5000205@bofh.bg> <1088287795.4717.12.camel@Kenslinux>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1088287795.4717.12.camel@Kenslinux>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org
Cc: ken scott <kscott9@triad.rr.com>

ken scott wrote:
> On Sat, 2004-06-26 at 17:51, Dimitar Katerinski wrote:
> 
> 
>>Hello ken,
>>
>>Yes, on single machine it will work with no problems. You should specify 
>>an incoming interface for the above iptables rule though. Do it like this:
>>
>>iptables -t nat -A PREROUTING -i $LAN_IFACE -p tcp --dport 80 -j 
>>REDIRECT --to-ports 8181
>>
>>where $LAN_IFACE is the interface connected to your internal network.
>>
> 
> I only have a single network card/interface on this box (eth0 , I guess)
> Does that matter in this proxy context? 
> 
> 
>>And the scheme is as follows:
>>1. A client sends request for specific page
>>2. The linux box sees its a request for destination port 80 and 
>>redirects it to port 8181 where DG is listening.
>>3. DG takes the request, do what it does (content filtering, etc.), and 
>>sends it to Squid.
>>4. Squid request the specific page, and gives it back to DG, which again 
>>do what it does.
>>5. DG then, if everything is ok, server the request page to the client.
>>
>>
>>About your question:
>> > ..when squid finally wants to send
>> > out the actual
>> > request to the internet, isn't that a port 80 request that the above
>> > iptables rule will
>> > redirect back to Dansguardian??
>>
>>No basicly it won't. Unless you dont have same rule in the OUTPUT chain 
>>of the nat table. the PREROUTING chain applies to packets which hit the 
>>box coming from somewhere outside, and not packets which origin from the 
>>machine itself.
> 
> Dimitar,
> Your explanation here is great but it throws me a bit since the packet
> requests coming from the browsers will all be internal requests (ie on
> the same machine) so is a PREROUTING rule the right choice?  In other
> words I want to apply a routing rule to internal requests (except those
> from squid).
> I appreciate your detailed response and I have looked for a "life of a
> packet" explanation such as you provided but have not found it as yet. 
> In your 5-step explanation, when are the iptables rules applied?
> Thanks
> Ken 
> 

Hello Ken,

Ah just know I understand that this is a workstation with some users, 
and squid and DG running ot this machine. Okay, I did some tests and 
came up with a solution ;-)
You can't redirect packets that origin from the machine itself, to some 
other local port (as far as i know). Maybe you can play with 
CONFIG_IP_NF_NAT_LOCAL option in the kernel, but as I understand it, it 
lets you to use destination NAT on connections originating from local 
processes on the nat box itself, but that is now we are looking for. So
here is what you can do:

1. Leave the proxy setting as is in the browser properties (127.0.0.1:8181)
2. Allow outgoing requests to port 80 only for the UID that squid is 
running under.
iptables -A OUTPUT -m owner ! --uid squid -p tcp --dport 80 -j DROP
This rule can be more flexible, but I live this to you, I hope you get 
the idea.
3. And finally test, whether you can make requests as user with and 
without proxy set in the browser.


I hope this helps you. Maybe someone will come up with different idea, 
but this seems to work for me (tm) ;-)


Regards,
Dimitar

-- 
"The only thing necessary for the triumph of evil is for good men to do 
nothing."
                                                   --Edmund Burke.

