From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: simple config question
Date: Sun, 28 Mar 2004 09:17:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403280917.34504.Antony@Soft-Solutions.co.uk>
References: <000a01c41470$9dbe3ec0$8a361645@Earthlink.net>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000a01c41470$9dbe3ec0$8a361645@Earthlink.net>
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

On Sunday 28 March 2004 3:58 am, Eric McAfee wrote:

> I need to know the iptables command that would restrict all access to my
> server except for my computer's Dreamweaver program and ccbill's access to
> my password file. I know it would be some variation of:
> iptables -A INPUT -i ppp0 -p tcp --syn -j DROP

That rule will definitely block all TCP access via ppp0 to the machine.

All you need to do next is insert before that rule something suitable to allow 
the connections you mentioned.

I can't quite figure out from the description you gave what network protocols 
you are talking about however, so I can't suggest what rules they need to be, 
however if you're not sure either, a simple LOGging rule should help you work 
out what is needed:

iptables -I INPUT -i ppp0 -p tcp -s a.b.c.d -j LOG

where a.b.c.d is the IP address of a machine you want to allow access.   The 
LOG will show you what packets arrive, just before they get DROPped, so you 
should be able to work out from that what rule to add to ACCEPT them instead.

Regards,

Antony.

-- 
This is not a rehearsal.
This is Real Life.

                                                     Please reply to the list;
                                                           please don't CC me.


