From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Routing and PREROUTING
Date: Mon, 12 Jul 2004 17:02:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407121702.15765.Antony@Soft-Solutions.co.uk>
References: <20040712145806.GA30044@itstud.chalmers.se> <40F2ABB7.2080801@nexusmgmt.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40F2ABB7.2080801@nexusmgmt.com>
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

On Monday 12 July 2004 4:18 pm, John A. Sullivan III wrote:

> Hmmm . . . someone correct me if I'm wrong but I think your first rule
> will end processing in the nat table but the packet will still pass to
> the FORWARD table where, if it does not match a rule, it will be handled
> by your FORWARD chain policy - John

That is correct.

If you ACCEPT packets in the PREROUTING nat table, they will proceed to the 
FORWARD filter table and start trundling through your ruleset.

If you DROP packets in the PREROUTING nat table, all sorts of things are 
likely to break (depending on how indiscriminate your DROP policy is).

Antony.

-- 
"When you talk about Linux versus Windows, you're talking about which 
operating system is the best value for money and fit for purpose. That's a 
very basic decision customers can make if they have the information available 
to them. Quite frankly if we lose to Linux because our customers say it's 
better value for money, tough luck for us."

 - Steve Vamos, MD of Microsoft Australia

                                                     Please reply to the list;
                                                           please don't CC me.


