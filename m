From: Jason Opperisano <opie@817west.com>
Subject: Re: smtp / pop rules
Date: Tue, 1 Feb 2005 10:47:19 -0500
Message-ID: <20050201154719.GA29121@bender.817west.com>
References: <246c3a2246c5ff.246c5ff246c3a2@vsnl.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <246c3a2246c5ff.246c5ff246c3a2@vsnl.net>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, Feb 01, 2005 at 08:02:58PM +0500, varun_saa@vsnl.net wrote:
> Hello,
>       My server is Mandrake 10.1
> eth0 is WAN with static IP connected to 512k DSL
> eth1 is LAN
> 
> I have already configured NAT, etc..
> 
> I want my firewall to allow users to send
> and recieve mails. 
> 
> I want add the following lines to my iptables :
> 
> -A INPUT -p tcp -m tcp --sport 110 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 110 -j ACCEPT
> -A INPUT -p tcp -m tcp --sport 25 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 25 -j ACCEPT

is your firewall also your mail server?  if not--you need to be adding
your rules to FORWARD, not INPUT.  and the source port of pop3/smtp
traffic should be unprivileged; i.e.,

  # allow packets part of an established connection
  iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

  # allow SMTP connections from LAN -> Internet
  iptables -A FORWARD -i eth1 -o eth0 -p tcp --syn --sport 1024: \
    --dport 25 -j ACCEPT

  # allow POP3 connections from LAN -> Internet
  iptables -A FORWARD -i eth1 -o eth0 -p tcp --syn --sport 1024: \
    --dport 110 -j ACCEPT

HTH...

-j

--
"I'll be deep in the cold, cold ground before I recognize Missoura!"
        --The Simpsons

