From: Tom <tom@tomdp.com>
Subject: Re: locally access server behind firewall
Date: Wed, 01 Sep 2004 20:11:35 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <413610D7.70008@tomdp.com>
References: <41360CA0.6090109@tomdp.com> <1094061903.2037.112.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1094061903.2037.112.camel@localhost>
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

John A. Sullivan III wrote:

>If I understand you correctly, you are trying to connect to the web
>server on the internal network from devices on the internal network. 
>That means the packets never pass through the firewall.  In that case,
>no additional rules will help you.
>
>  
>
Well, I try to connect from a machine on the internal network, but I 
don't use the internal IP address of the server. I try to connect using 
the external address, which is the public ip address of the firewall. So 
I thought the packets would pass the firewall..?

>You could force the traffic to pass through the firewall by placing the
>web server on a physical DMZ (highly preferable if this web server
>allows public access as it appears to - if someone cracks it, they will
>be on your internal network) or on a logical DMZ.  To create a logical
>DMZ, simply bind a second address for a separate subnet to the internal
>interface of the firewall and change the web server internal address to
>an address on that new subnet.
>
>  
>
That's maybe a good idea... Will try that when I have some more time. 
But for the time being, I want to be able to connect to my webserver as 
if it were somewhere else on the internet...

>However, I would think the easiest thing to do is configure Apache to
>answer on port 8888.  Hope this helps - John
>  
>
Then I still need the prerouting-rule, but it will only alter the 
destination address and not the port anymore. Would that help you think?

Thanks!
Tom.


