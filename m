From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: Kazaa Ports
Date: Mon, 08 Sep 2003 13:48:05 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F5CC0D5.9080708@Loudoun-Fairfax.com>
References: <20030908170151.21523.qmail@web40205.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030908170151.21523.qmail@web40205.mail.yahoo.com>
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



SBlaze wrote:

>--- Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com> wrote:
>  
>
>>Hi All,
>>
>>I am trying to provide a modest amount of security for a home LAN using 
>>NAT and filtering. My family insists on using Kazaa Lite on their 
>>Windows boxes (aaahhh!!).
>>
>>My (other) problem is that Kazaa insists on using sequential source 
>>ports and seemingly random destination ports to make connections. I 
>>already have a rule to allow ESTABLISHED,RELATED through, but these 
>>packets must be new connections (connecting to supernodes maybe?). No 
>>matter how many ports I open I can't seem to open enough ports to make 
>>it run.
>>
>>I'm rapidly becoming unpopular in my house. Any ideas how I can make 
>>Kazaa Lite work and still maintain some security? Are these mutually 
>>exclusive goals?
>>
>>Jeff
>>
>>
>>    
>>
>
>Are you using NAT? This is probably your best soloution.
>  
>
I use SNAT. Here is the rule:

iptables -t nat -A POSTROUTING -o $Net_Interface -j SNAT --to $Net_IP

My default policy on the filter FORWARD chain is drop, so any required ports have to have an ACCEPT rule for in order for services to work. In this case, Kazaa expects to have an unknown (large) number of ports open LAN->Net and it fails when it finds a blocked port.

I can make it work if I stop filtering outbound traffic, but I found a worm last month by checking unauthorized outbound traffic and I'm reluctant to give up that extra security.

Jeff



