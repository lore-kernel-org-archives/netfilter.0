From: ms419@freezone.co.uk
Subject: Re: Transparent Remote Proxy Server
Date: Mon, 27 Sep 2004 11:25:28 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <9B51275E-10B2-11D9-9099-0003931DA24A@freezone.co.uk>
References: <666183F7-0DA7-11D9-99BA-000A95C71776@freezone.co.uk>
	<41546F23.2010601@pbl.ca>
Mime-Version: 1.0 (Apple Message framework v618)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41546F23.2010601@pbl.ca>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

On Sep 24, 2004, at 12:01 PM, Aleksandar Milivojevic wrote:

> ms419@freezone.co.uk wrote:
>> I'm setting up a transparent proxy to a remote proxy server & can't 
>> figure out why it doesn't work.
>> My gateway is tor; it's running Debian unstable, iptables 1.2.11-2, & 
>> a custom 2.4.27 kernel. My proxy server is wum; it's also running 
>> Debian unstable, squid 2.5.6-8, iptables 1.2.11-2, & a custom 2.6.7 
>> kernel.
>> Physically, tor is connected by each of 3 NICs to an ADSL modem, to 
>> wum by a crossover cable, & to the rest of the network by a hub.
>> Logically, tor & wum are in 192.168.103.0/24; tor & the rest of the 
>> network are in 192.168.179.0/24.
>
> Haven't done something like that myself, but wouldn't it be much 
> simpler to implement it like this (using filter table for filtering, 
> and nat table for NATing, as they were intended to be used):

Thank you sincerely for your suggestion! You are correct: It is simpler 
to use DNAT & MASQUERADE. I tried it & it works. But now, I am trying 
to avoid using NAT.

The problem with NAT (as I understand it) is it rewrites the 
destination address, which breaks HTTP/1.0 requests without a Host: 
header. By using policy routing, I hope to route traffic through wum 
without rewriting the destination address.

I'm using as my guide the Transparent Proxy HOWTO by Daniel Kiracofe.

I'm still not sure what is wrong - thank you very much for any help!

Jack


