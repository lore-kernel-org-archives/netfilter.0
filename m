From: WP <mls100@comcast.net>
Subject: Re: IPTables problem perhaps related to ECN/CWR flags?
Date: Wed, 26 Jul 2006 11:12:43 -0700
Message-ID: <44C7B09B.8070206@comcast.net>
References: <44C755E3.7050908@comcast.net>
	<02BB8A4AC86C564C89C7F14CF98CE0C40127E5@knowledge.wizdom.nu>
Reply-To: mls1000@s92551514.onlinehome.us
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <02BB8A4AC86C564C89C7F14CF98CE0C40127E5@knowledge.wizdom.nu>
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
To: Sietse van Zanen <sietse@wizdom.nu>, netfilter@lists.netfilter.org

I realize this... as you can see from the tcpdump logs the packet makes 
it to W2 just fine. I changed the port forward accordingly with each 
attempt. I'm aware you can't forward to two internal addresses at the 
same time.

MLS


Sietse van Zanen wrote:
> You cannot use both servers on the same port externally, when accessing from the Internet. There is no way a client on the Internet can distinguish between the servers, as it only sees the IP address of your firewall.
>  
> Do either of the following.
>  
> Have your firewall forward two different ports to port 23 of your server:
> FW port 23 -> W2 port 23
> FW port 24 -> W3 port 23
>  
> Configure one of your servers to use a different port and set up port forwarding accordingly.
> FW port 23 -> W2 port 23
> FW port 24 -> W3 port 24
>  
> The first one will not break your internal network, the second is somewhat more symetric. Asymetric port forwarding might not work with certain software.
>  
> The only 'real' solution to use both machines on port 23 is obtain an extra external IP address.
>  
> -Sietse
>
> ________________________________
>
> From: netfilter-bounces@lists.netfilter.org on behalf of WP
> Sent: Wed 26-Jul-06 13:45
> To: netfilter@lists.netfilter.org
> Subject: IPTables problem perhaps related to ECN/CWR flags?
>
>   


