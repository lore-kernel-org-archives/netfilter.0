From: Ronald <ronald645@gmail.com>
Subject: Re: Unable to block ICMP
Date: Mon, 16 Apr 2007 07:30:14 +0200
Message-ID: <462309E6.60407@gmail.com>
References: <Pine.LNX.4.44.0704151606090.16569-100000@citation2.av8.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:user-agent:mime-version:to:cc:subject:references:in-reply-to:content-type:content-transfer-encoding;
	b=eSxiHYSuwhZ2c2Wcm6mtl+ZEIqYdAYq25eLGv5enXeJEH6tlw4ihSVxPV7yVBY8L4+7QYVdq3/JzJY1hjXSYHGcprSA70AR+HD+DDh81OBJy+Ufmta468lsAK24v0t8C+dwKQBW9kzjJCYvNPx+CVwKMhQP0ZrhxhV7CDtkHu7c=
In-Reply-To: <Pine.LNX.4.44.0704151606090.16569-100000@citation2.av8.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dean Anderson <dean@av8.com>
Cc: netfilter@lists.netfilter.org

Dean Anderson schreef:
> On Sun, 15 Apr 2007, Ronald wrote:
>
>   
>> Well, what I actually wanted (which I probably explained wrong) is that 
>> my ports that are not in use (closed) are being invisible (no ICMP 
>> echo). That better?
>>     
>
> ICMP echo is not a per-port operation.  I don't know what the site you
> quote means by 'closed'.  Also, blocking all ICMP is never a really good
> idea: (recently updated)
>
> http://www.av8.net/ICMPTypes.txt
>
> I agree with the other posters': that you should block TCP and UDP
> connections to all ports by default, and open only those that you trust
> are exposable to the world, or better, just to whomever you have to
> expose them to.
>
> I suggest searching for instructions on how to do linux firewalls, and
> following them, rather than trying to roll your own rules by trial and
> error.
>
> 		--Dean
>
>   
That is correctly my setup now, but some applications like skype require 
to have everything opened above 1024.
Furthermore, this setup would be really easy. I only block what I don't 
want and allow everything else, closed ports are being shown as stealth.
Once an application is started it will open a port and I don't have to 
reconfigure my firewall. I have this in Windows, like this (with Comodo):

- Block incoming traffic, with destination port 135,445,etc etc
- Block outgoing icmp traffic
- Allow all (the rest)

This is the most easy way, all applications just work without 
reconfiguring the firewall. And closed ports are stealth. But since you 
guys say so, I'll keep it this way (Drop all accept some)

                                                                         
                                                            Thanks

