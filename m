From: "__ Radien__" <radien@zworg.com>
Subject: Re: to use or not to use stateful capabilities
Date: Mon,  5 Apr 2004 05:53:29 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <28662.1081169609@zworg.com>
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Antony, I made mistake in specifying the port greater than 1024, and I
meant  >1024.
----
Anyway, for a more complex configuration same as example you wrote,
can you tell me what is the benefit?
If I just accept packets w/ ACK flag that is of the conneciton has a
established state in the state table, rather than accepting every
packets that seems to be of a connection in established state. I mean
plz explain more :) , and give examples of disclosure if I don't use
stateful feature.

I wrote those rules, set of 4 rules. I can't underestand it's necessity,
yet.

Regards
__Radien__

