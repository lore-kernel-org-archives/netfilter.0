From: Jason Opperisano <opie@817west.com>
Subject: Re: iptables for port forwarding
Date: Tue, 30 Nov 2004 15:54:14 -0500
Message-ID: <20041130205414.GA28337@bender.817west.com>
References: <20041130005154.6978.qmail@web11204.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20041130005154.6978.qmail@web11204.mail.yahoo.com>
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

On Mon, Nov 29, 2004 at 04:51:54PM -0800, Nick wrote:
> Hi,
> 
> I want to do something relatively simple, but have not been able to
> figure out from the manual or playing with it how to achieve what I
> want.
> 
> I have a server which I can only connect to via port 80, due to a
> firewall.  I want to connect to VNC on the server, and connect to it
> via a VNC client my laptop.  VNC server only wants to run on port 5900.
>  I'm not running an HTTP server on 80, so no prob there.  I want to
> forward packets  coming into the server on port 80 to the VNC on 5900.
> 
> I tried doing this:
> /sbin/iptables -A FORWARD -p tcp --dport 80 -j ACCEPT 

you're changing the dport to 5900 in NAT PREROUTING--your filter rule
should reflect that fact.

> /sbin/iptables -t nat -A PREROUTING -p tcp --dport 80 -i eth0 -j DNAT
> --to 127.0.0.1:5900 

you can't DNAT to 127.0.0.1--search the list archives for the nearly
8000 messages on this topic.

> But the VNC client hangs for a while before timing out when I try to
> connect to it.
> 
> Ideas on how to achieve the desired result?

  # redirect tcp 80 -> 5900
  iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 \
    -j REDIRECT --to-port 5900

  # allow stateful replies
  iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
  # allow connections to tcp 5900
  iptables -A INPUT -i eth0 -p tcp --syn --dport 5900 -j ACCEPT

you then need to tell your VNC client to connect to:

  $SERVERIP:-5820

the port number is calculated by:  5900 + DISPLAY_NUMBER

to get it to connect to port 80:  5900 + (-)5820 = 80

-j

--
"Okay, retrace your steps. Woke up, fought with Marge, ate Guatemalan
 insanity peppers, then I... Oh..."
        --The Simpsons

