From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: P-O-M and string matching
Date: 04 Apr 2003 21:54:18 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049486058.25167.88.camel@tux.rsn.bth.se>
References: <20030404180335.38470.qmail@web40204.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030404180335.38470.qmail@web40204.mail.yahoo.com>
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
To: SBlaze <dagent.geo@yahoo.com>
Cc: nml <netfilter@lists.netfilter.org>

On Fri, 2003-04-04 at 20:03, SBlaze wrote:

> Then using patch o matic I applied a very few changes (quote time and string).
> Now the quote and time patches are selectable from a make menuconfig from the
> /usr/src/linux directory. However the string matching options are NO WHERE to
> be found. I don't understand why and thats why I need help.
> 
> Can anyone tell me what I am doing wrong? Is it a bug somewhere? Thanks in
> advance for anyones and everyones time!

You need to compile iptables against your new kernel after you've
patched it with the string match from p-o-m.

There's a check during the complilation that checks which things you
have in your kernel. Only these things get compiled (with a few
exceptions).

-- 
/Martin

