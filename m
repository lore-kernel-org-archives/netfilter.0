From: c0ldbyte <c0ldbyte@myrealbox.com>
Subject: Re: (no subject)
Date: Sat, 21 Feb 2004 22:23:00 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040221222300.03a31efa.c0ldbyte@myrealbox.com>
References: <1077367619.1966.3.camel@frozen>
	<1717113755.20040221194922@attla.net.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1717113755.20040221194922@attla.net.ar>
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

How about a faster way to do that, that is static to any interface that
pops up, "iptables -A INPUT -i ! lo --tcp-flags SYN,FIN SYN,FIN -j DROP"
that will protect every interface that is not lo(Loop Back).

On Sat, 21 Feb 2004 19:49:22 -0300
Alexis <alexis@attla.net.ar> wrote:

> A fast way to do this is with a script and something like this (could
> be a lot of other options and ways to do this)
> 
> MY_IP=`ifconfig eth0 | grep "inet addr" | cut -d':' -f2 | cut -d' '
> -f1`
> 
> and then
> iptables -A INPUT -p tcp -d $MY_IP --tcp-flags SYN,FIN SYN,FIN -j DROP
> 
> of course, you need to change eth0 to the interface that you need to
> obtain an ip address.
> 
> If this interface is related to an ppp interface it could be easy, in
> a file called ip-up in /etc/ppp you could set your script with the
> following vars
> 
> # When the ppp link comes up, this script is called with the following
> # parameters
> #       $1      the interface name used by pppd (e.g. ppp3)
> #       $2      the tty device name
> #       $3      the tty device speed
> #       $4      the local IP address for the interface
> #       $5      the remote IP address
> #       $6      the parameter specified by the 'ipparam' option to pppd
> 
> 
> pppd executes this script when it comes up
> 
> so you can use $1 where i put $MY_IP in the iptables command.
> 
> then, if you need to change some parameters when the ppp connection
> cames down, just set it in ip-down
> 
> and thats it
> 
> 
> 
> 
> Hello Anthony,
> 
> Saturday, February 21, 2004, 9:46:59 AM, you wrote:
> 
> AdAL> Hi, I would like to add a certain rule to my firewall, but I have a
> AdAL> dynamic IP, I'm wondering if there is some way I can work with this
> AdAL> the line is as follows:
> 
> AdAL> iptables -A INPUT -p tcp -d <MyDynamicIP> --tcp-flags SYN,FIN SYN,FIN -j
> AdAL> DROP
> 
> AdAL> Thanks for any information you can provide.
> 
> AdAL> --tony
> 
> 
> -- 
> Best regards,
>  Alexis                            mailto:alexis@attla.net.ar
> 
> 
> 


-- 
        This e-mail may be privileged and/or confidential, and the sender
does not waive any related rights and obligations. Any distribution, use
or copying of this e-mail or the information it contains by other than an
intended recipient is unauthorized. If you received this e-mail in error,
please advise me (by return e-mail or otherwise) immediately.



