From: Askar <askarali@gmail.com>
Subject: Re: Vijay - port 25 to be blocked
Date: Tue, 28 Dec 2004 22:42:33 +0500
Message-ID: <a0f69e5041228094227df9b62@mail.gmail.com>
References: <1581342731182665558@unknownmsgid>
Reply-To: Askar <askarali@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1581342731182665558@unknownmsgid>
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
To: Vijay Kumar <vijay@calsoftinc.com>
Cc: netfilter@lists.netfilter.org

try this ,
#iptables -A FORWARD -i eth0 -o ppp0 --dport 25 -d  !<ip addr of mail
server>  -j
DROP

don't forget to replace -i eth0 with your LAN inteface and -o ppp0
with your external interface




On Tue, 28 Dec 2004 21:52:46 +0530, Vijay Kumar <vijay@calsoftinc.com> wrote:
> Hi,
> 
> I want to allow my internal network to only connect to some specific email
> servers.
> Apart from these mail server  I want to block port 25 and 110 from my
> internal network to anywhwere. I am doing the following :
> 
> iptables -I INPUT -I eth0 --dport 25 -d  !<ip addr of mail server>  -j
> REJECT
> 
> This does not seem to block the port 25 traffic. Where am I going wrong?
> 
> Kindly help.
> 
> Regards,
> Vijay Kumar
> 
>  
> 
> 


-- 
(after bouncing head on desk for days trying to get mine working, I'll make
your life a little easier)

