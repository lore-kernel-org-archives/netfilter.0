From: "J. Bakshi" <joydeep@infoservices.in>
Subject: Re: limit module not working with drop policy
Date: Sun, 24 Jan 2010 20:53:16 +0530
Message-ID: <20100124205316.098fbcbb@infoservices.in>
References: <4B591A79.2030600@infoservices.in>
	<4B5AC554.4040804@chello.at>
	<20100124121157.2ad8ecec@infoservices.in>
	<4B5C208F.9090108@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B5C208F.9090108@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Sun, 24 Jan 2010 11:27:27 +0100
Mart Frauenlob <mart.frauenlob@chello.at> wrote:


> > Thanks for your suggestion and hint. Now I have modified the rule
> > set as
> > 
> > ` ` `
> > iptables -A INPUT  -p icmp  --icmp-type echo-request -m hashlimit \
> > --hashlimit 3/minute --hashlimit-name secureping -j ACCEPT
> > ` ` `
> > 
> > but no luck yet :-( Is there anything wrong in my config ?
> 
> What exactly are the error symptoms? What is not working?
> Please provide more information like kernel, iptables version.
> You could place LOG rules and/or TRACE rules to provide more
> information on what's going on.
> 

The limit or hashlimit should protect my system by allowing only three ping request per minute ( as -m hashlimit --hashlimit 3/minute or same config by limit) . I saw it working before in debin lenny. I have upgrade my box into debian squeeze now and found the ping protection is not working at all. If I ping my box from outside; my box responds the ping per second !!!
So the ping protection is not working any more now :-( Just for reminder my firewall is default DROP and I have already posted iptables-save. Kindly ask me if you need any more information.

kernel version 2.6.31
iptables v1.4.6
