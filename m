From: ASHISH <ashishis@gmail.com>
Subject: Re: Vijay - port 25 to be blocked
Date: Wed, 29 Dec 2004 00:49:58 +0530
Message-ID: <558224e3041228111947e5b9de@mail.gmail.com>
References: <544398739307937211@unknownmsgid>
Reply-To: ASHISH <ashishis@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <544398739307937211@unknownmsgid>
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
To: Vijay Kumar <vijay@calsoftinc.com>, netfilter@lists.netfilter.org

Infact the rule that you have written makes no sense as any packet in
input chain with dport as 25 is meant for your machine's SMTP server.
So if your rule is translated in plain english, it would loook like

"Deny access to all IP addresses other than <ip addr of mail server>
to the mail server running on my machine".

If you are writing this rule to your gateway, just write in it's
FORWARD chain. If you are writing this rule for you company's SMTP
server (if all mail in calsoft is  forwarded to  smtp.calsoftinc.com
and this server in turn forwards it to respective mail servers on net)
then put it in that machine's output chain.


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


-- 
cheers
Ashish
KReSIT
IIT Bombay

