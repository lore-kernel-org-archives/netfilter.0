From: Dimitar Katerinski <train@bofh.bg>
Subject: Re: ip_conntrack_tcp Errors
Date: Mon, 28 Jun 2004 15:30:34 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40E00F6A.2010604@bofh.bg>
References: <1088423237.13933.127.camel@spudgun.dhcp.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1088423237.13933.127.camel@spudgun.dhcp.internal>
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

Evgeni Vachkov wrote:
> Hi all,
> 
Hello Evgeni,

> When I load test one of our firewalls, when the concurrent connections
> reach arround 230, I am getting a lot of error messages as shown below.
> Mostly indicating that the server has sent an invalid SYN.  This is a
> heavy load firewall. I thought that increasing    
> ip_conntrack_max and ip_conntrack_buckets would help, but this wasnt the
> case. 
As stated with the previous posts, 230 concurent connections is very low number
indeed. Hence, manually tuning the ip_conntrack_max wont help either ;-).

> 
> The ip_conntrack version is 2.1.  kernel is v 2.4.26
> 
> Is that a problem with conntrack and its tunning or I am missing some
> patch? ...Or perhaps it is some other problem with other parts of the
> kernel? 
It seems to me that you have applied the tcp window tracking patch from pom-ng.
The problem is that the client and the server have done the first step of the
three way handshake, and are in sync, but the firewall for some reason is not.
So it drops the SYN/ACK, and thus forcing the client to retransmit its SYN and
initiate a new session (as descibed in the source code of the patch)

My advice is if you have applied this patch, to remove it, and test the load on the
firewall again.
> 
> Your quick help is greatly appreciated. 
Doing the best I can do ;-)
> 
> Regards,
> Evgeni Vachkov
> 

Regards,
Dimitar



-- 
"The only thing necessary for the triumph of evil is for good men to do nothing."
                                                   --Edmund Burke.

