From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: iptables basic concepts
Date: Fri, 28 Nov 2003 17:39:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031128163917.F1E3F7888@sterenborg.info>
References: <000701c3b5ba$b42935d0$0200a8c0@ale>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000701c3b5ba$b42935d0$0200a8c0@ale>
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
To: 'Alejandro Cabrera Obed' <sisdis@tournet.com.ar>, "'Netfilter lista (iptables)'" <netfilter@lists.netfilter.org>

> 1) What option is the best: at first I set the default 
> policies in the chains and later I flush all the existing 
> firewall rules or viceversa ???
> 
> 2) Is it a good practice to start the iptables firewalling 
> rules from the rc.local script or is it better from the 
> /etc/init.d/iptables script ??? (I use RH 9 and I start 
> iptables from rc.local)

I'd :
- stop kernel forwarding,
- set the default policy (to DROP),
- flush the chains (even if you think they're empty ; it won't hurt),
- create the rules I need,
- if needed, start kernel forwarding,
- let the script start from /etc/init.d/iptables, or whatever the script is
called.

The reason for the last step is that you want the iptables script started as
quick as possible, so that there is (virtually) no time to hack the machine
before the rules are loaded. Best would be to start the script first and
then start the network so that the network isn't up before the rules are
loaded.
If you start it from /etc/rc.d/rc.local the script is started at the very
end of the startup sequence and then the network is already started for some
time.


Gr,
Rob


