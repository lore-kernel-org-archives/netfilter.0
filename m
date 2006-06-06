From: Alexandru Dragoi <alex@zoomnet.ro>
Subject: Re: Is ip_conntrack_ftp needed for 1:1 nat?
Date: Tue, 06 Jun 2006 19:16:05 +0300
Message-ID: <4485AA45.2030801@zoomnet.ro>
References: <A78C6C481BFAE949BC5990E1EEB2FE1257BF@q.LeBlancNet.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <A78C6C481BFAE949BC5990E1EEB2FE1257BF@q.LeBlancNet.us>
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
Content-Type: text/plain; charset="us-ascii"
To: Robert LeBlanc <robert@leblancnet.us>
Cc: netfilter@lists.netfilter.org

Robert LeBlanc wrote:

>I have a gateway that is using iptables and I have several 1:1 NATs
>configured. I am having trouble establishing an ftp session to my remote
>server. The gateway has a virtual adapter with the public IP address and
>I have SNAT and DNAT configured to forward all ports to the host. What
>do I need to get this working? I keep getting refused ports errors.
>
>Thanks,
>Robert LeBlanc
>
>  
>
# modprobe ip_nat_ftp

You may also use iproute2 for nat, but it may not work.

