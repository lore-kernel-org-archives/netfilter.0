From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: problems in tcp connection tracking
Date: Mon, 7 Oct 2002 10:43:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210070943.g979hdL13956@vulcan.rissington.net>
References: <20021002194011.GB16386@firestorm.zhadum.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021002194011.GB16386@firestorm.zhadum.ch>
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

On Wednesday 02 October 2002 8:40 pm, pfy wrote:

> hi
> there sems to be a bug in tcp connection tracking: if a
> connection does NOT close with a RST, then the state of the
> connection rests ESTABLISHED.

I disagree.   Standard FIN-ACK packets close connections perfectly well.

> So if you put a rule up like this on a attacker machine:
> iptables -A OUTPUT --dst <victim> -p tcp --tcp-flags ALL, RST  -j DROP

Let's see, what does this rule do ?   On *my* machine (assuming I'm the 
attacker :-), it stops me sending RST (only) packets to the specific 
destination....

Now, why would my machine want to send a RST packet anyway ?

> and then connection flood the victim, the connection track table
> will overflow

Well, yes, this is pretty much the definition of a connection flood.   
Nothing to do with RST packets....
 

Have I misunderstood something significant here ?
 

Antony.

-- 

Anything that improbable is effectively impossible.

 - Murray Gell-Mann, Nobel Prizewinner in Physics

