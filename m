From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Rules not taking effect
Date: Fri, 18 Oct 2002 00:35:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021017233505.MZJE27697.mta05-svc.ntlworld.com@there>
References: <Pine.LNX.4.44.0210171625040.6045-100000@altaica.tigerknight.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0210171625040.6045-100000@altaica.tigerknight.org>
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

On Friday 18 October 2002 12:27 am, Tib wrote:

> I'm using 1.2.6a-5 for debian, using init.d scripts. The problem is that
> when I write a rule, it does not take effect.

Please explain this ?

> I have also found that a rule I had in place from earlier and I flushed it,
> still worked even though iptables -t nat -L showed nothing.

You mention -t nat specifically.

You should be aware that existing connections which have been NATted bypass 
the explicit rules in the nat table, in order to perform forward and reverse 
NAT transparently, automatically and efficiently.

If your FORWARD chain (I'm assuming this is a routing firewall) contains a 
rule to allow ESTABLISHED packets then further packets in a connection stream 
will continue to pass through the firewall even if you remove the rule/s 
which originally allowed the connection to get set up.

> I've been told that the module ip_conntrack may have something to do with
> this, but I cannot rmmod it because it's busy and insmod says it's already
> there.

What exactly are you trying to do ?   What rules are you trying to remove, or 
what traffic are you trying to block ?

Antony.

-- 

Most people are aware that the Universe is big.

 - Paul Davies, Professor of Theoretical Physics

