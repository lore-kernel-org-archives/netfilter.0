From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Iptables rules...
Date: Sat, 7 Sep 2002 11:36:31 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020907103633.VDJI25423.mta01-svc.ntlworld.com@there>
References: <39778BFB9C25BA429794B15B50AEC78104B194@server-dcms>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <39778BFB9C25BA429794B15B50AEC78104B194@server-dcms>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Saturday 07 September 2002 10:39 am, Didier Hung Wan Luk wrote:

> Hi All,
>
>
> I am new to firewall/iptables can someone help me to clear up some concepts
> about firewalling?
>
> If my default rule for the input chain of my external interface is DROP
> need I again specify to DROP packets in the INPUT chain of my external
> interface?

There is only one INPUT chain.   The rules and the default policy apply to 
all interfaces.

> #My Default rule
> iptables -P INPUT DROP
>
> #Drop all attempts on my ext. interface trough port 6000:6063
>
> iptables -A INPUT -i ppp0 -p tcp --dport 6000:6063 -j DROP
>
> If I am right I think that I need not include a rule again saying to drop
> packets to my 6000;6063 ports since I do not have a rule saying to accept
> connections on these ports...

If you have a default DROP policy, then you should not (normally) need to 
specify any DROP rules.   If you do not have a rule ACCEPTing certain 
packets, then they will be DROPped by default.   That is what the policy is 
for.

For example:

iptables -P INPUT DROP
iptables -A INPUT -p tcp --dport 80 -j ACCEPT

will drop SMTP traffic on port 25, because there is no rule ACCEPTing it.

These rules will also drop POP3, IMAP, FTP, IDENT.......   everything except 
HTTP.

Antony.

-- 

90% of network problems are routing problems.
9 of the remaining 10% are routing problems in the other direction.
The remaining 1% might be something else, but check the routing anyway.

