From: Eric Ellis <eellis@mail.co.gilchrist.fl.us>
Subject: Re: Vijay - port 25 to be blocked
Date: Tue, 28 Dec 2004 11:38:10 -0500
Message-ID: <41D18BF2.7000908@mail.co.gilchrist.fl.us>
References: <20041228170317.34EE82BBF8@tharbad>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041228170317.34EE82BBF8@tharbad>
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
To: Vijay Kumar <vijay@calsoftinc.com>
Cc: netfilter@lists.netfilter.org

Vijay Kumar wrote:
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
Lemme try this again,

I believe that this needs to be in the "forward" table, not the "input" 
table.

IIRC, Input is just for traffic destined to the firewall box itself, the 
mail servers that you're talking to are on the far side of the firewall, 
if I read you correctly.

