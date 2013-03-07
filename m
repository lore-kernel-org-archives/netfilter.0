From: "Daniel L. Miller" <dmiller@amfes.com>
Subject: Re: Connection tracking counters increasing
Date: Thu, 07 Mar 2013 10:22:14 -0800
Message-ID: <assp.0778ac5759.5138DAD6.6040602@amfes.com>
References: <5138BC91.9060903@amfes.com> <alpine.LNX.2.01.1303071726260.2529@nerf07.vanv.qr> <5138C95B.1080405@amfes.com> <alpine.LNX.2.01.1303071816090.23717@nerf07.vanv.qr> <5138CCB6.3050705@amfes.com> <9C84D171-3207-4A02-81BC-9652F50A254B@alex.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=amfes.com;
	h=Message-ID:From:Subject:To:MIME-Version:Content-Type; s=sep2012.mail;
	bh=/2lAZ+zx56S0Bf9lv5K3gcq3GLI=; b=Q5VyAlCnwayX5YNYn281Xn46bt0LlOR+Cz02dAgYqbHXgPju928jAhrn0AqMVmlUh19rOPivrlkPXp55iXcTfLdW1oEmTVkI661Shd2TruhJqz2oS78AE2Xi/PwKYI3WCk8iwWiQ7Qvtt9xvUw+eAJqfwgO5VfKbqO/FMT14NgY=
In-Reply-To: <9C84D171-3207-4A02-81BC-9652F50A254B@alex.org.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter-Users <netfilter@vger.kernel.org>

On 3/7/2013 10:10 AM, Alex Bligh wrote:
> On 7 Mar 2013, at 17:21, Daniel L. Miller wrote:
>
>> Anything's possible - but I don't have a high-visibility site.  The connection counter increments gradually - a new connection every couple of seconds or so.
> Why would you not expect this to happen? It's an absolute count of the number of
> connections since reboot. Are you quite sure nothing is opening any inbound or
> outbound connections or trying to? Do you have connection tracking on loopback?
>
If it's an informative counter - then I don't care.  If it's active 
state counter - and blocks new connections from happening when it 
reaches the defined maximum - then it's very much a concern.

I'm assuming something has changed - whether it's due to an upgrade, new 
software, or new device on the network I don't know.  I don't know how 
to look at the list of connections to determine what's getting 
opened/accessed/left so I can narrow it down.

At the moment, I have a very small firehol config plus fail2ban. That's 
all I know actively using iptables.  I'm running OpenVPN - at times I 
will setup some iptables dnat/snat for connections to remotes.  So I do 
need to have NAT available otherwise I'd just unload the modules and 
forget about it.  My primary firewall is a Mikrotik router that doesn't 
have these issues - but I want at least a little protection on my main 
server (which this is).

I have a web server running on a VirtualBox virtual machine via a 
bridged interface.  I do not have connection tracking on the VM.  I 
would think the web server would be the primary target of inbound 
connections - for whatever that's worth.  I also run mail and DNS.

I've never had this problem before - but I've been dealing with it for 
about the past month.  I'm sure something's changed - whether it's my 
website's google visibility or a software change I don't know.

-- 
Daniel

