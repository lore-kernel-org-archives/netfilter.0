From: "Alex" <alex@hackgod.org>
Subject: Re: Forking inside netfilter queue
Date: Thu, 3 May 2007 16:25:30 +0100
Message-ID: <002901c78d97$4f60f1c0$0a00080a@rhea>
References: <4635EC8E.4090905@saudi.net.sa>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: Rayed <rayed@saudi.net.sa>, netfilter@lists.netfilter.org

Unless there are a real lot of these addresses that are permitted, and they 
change rapidly, then I'd expect it would be a better design to get all the 
valid URIs from the MySQL query on init and store them in a linked list.

Also, people already do this type of thing with an HTTP proxy like squid 
before the HTTPd.

----- Original Message ----- 
From: "Rayed" <rayed@saudi.net.sa>
To: <netfilter@lists.netfilter.org>
Sent: Monday, April 30, 2007 2:18 PM
Subject: Forking inside netfilter queue


> Hi,
>
> I am building netfilter queue application, that implement simple HTTP 
> filter.
>
> It basically will capture the packet, extract the URL, and issue MySQL 
> lookup to see if the address is permitted or blocked.
>
> My only fear that address lookup will block the traffic until I get the 
> lookup reply, so I am thinking of using preforking model to fork 10-20 
> processes to handle the same queue.
>
> Has any one done multi prcoess handling of the queue, is it even doable?
>
> Rayed
>
> 


