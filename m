From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NATed and direct connection to one server
Date: Tue, 17 Feb 2004 19:49:02 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402171949.02795.Antony@Soft-Solutions.co.uk>
References: <40326B8E.10303@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40326B8E.10303@gmx.net>
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

On Tuesday 17 February 2004 7:29 pm, Ben Goedeke wrote:

> To make the move as painless as possible for the users I want to keep
> the DNAT rules for a while (and point them to the new IP of the mail
> servers).
>
> Now for my question: Do I need to add an SNAT rule in POSTROUTING to

No.

> handle responses from the mail servers or is it enough to have the DNAT
> rules in PREROUTING?

Yes.

> And if I indeed need an SNAT rule how can I
> possibly distinguish packets that belong to connections that were DNATed
> when they came in and those that weren't and had the right destination
> IP all along?

No problem (see above).

Regards,

Antony.

-- 
What makes you think I know what I'm talking about?
I just have more O'Reilly books than most people.

                                                     Please reply to the list;
                                                           please don't CC me.


