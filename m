From: "David Leangen" <dleangen@canada.com>
Subject: RE: /etc/sysconfig/iptables does not load on reboot
Date: Mon, 4 Jul 2005 23:17:09 +0900
Message-ID: <NEBBKBPLMLNABNADCIPAAEGKBDAB.dleangen@canada.com>
References: <200507040839.02705.rob0@gmx.co.uk>
Reply-To: dleangen@canada.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200507040839.02705.rob0@gmx.co.uk>
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
To: NetFilter <netfilter@lists.netfilter.org>


Thanks for all the helpful hints!

> Same kernel?

goodhost=2.6.9-1.667smp
badhost=2.6.9-1.667

Not sure what the "smp" is.

I will try loading on badhost the version with the same kernel on goodhost
and see if that fixes the problem.


> > However, IT DOES NOT GET LOADED THE SAME WAY!!
>
> Please define that.

I just meant that the output from 'iptables -L' does not show the same
thing. The rules are correctly applied when running 'iptables-restore' later
on, but not all the rules are correctly applied at startup.


> If you want help you should post:
>    a. The complete but uncommented iptables-restore file
>    b. iptables-save(8) output after the boot, but before ..
>    c. iptables-save(8) output after manual restoring.
>    d. Bank and credit card account information, mother's maiden name.
>    e. Debugging output as described below.
>    f. What have you changed from default? Kernel? Patch-o-matic?

Now that you've helped me to realise that I'm not using the same kernel,
I'll try that first, and if the problem persits go on to all your other
helpful suggestions. My only problem is that I won't have physical access to
the server again until later this week.

Here is my credit card info:

Visa - 5515 2363 5124 1234
  exp 04/06

Mother's maiden name: Ima Galible

Just let me know if you need my social security number, too. For security
reasons, I'd rather mail that to you privately.

Thanks again!

:-)



