From: Fabrice MARIE <fabrice@celestix.com>
Subject: Re: ftp server issue, trying to DL 1.2.7a
Date: Fri, 6 Sep 2002 09:50:37 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209060950.37416.fabrice@celestix.com>
References: <NEENJAPFEAIEMGMNIGFLGEKNCCAA.rwideman@austin.rr.com>
Reply-To: fabrice@celestix.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NEENJAPFEAIEMGMNIGFLGEKNCCAA.rwideman@austin.rr.com>
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
To: Rob <rwideman@austin.rr.com>
Cc: netfilter@lists.netfilter.org

On Friday 06 September 2002 02:30, Rob wrote:
> I got passed it....DLed on win2k and burned to cdr.
> After extracting patch-o-matic/2.4.19/1.2.7a...i am running the
> patch-o-matic script and:
> # ./runme pending KERNEL_DIR=/usr/src/linux
> ERROR: Invalid option KERNEL_DIR=/usr/src/linux
> [...]
> Any thoughts?

Sure,

try
# KERNEL_DIR=/usr/src/linux ./runme pending
or
# export KERNEL_DIR=/usr/src/linux; ./runme pending

Bash isn't quite like make and in your command example it will try
to feed KERNEL_DIR=/usr/src/linux to ./runme and not take it as an
env variable like it should (-:

Have a nice day,

Fabrice.
--
Fabrice MARIE
Senior R&D Engineer
Celestix Networks
http://www.celestix.com/

"Silly hacker, root is for administrators"
       -Unknown

