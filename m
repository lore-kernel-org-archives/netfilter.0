From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NAT and Transparent proxy
Date: Thu, 13 May 2004 10:32:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405131032.35030.Antony@Soft-Solutions.co.uk>
References: <20040513091442.90722.qmail@web8304.mail.in.yahoo.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040513091442.90722.qmail@web8304.mail.in.yahoo.com>
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

On Thursday 13 May 2004 10:14 am, Sameer Gurung wrote:

> Hi all,
>
> I have the current set up as follows;
>
> iptables -t nat -A PREROUTING  -i $LAN_IFACE -p tcp -j
> REDIRECT --to-port 3128

I think it would be good to specify that that should be for TCP port 80 
traffic only?   (Or maybe port 8080 etc as well, but not just *every* TCP 
port...)

eg: iptables -A PREROUTING -i $LAN_IF -p TCP --dport 80 -j REDIRECT --to 3128

> What i want now is all net access from this (firewall)
> box to go through the squid server (i.e. port 3128).
> So I add a rule above the OUTPUT rules that says
>
> iptables -t nat -A OUTPUT -o $INET_IFACE -p tcp -j REDIRECT --to-port 3128
> but it doesn't work..

So, let's think about this:

A browser (or some other web client) running on the firewall (ugh!) tries to 
send a packet to TCP port 80 on some remote web server, and the packet gets 
intercepted by the above rule and redirected to Squid on port 3128, which 
then generates its own request to the remote server, which gets intercepted 
by the above rule and redirected to Squid on port 3128....

I would recommend you tighten the destination port specification of the 
general rule up the top of this email, and configure any applications running 
on the firewall to specifically use the proxy server, rather than trying to 
do this transparently with nat.

I also recommend that you don't run applications on your firewall, but that's 
another matter....

Regards,

Antony.

-- 
"The problem with television is that the people must sit and keep their eyes 
glued on a screen; the average American family hasn't time for it."

 - New York Times, following a demonstration at the 1939 World's Fair.

                                                     Please reply to the list;
                                                           please don't CC me.


