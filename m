From: Frank Gruellich <frank@home.manuelm.org>
Subject: Re: FW: Filtering multiple networks
Date: Mon, 31 May 2004 12:45:24 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040531104524.GA26731@home.manuelm.org>
References: <E1BUk4b-0006Wv-Cf@vishnu.netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <E1BUk4b-0006Wv-Cf@vishnu.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@lists.netfilter.org>

* Markus Zeilinger <mz@sea.uni-linz.ac.at> 31. May 04:
> Hi Frank,

Hello,

> thx for you prompt answer!

No problem.  Thanks for not top posting you next reply.  Thanks for not
mangeling threading by setting a Reference: header with a real
mailreader.

> - Thy is DROP bad here? As I see REJECT would send an error message back to
> the source, but this would not make any sense on packets coming on the WAN
> interface with private IP addresses, or am I wrong?

It would be kinda polite to point the sender of the packets to his
misconfigured box.  REJECT is like yelling 'Hey, you are wrong!'
DROPping is like closing your eyes to somebodys problem.  Anyway, it's
you decision right here.

> - Why is INPUT not appropriated here? Should I do the dropping earlier
> perhaps in the mangle table?

Forget it, everything fine.  I saw a -d for a -s.  BTW: never filter
anything in mangle.

HTH,
 regards, Frank.
-- 
Sigmentation fault

