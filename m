From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: SSH Connections Lost After 1 minute idle
Date: Wed, 14 Jul 2004 00:11:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407140011.29429.Antony@Soft-Solutions.co.uk>
References: <20040713224848.99030.qmail@web40708.mail.yahoo.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040713224848.99030.qmail@web40708.mail.yahoo.com>
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

On Tuesday 13 July 2004 11:48 pm, Real Cucumber wrote:

> > > I've done this using IPtables and the mangle table.
> >
> > Please explain how you have used the mangle table to
> > achieve this.

> --------
> iptables -t nat -A PREROUTING -p tcp --dport
> $WAN_SSH_PORT -i $WAN_INTERFACE -j DNAT --to
> $INTERNAL_SERVER_IP:$INTERNAL_SERVER_SSH_PORT
> ----------

Oh good - you mean the nat table, not the mangle table.

That makes good sense, then.

Regards,

Antony.

-- 
"I don't mind that he got rich, but I do mind that he peddles himself as the 
ultimate hacker and God's own gift to technology when his track record 
suggests that he wouldn't know a decent design idea or a well-written hunk of 
code if it bit him in the face. He's made his billions selling elaborately 
sugar-coated crap that runs like a pig on [sedatives], crashes at the drop of 
an electron, and has set the computing world back by at least a decade."

 - Eric S Raymond, about Bill Gates

                                                     Please reply to the list;
                                                           please don't CC me.


