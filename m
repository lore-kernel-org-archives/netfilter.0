From: "Jesse Gordon" <jesseg@nikola.com>
Subject: Re: Mail server behind a firewall
Date: Mon, 21 Nov 2005 13:31:27 -0800
Message-ID: <061e01c5eee2$ee3aaed0$5e00800a@printserver>
References: <7834b9550511211310n25ec94f5q@mail.gmail.com>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Fernando Martins <martinsfernand@gmail.com>, netfilter@lists.netfilter.org

Hi Nandao.

Comments below.

>----- Original Message ----- 
>From: "Fernando Martins" <martinsfernand@gmail.com>
>To: <netfilter@lists.netfilter.org>
>Sent: Monday, November 21, 2005 1:10 PM
>Subject: Mail server behind a firewall
>

>Hi,
>
> I have been looking for a solution for days and nights and I can't
>find any solution to my problem.
> I have installed a Mail server behind a firewall , firewall I have
>configured very badly with iptables.
> I want an exterior smtp server to be able to speak with mine but it is 
> failing.
>  My configuration is:
>
>
> INTERNET---------------------------------FIREWALL-------------------------------MAIL
>SERVEUR
> ----------------------------------------------eth0-----------eth1-------------------------PrivateIP
>
> eht0 is the public interface with public adress A.
>
>
> How can I do this?
>
> Nandao
>  nervous break down is close

I'm guessing that your eth1 has an IP like 192.168.0.3 or 10.0.0.3 or some 
such, and you want to forward ports.

The part of forwarding ports could look like this:

iptables -t nat -A PREROUTING -p TCP -i eth0 -d PublicAddress --dport 25 -J 
DNAT --to PrivateIP

This tells iptables that if a packet should come in eth0, with a target 
address of your public IP, to the destination port 25, it should be 
forwarded to (or re addressed to) PrivateIP.

For the above to work as it is, this firewall must also be the default 
gateway for the Mail Server, and must be working as a Masquerading NAT 
firewall.
(I assume it's already functioning as the internet sharing computer.)

Also, depending on your other firewall rules and policies, you may need to 
specifically allow the incoming ports, but I'd have to see your specific 
config to know exactly what you need, but it might look something like this 
as well:

iptables -A FORWARD -i eth0 -o eth1 -d MailServerIP -J ACCEPT

This tells iptables that any packet that comes in eth0, and goes out eth1, 
which has a destination IP of the mail server's private IP, to accept it.

Depending on your other policies, more accept rules may be needed. But 
hopefully this will get you started.

-Jesse







