From: Andrew Pilley <ashridah@bordernet.com.au>
Subject: Re: Interesting SNAT setup quesiton
Date: Mon, 25 Nov 2002 14:35:30 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021125033529.GC766@bordernet.com.au>
References: <20021125012456.GB766@bordernet.com.au>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20021125012456.GB766@bordernet.com.au>
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
To: netfilter@lists.netfilter.org


argh. of course, i would spam a list shortly before finding the solution
myself

turns out i wasn't forwarding 0/0 from the DMZ network, only address
from the DMZ range, so i wasn't actually receiving the replies to stuff
sent out the ADSL connection. 

sorry for bothering you.

Andrew Pilley



