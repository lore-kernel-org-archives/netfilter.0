From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Mangle
Date: Mon, 19 Jul 2004 11:51:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407191151.33044.Antony@Soft-Solutions.co.uk>
References: <a05ad8750407190342530d09c2@mail.gmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <a05ad8750407190342530d09c2@mail.gmail.com>
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

On Monday 19 July 2004 11:42 am, Murugavel Thiruvengadam wrote:

> we have few clients connected in LInux  firewall
>
> while sending a request to DNS we are using (mangle.) client's source
> port  . the same port we are using to send a request to dns. while
> coming back.  assume that 3 person used the same port. DNS return
> traffice not going to respective client. can anyone please advise.
>
> it was working fine with nat. we are right now using mangle

What are you using the mangle table for?   Why are you using the mangle table 
instead of the nat table?

If you post your ruleset we may be able to offer some specific help.

Regards,

Antony.

-- 
The truth is rarely pure, and never simple.

 - Oscar Wilde

                                                     Please reply to the list;
                                                           please don't CC me.


