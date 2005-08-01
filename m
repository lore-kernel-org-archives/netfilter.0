From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Setting up a local firewall
Date: Mon, 01 Aug 2005 07:54:55 -0500
Message-ID: <42EE1B9F.4080703@gmx.co.uk>
References: <42ED87C7.207@filefront.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42ED87C7.207@filefront.com>
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
To: netfilter <netfilter@lists.netfilter.org>

Bryan Christ wrote:
> I locked myself out of  my server until I rebooted it.  My goal was to

BTDT :)

> lock down everything and allow only SSH connectivity.  Can anyone show 
> me where my logic went wrong?  Here was the fatal script which I wrote:
> 
> /sbin/iptables -F INPUT
> /sbin/iptables -A INPUT -s 0/0 -j DROP
> /sbin/iptables -A INPUT -s 0/0 -m state  --state NEW,ESTABLISHED -p tcp 
> --dport 22 -j ACCEPT

Rules are evaluated in order. Everything matches your first rule. 
Nothing reaches the second one.

> My guess is that I missed accepting syn packets, but I'm not ready to 
> "try" again.

iptables -F INPUT
iptables -P INPUT DROP
# Let in replies to the connections you initiate
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT # allow loopback
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
# Everything else falls on the default policy.

Strictly speaking the loopback line is not needed; it just means that 
the system will be able to talk to itself. Similarly the --state line is 
extra; it just means that when you ssh in you can have useful network 
connectivity. I put that one in its own chain ...

iptables -F ; iptables -X
iptables -N State
iptables -A State -m state --state INVALID -j DROP
iptables -A State -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -I INPUT -j State
iptables -I FORWARD -j State

See, that's the first rule in both INPUT and FORWARD. Order is 
important! That's why we have -A|--append and -I|--insert.
-- 
     mail to this address is discarded unless "/dev/rob0"
     or "not-spam" is in Subject: header

