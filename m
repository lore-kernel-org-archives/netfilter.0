From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: PPTP+NAT+MASQ anyone?
Date: 11 Dec 2002 16:40:06 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039621206.20499.86.camel@tux>
References: <200212091226.23888.roy@karlsbakk.net>
	<200212111514.55539.roy@karlsbakk.net> <1039616794.20561.83.camel@tux> 
	<200212111635.37659.roy@karlsbakk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200212111635.37659.roy@karlsbakk.net>
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
To: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Cc: Netfilter mailinglist <netfilter@lists.netfilter.org>

On Wed, 2002-12-11 at 16:35, Roy Sigurd Karlsbakk wrote:

> that's exactly what I'm doing. with kernel 2.4.19 and 2.4.20.
> doesn't work
> so.
> can I just add the required patches manually without going for the whole 
> bunch?
> if so - which ones do i need?

You will at least need the newnat patch. (I hope the pptp patch doesn't
depend on some other patch in there)
But everything in the pending directory is recommended.

then just apply the pptp patch.

I can't see why this shouldn't work for you.
You are sure you are using an up to date cvs checkout?

-- 
/Martin

Never argue with an idiot. They drag you down to their level, then beat
you with experience.

