From: Cody Harris <hchs@ns.sympatico.ca>
Subject: Adding a flag to a packet
Date: Tue, 30 Mar 2004 16:01:58 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040330160158.2e247c46@darna.vectec.net>
References: <20040328155231.32b07799@darna.vectec.net>
	<200403300848.16537.Antony@Soft-Solutions.co.uk>
	<20040330073347.65b31438@darna.vectec.net>
	<200403301253.18383.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403301253.18383.Antony@Soft-Solutions.co.uk>
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

On Tue, 30 Mar 2004 12:53:18 +0100,
Someone named Antony Stone <Antony@Soft-Solutions.co.uk> wrote:
> > If we've covered the NAT table, what's the mangle table?
> 
> Tha mangle table is aptly named, and allows you to fiddle about with bits of 
> the packets headers which most people wouldn't even think of changing - 
> things like the TTL (Time To Live) field, the TOS (Type Of Service) field, 
> and for MARKing packets (which doesn't actually change the packet, but allows 
> netfilter to carry a special marker around with the packet during further 
> processing).

Is it possible, with the mangling table, to edit the packet to have a special flag? So that when it hits another firewall that's setup correctly, it sends it to a pre-configured ip? Example:

On my internet network, the ip range is 192.168.0.0 to 255. If a computer sent a packet to 192.168.1.5, the computer used the gateway, slapped a flag on it, sent it to 1.2.3.4, the firewall there saw the flag, changed the ip on it to 192.168.1.5 coming from 192.168.0.6. When the computer sent a response, it just revered the process.

(I'm implying that the flag does NOT carry the dest-ip information, but simply has a numerical number, or something unquie to tell the firewalls to do this.)

> 
> Regards,
> 
> Antony.
> 
> -- 
> The truth is rarely pure, and never simple.
> 
>  - Oscar Wilde
> 
>                                                      Please reply to the list;
>                                                            please don't CC me.
> 
> 


-- 
+------------------+-----------------------------+
| Cody Harris      | --------------------------- |
| ---------------- | --------------------------- |
+------------------+-------+---------------------+---+
| *Sigh*. No key.                                    |
+----------------------------------------------------+

