From: Payal Rathod <payal-netfilter@scriptkitchen.com>
Subject: Re: firewall problem continued
Date: Mon, 9 Aug 2004 06:39:42 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040809103942.GA15462@tranquility.scriptkitchen.com>
References: <20040809081216.GA12643@tranquility.scriptkitchen.com> <200408090932.13099.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200408090932.13099.Antony@Soft-Solutions.co.uk>
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
Content-Transfer-Encoding: 7bit
To: Netfilter ML <netfilter@lists.netfilter.org>

On Mon, Aug 09, 2004 at 09:32:13AM +0100, Antony Stone wrote:

> I think you should specify the output interface in your MASQUERADE rules, so 
> that only packets going out of the Internet interface get SNATted - otherwise 
> packets going between your internal LAN and the DMZ are going to get SNATted 
> too, which is not really what you want.

Does this look OK?

-A POSTROUTING -s 192.168.0.0/255.255.0.0 -o eth2 -j MASQUERADE
-A POSTROUTING -s 10.0.0.0/255.0.0.0 -o eth2 -j MASQUERADE

> This may be because you say you have a Squid proxy running on the firewall 
> itself.   If you were just doing standard HTTP, the ruleset you have posted 
> looks like you should have access to TCP dport 80 on the DMZ from the LAN.

Yes I do have squid running on firewall machine itself.

> Why would you need to access 25/110 from the firewall?   Surely it isn't 
> acting as a mail client?

Right now I will keep it as they are if they are not harming much. I will
remove them a bit later.

> What Squid access controls do you have?

Nothing much, it is very simple.
acl designs src 192.168.0.0/255.255.0.0
http_access allow designs

> What URL are you using to access the mail server from the LAN?

Direct IP. http://<public Ip>/mail

> There is a default ACCEPT policy, there are also some ACCEPT rules (and no 
> DROP rules), and the -m state rule is included twice....

People here suggested to me that default ACCEPT policy was OK.
As I said earlier, I am unable to access DMZ's external IP from the
firewall machine. If I try 
telnet <external IP of DMZ> 80
I cannot reach it,
But I can reach the same with,
telnet 10.10.10.2 80

What do you think the problem is?
Thanks a lot for the help.

With warm regards,
-Payal

