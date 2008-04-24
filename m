From: Bjoern Weiland <bjoern.weiland@rz.uni-karlsruhe.de>
Subject: Re: Cloning Traffic had having it processed by two different hosts
 - TEE
Date: Thu, 24 Apr 2008 15:21:16 +0200
Message-ID: <4810894C.1060102@rz.uni-karlsruhe.de>
References: <480F2A96.3020603@rz.uni-karlsruhe.de> <alpine.LNX.1.10.0804231643000.13697@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0804231643000.13697@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

>> here's what I need to do: Our central routers all export cisco
>> netflow data. This data is being sent to HOST A where it is
>> processed. Now for some researching, I also need this data on HOST
>> B for another kind of processing. So what I want to do is to clone
>> the traffic arriving at HOST A. One copy should be processed by
>> HOST A as usual and the copy needs to be sent to HOST B. As we do
>> not only want to passively monitor this traffic, but really work
>> with it, the copied traffic also needs to be rewritten with HOST
>> B's IP address in the netflow data's Headers.
> 
> Use the RAW(S|D)NAT target for rewriting the address. It is available
> in the RAWNAT branch of the git repo.

I finally got the TEE addon compiled under a 2.6.23.16 kernel, but
RAWNAT does not compile:

http://pastebin.com/m5d4d2040

I also had problems with other addons but I commented them out as I dont
need them anyway. In that pastebin, although it says it was
xtables-addons-1.5.4, it really is the latest addons snapshot from
http://dev.computergmbh.de/gitweb.cgi?p=xtables-addons;h=RAWNAT;a=shortlog

> The teed packet however does not cross iptables on the machine it is
> teed due to ... limitations in ip_tables, not because there could 
> possible be some infinite recursion, so you would need to RAWNAT on a 
> different machine.

Now as there is no documentation, I have to ask: How do I set it up?
I need to clone incoming packets, leaving one copy for a local process 
and forwarding the other copy to another host. I also need to rewrite IP 
Dst addresses of the copy to the other host.

This will clone all tcp packets destined to port 80, right?
iptables -t mangle -A PREROUTING -p tcp --dport 80 -j TEE --gateway 1.2.3.4

Now why does TEE need a gateway (can't it use the default gateway?) and 
how do I tell my machine to forward these just copied packets to host 
6.7.8.9? And how do I use RAWNAT to tamper with the Dst-IP address of 
the copied packets?

  -best regards, bjoern

PS: When I get this to run I will blog a tutorial on that copied 
routing. I think that is a good idea as there is absolutely no documentation
