From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: sendmail redirect
Date: Tue, 29 Oct 2002 13:59:12 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210291359.g9TDxJe10163@vulcan.rissington.net>
References: <3DBE7539.9020002@bol.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DBE7539.9020002@bol.com.br>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tuesday 29 October 2002 11:47 am, Julio Cesar Ody wrote:

> Hello. I need to redirect all mail trafic that enters a gateway to an
> email server inside the same LAN. Here's the scenario:
>
>                  |----------------|          |----------------------|
> internet <--->  | gate(10.0.0.1) |  ------  | mailserver(10.0.0.2) |
>                  |----------------|          |----------------------|
>
> "gate" is the only machine with a real ip, so, from outside this LAN,
> people will refer to it in order to fetch their email. So my question
> is: What rules do I need to use in order to make "gate" pass the mail
> tasks to "mailserver" (receive smtp/pop requests) ?

Your request is slightly confusing, since in the first sentence you refer to 
"an email server inside the *same* LAN", suggesting that the requests are 
coming from the LAN as well, and then in the rest of the question you talk 
about people outside the LAN getting access to it for both SMTP and POP3.

You should be aware that the answers to these two are very different - 
providing external access from the Internet is much simpler than redirecting 
internal requests to a server on the same subnet as the client, so I'm going 
to assume in this answer that you only need external access via the public 
IP.   Internal access via the private IP 10.0.0.2 will still work fine.

So, here's what you do:

iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -A PREROUTING -d a.b.c.d -p tcp --dport 25 -j DNAT --to 10.0.0.2
iptables -A PREROUTING -d a.b.c.d -p tcp --dport 110 -j DNAT --to 10.0.0.2
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -d 10.0.0.2 -p tcp --dport 25 -j ACCEPT
iptables -A FORWARD -d 10.0.0.2 -p tcp --dport 110 -j ACCEPT

Where a.b.c.d is the external address of your gateway machine.

If you don't understand why these rules will do what you want, just ask.

Antony.

-- 

If at first you don't succeed, destroy all the evidence that you tried.

