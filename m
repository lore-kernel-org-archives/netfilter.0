From: Rayed Alrashed <rayed@saudi.net.sa>
Subject: Re: Improve queue handler performance
Date: Fri, 22 Jun 2007 13:46:02 +0300
Message-ID: <467BA86A.5030509@saudi.net.sa>
References: <4671BB67.7020209@saudi.net.sa>
	<1182263457.1834.12.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1182263457.1834.12.camel@localhost.localdomain>
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
To: Eric Leblond <eric@regit.org>
Cc: netfilter@lists.netfilter.org

Hi,
> Could you send your code I'd like to run it on my platform.
I will send the code directly to your email, it is basically this file:
libnetfilter_queue-0.0.13/utils/nfqnl_test.c

With printf commented out, and the while loop changed from:
while ((rv = recv(fd, buf, sizeof(buf), 0)) && rv >= 0)
To:
while ( ((rv = recv(fd, buf, sizeof(buf), 0)) && rv >= 0)  || 
(errno==105) )

Looking back to it I don't know why I added this check but it used to 
break the loop after few hundreds of packets.

> In fact, I've done some bench on NuFW and found a similar result. Here's
> the article (in french) with some graphs :
> http://nufw.org/Tests-de-performance-intensifs-sur.html
>   
Unfortunately I don't know french :(

Best regards,
Rayed

