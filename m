From: "Martin Leduc" <marled3@hotmail.com>
Subject: Re: Problem behind my DMZ
Date: Thu, 08 Jan 2004 15:53:11 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Law9-F5F4g09DudNhpK000185fd@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: cbrenton@chrisbrenton.org
Cc: netfilter@lists.netfilter.org

Thanks for help Mr. Brenton,

But I dont understand something.  You tell me to use my public address for 
each server on my DMZ.  How can I use public IP on my server who are behind 
my firewall?  I want the server to stay behind the Firewall.

I have one IP range /28, and I dont think my ISP will give me another IP 
range.  My 20.0.0.1 is my gateway.  How can I attribute 20.0.0.4 to my mail 
server behind my Firewall and proceed with filtring?

Did I need proxy_arp?, do you have an example?

Do you want see my IPTABLE script?

Thanks in advance

Martin


>From: Chris Brenton <cbrenton@chrisbrenton.org>
>To: Martin Leduc <marled3@hotmail.com>
>CC: netfilter@lists.netfilter.org
>Subject: Re: Problem behind my DMZ
>Date: Wed, 07 Jan 2004 21:27:42 -0500
>
>Greetings!
>
>On Wed, 2004-01-07 at 19:19, Martin Leduc wrote:
> >
> > One of my server is DNS.  My trouble is if I tried to send Email FROM
> > one of this third server, my DNS return to sender server the public IP
> > and my Email as send to my firewall, not my internal Server.
>
>Common problem. You have two potential solutions:
>
>1) Use public IPs on your DMZ/service network. This will also give you a
>performance boost as you will drop the NAT overhead. You don't mention
>how many legal IPs you have, but if you have enough address space to
>carve off a /29 or /28 for your DMZ, this would be your best bet.
>
>2) Use split DNS. Setup another name server that is accessible only from
>internal systems and populate it with your private addresses.
>
>HTH,
>C
>
>

_________________________________________________________________
MSN Search, le moteur de recherche qui pense comme vous !  
http://fr.ca.search.msn.com/


