From: Herman <Herman@AerospaceSoftware.com>
Subject: Re: simple port forwarding question
Date: Mon, 3 Nov 2003 11:57:52 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311031157.52264.Herman@AerospaceSoftware.com>
References: <3FA65F1D.20205@engr.uconn.edu>
Reply-To: Herman@AerospaceSoftware.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FA65F1D.20205@engr.uconn.edu>
Content-Disposition: inline
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
To: Rohit Kumar Mehta <rohitm@engr.uconn.edu>, netfilter@lists.netfilter.org

Hmm, make sure that the FORWARD chain is ACCEPT for that port.  Something 
like:
iptables -A FORWARD -i eth0 -o eth1 -p tcp --dport 88 -j ACCEPT
iptables -A FORWARD -i eth0 -o eth1 -p udp --dport 88 -j ACCEPT

For debug purposes, make a logndrop chain and use that on all DROP rules, so 
that tail -f  /var/log/messages will show what is going on.

iptables -n logndrop
iptables -A logndrop -j LOG --log-level info
iptables -A logndrop -j DROP

Then whenever you suspect that a DROP rule will dump the wrong stuff, use -j 
logndrop as the target, to make the packet show up in the /var/log/messages 
file, something like this:
iptables -A FORWARD -p tcp --dport 135 -j logndrop

Once the script is debugged and working, add a # to the second line of the 
logndrop chain to stop the logging.

Hope this helps.

Herman

On Monday 03 November 2003 1:58 pm, Rohit Kumar Mehta wrote:
> Hi guys, I was wondering if someone could help me out here.  I am fairly
> well confused after trying to muddle through
> this tutorial:
> http://iptables-tutorial.frozentux.net/iptables-tutorial.html
>
> I think what I want to do should be easy.  Perhaps someone could help.
>
> We are trying to trick the systems into believing that the Kerberos 5
> server is on IP#2 (let's call it 192.168.28.3)
> but it is in fact on IP#1 (192.168.28.2).
>
> Maybe my attempted iptables commands will make it blatantly obvious what
> I am trying to do:
>
> iptables -t nat -A PREROUTING --dst 192.168.28.3 -p tcp --dport 88 -j
> DNAT --to 192.168.28.2
> iptables -t nat -A PREROUTING --dst 192.168.28.3 -p udp --dport 88 -j
> DNAT --to 192.168.28.2
>
> iptables -t nat -A POSTROUTING -p udp --dst 192.168.28.2 --dport 88 -j
> SNAT --to-source 192.168.28.3
> iptables -t nat -A POSTROUTING -p tcp --dst 192.168.28.2 --dport 88 -j
> SNAT --to-source 192.168.28.3
>
> iptables -t nat -A OUTPUT --dst 192.168.28.3 -p tcp --dport 88 -j DNAT
> --to-destination 192.168.28.2
> iptables -t nat -A OUTPUT --dst 192.168.28.3 -p udp --dport 88 -j DNAT
> --to-destination 192.168.28.2
>
>
> Basically we want it so that if I do a "telnet 192.168.28.3 88", I get a
> connection to "192.168.28.2:88"
> This works - when I initiate the connection from 192.168.28.3, but from
> any other machine on the network
> it does not work.
>
> Am I doing something wrong or forgetting a key step?  Thanks!
>
> Rohit


