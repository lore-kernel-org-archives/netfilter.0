From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Testing iptables setup
Date: Mon, 8 Mar 2004 15:18:17 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403081518.17402.Antony@Soft-Solutions.co.uk>
References: <404C8AA2.6060208@teleport.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <404C8AA2.6060208@teleport.com>
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

On Monday 08 March 2004 3:00 pm, Richard L. Dery wrote:

> I have the following setup in my /etc/ppp/ip-up.d directory:
>
> ## Create chain which blocks new connections, except if coming from inside.
> # iptables -N block
> # iptables -A block -m state --state ESTABLISHED,RELATED -j ACCEPT
> # iptables -A block -m state --state NEW -i ! ppp0 -j ACCEPT
> # iptables -A block -j DROP
>
> ## Jump to that chain from INPUT and FORWARD chains.
> # iptables -A INPUT -j block
> # iptables -A FORWARD -j block
>
> When I run iptables -L after connecting these rules are displayed.
>
> Is there a way to test to show that these rules work?

I can think of two meanings of the word "work" here:

1. Do they allow the traffic you want?
2. Do they block the traffic you don't want?

I suggest you test them by setting the packet counters to zero ("iptables 
-Z"), then sending some traffic through your firewall which is expected to 
work (eg: browse an Internet website from a LAN client), and make sure you 
see a small increase in the packet counters for the NEW rule in the 
user-defined chain (using "iptables -L -nvx"), and a larger increase in the 
counters for the ESTABLISHED rule (since this is where the reply packets, and 
further request packets, will go after the initial connection is made).

Then try something which should be blocked by the above rules (eg: try to 
connect to your public IP address from somewhere else on the Internet - it 
doesn't matter what protocol you try to use - HTTP, telnet, SSH, POP3 etc 
should all be blocked), and make sure (a) you can't connect, and (b) you see 
some packets build up in the counters for the DROP rule.

If in doubt, put a LOG rule just before the DROP rule, and you'll sson see 
packets from all over the Internet trying to connect to your address, and 
failing :)

Regards,

Antony.

-- 
The words "e pluribus unum" on the Great Seal of the United States are from a 
poem by Virgil entitled "Moretum", which is about cheese and garlic salad 
dressing.

                                                     Please reply to the list;
                                                           please don't CC me.


