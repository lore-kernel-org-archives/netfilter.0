From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Updating multple iptables on servers
Date: Tue, 8 Jun 2004 09:33:51 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406080933.51786.Antony@Soft-Solutions.co.uk>
References: <E1BXbgJ-00083y-0x@vishnu.netfilter.org>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E1BXbgJ-00083y-0x@vishnu.netfilter.org>
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

On Tuesday 08 June 2004 9:09 am, hyper@ubn.dk wrote:

> Is it possible to update iptables from a central server. I got 25 servers
> using the same firewall and i need something to update them all from a
> central server.
>
> Any ideas?

Rsync or scp, then iptables-restore?

Antony.

-- 
This email is intended for the use of the individual addressee(s) named above 
and may contain information that is confidential, privileged or unsuitable 
for overly sensitive persons with low self-esteem, no sense of humour, or 
irrational religious beliefs.

If you have received this email in error, you are required to shred it 
immediately, add some nutmeg, three egg whites and a dessertspoonful of 
caster sugar.   Whisk until soft peaks form, then place in a warm oven for 40 
minutes.   Remove promptly and let stand for 2 hours before adding some 
decorative kiwi fruit and cream.   Then notify me immediately by return email 
and eat the original message.

                                                     Please reply to the list;
                                                           please don't CC me.


