From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Rejecting udp
Date: Mon, 3 Mar 2003 21:14:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030303211430.40a50766.arnt@c2i.net>
References: <000801c2e1aa$3fc8f660$0200a8c0@klintan.local>
	<20030303173805.GB24602@miggy.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030303173805.GB24602@miggy.org>
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

On Mon, 3 Mar 2003 17:38:06 +0000, 
Athan <netfilter@miggy.org> wrote in message 
<20030303173805.GB24602@miggy.org>:

> On Mon, Mar 03, 2003 at 06:28:01PM +0100, Michael K wrote:
> > I saw this rule someware on the net.
> > $IPTABLES -A FORWARD -o $EXTERNALIF -p udp --dport 137 -j REJECT
> > 
> > Whats the use to use reject on a UDP packet? Isn't udp
> > connection-less A more correct shouldn't that be "-j DROP"? Or am I
> > thinking wrong here?
> 
> REJECT is "return some ICMP code saying 'no go'" usually something
> like 'port unreachable'.
> DROP is "just forget about this packet, send nothing back to the
> source".

...the latter is appropriate for your external interface to evade 
scriptkiddies looking for easy enough prey, while you may prefer 
the former for your internal lan wintendo users, to help them avoid 
stalling their wintendos on trying to share files.
 
> Thus the difference has nothing to do with connectionful vs.
> connectionless.
> 
> -Ath


-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



