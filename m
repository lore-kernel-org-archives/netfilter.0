From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Is this firewall good enough?
Date: Tue, 8 Jun 2004 10:57:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406081057.40137.Antony@Soft-Solutions.co.uk>
References: <20040608091436.84113.qmail@web14712.mail.yahoo.com> <40C58A06.8020509@linuxmail.org>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40C58A06.8020509@linuxmail.org>
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

On Tuesday 08 June 2004 10:42 am, Feizhou wrote:

> >2.  /sbin/iptables -A INPUT -p tcp -m state --state
> >ESTABLISHED,RELATED -j ACCEPT
>
> Forget about this. It makes things easier yes but it is too slow if you
> come under attack...but then you put everything on one box seemly so I
> guess you don't get much traffic.

How do you recommend dealing with reply packets instead?

Regards,

Antony.

-- 
"The future is already here.   It's just not evenly distributed yet."

 - William Gibson

                                                     Please reply to the list;
                                                           please don't CC me.


