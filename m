From: Hauke Lampe <packbart@frell.ambush.de>
Subject: Re: detect portscans in DNATed ports
Date: Thu, 10 Oct 2002 20:52:49 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021010185249.GB21761@frell.ambush.de>
References: <004001c27059$4ede7fc0$3201a8c0@leonardo>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <004001c27059$4ede7fc0$3201a8c0@leonardo>
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
To: netfilter@lists.netfilter.org

On Thu, Oct 10, 2002 at 09:33:59 -0300, Leonardo Rodrigues ( listas ) wrote:

> I've a firewall script that deals with portscan in its external
> interface.

The sanest way to deal with portscans is IMO a REJECT rule at the end of the
INPUT / FORWARD chain.
 
>     Altough it works absolutely fine when someone tries to portscan the
> firewall, it seems to show all DNATed ports on the scanner.

And now you're astonished because DNAT works just as expected?

> Question is: in which chain/rule should I use psd module to get portscan
> in DNATed ports ??

Another question would be: Why do you put your gateway's security willingly
at risk by increasing the packetfilter complexity with unnecessary code that
can and will introduce new bugs, opening up new attack paths on your
machine? Just to be c00l3r than the kids scanning your netblock? Or to scare
away your customer looking for services that you may offer?

> I was thinking in doing this on NAT OUTPUT ....

OUTPUT? Maybe PREROUTING is what you want. Reading the netfilter
documentation won't hurt, either.

> what do you think ?

My suggestion would be that you forget this portscanning detection foo. A
port with no service listening on it and no DNAT rule forwarding it
elsewhere is still a closed port and connection attempts will be answered
with ICMP dest unreachable or TCP RST. DoSing yourself by blocking people
scanning for publicly available services is pointless. IMHO. YMMV.

Hauke.

