From: Phil Oester <kernel@linuxace.com>
Subject: Re: Netfilter and Poptop ( and stuff ... )
Date: Mon, 10 Oct 2005 08:15:40 -0700
Message-ID: <20051010151540.GA4468@linuxace.com>
References: <E1EOr9T-0001D1-Ma@mail.sourceforge.net>
Mime-Version: 1.0
Return-path: <poptop-server-admin@lists.sourceforge.net>
Content-Disposition: inline
In-Reply-To: <E1EOr9T-0001D1-Ma@mail.sourceforge.net>
Sender: poptop-server-admin@lists.sourceforge.net
Errors-To: poptop-server-admin@lists.sourceforge.net
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/poptop-server>,
	<mailto:poptop-server-request@lists.sourceforge.net?subject=unsubscribe>
List-Id: <netfilter.vger.kernel.org>
List-Post: <mailto:poptop-server@lists.sourceforge.net>
List-Help: <mailto:poptop-server-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/poptop-server>,
	<mailto:poptop-server-request@lists.sourceforge.net?subject=subscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum=poptop-server>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Seferovic Edvin <edvin.seferovic@kolp.at>
Cc: netfilter@lists.netfilter.org, poptop-server@lists.sourceforge.net

On Mon, Oct 10, 2005 at 08:28:37AM +0200, Seferovic Edvin wrote:
> I wanted to make this easy as possible, but as always - I took the wrong
> turn... probably by choosing Firewall Builder to help me get my firewall set
> up. I achived everything, but I cannot configure ppp+ interfaces in
> FW-Builder? Does anyone has a hint for me? Is this possible anyway ( please
> don't tell me I have to configure 150 ppp interfaces in FW-Builder ) ??? 

If FW-Builder cannot handle the ppp+ syntax which is legal in iptables,
I'd say that's a bug.  Report it to maintainer.

Phil


-------------------------------------------------------
This SF.Net email is sponsored by:
Power Architecture Resource Center: Free content, downloads, discussions,
and more. http://solutions.newsforge.com/ibmarch.tmpl
