From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: PPTP+NAT+MASQ anyone?
Date: 11 Dec 2002 15:26:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039616794.20561.83.camel@tux>
References: <200212091226.23888.roy@karlsbakk.net>
	<200212111249.53924.roy@karlsbakk.net> <1039615426.20573.80.camel@tux> 
	<200212111514.55539.roy@karlsbakk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200212111514.55539.roy@karlsbakk.net>
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

On Wed, 2002-12-11 at 15:14, Roy Sigurd Karlsbakk wrote:

> Then what am I doing wrong???
> 
> cd /usr/src
> tar xzf packed/linux-2.4.19.tar.gz
> ln -s linux-2.4.19 linux
> cd netfilter/patch-o-matic
> ./runme pending
> ./runme extra

I have no idea, you say you use p-o-m from cvs and that you apply all
pending patches... after doing that the pptp patch works fine here.

-- 
/Martin

Never argue with an idiot. They drag you down to their level, then beat
you with experience.

