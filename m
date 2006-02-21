From: angico <angico@yahoo.com>
Subject: Re: can't -j TARPIT
Date: Tue, 21 Feb 2006 12:08:13 -0800 (PST)
Message-ID: <20060221200813.62800.qmail@web36807.mail.mud.yahoo.com>
References: <200602201638.40582.ramoni@databras.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200602201638.40582.ramoni@databras.com.br>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

hi, andre,
i finaly did it!
the problem is that gentoo doensn't include the tarpit patch into the
kernel sources. so i had to do it manually.
thank you, anyway.
cheers,
angico.


--- Andre Ramoni <ramoni@databras.com.br> wrote:

> I use gentoo too.
> Seems that you use the "extensions" use flag,  right ?
> Seems like iptables have build the lib ok, and is loading it ok
> (since it 
> recognizes the -j TARPIT help)
> I made a test here, that was to disable the TARPIT in the kernel, and
> so, I 
> got the same error of you.
> 
> Your TARPIT is in your kernel as a module ? Try to modprobe it to see
> if any 
> problem occurs.
> Once I compiled the kernel with TARPIT build in again, things get
> back to 
> normal.


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

