From: Fabrice MARIE <fabrice@netfilter.org>
Subject: Re: patching iptables - how?
Date: Thu, 9 Jan 2003 10:34:56 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301091034.56326.fabrice@netfilter.org>
References: <20030108221616.1503.qmail@web12706.mail.yahoo.com>
Reply-To: fabrice@netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030108221616.1503.qmail@web12706.mail.yahoo.com>
Content-Disposition: inline
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
To: Mladen Meduric <mladen_meduric@yahoo.com>, netfilter@lists.netfilter.org

On Thursday 09 January 2003 06:16, Mladen Meduric wrote:
> Hi all,
> just joined the list.
> Pretty new to linux/iptables (on SuSE8.0). I'm trying to patch from 1.2.5
> to 1.2.6a and then to 1.2.7a.
> Do have all patches. Tried "patch" command, but I seem can't figure it out
> properly. Would someone explain how to do this in couple of steps, please?
> Also, from reading other articles, after patching up or reinstalling
> iptables from scratch, is it necessary to recompile the kernel?

Hello,

If all you want is to apply the patches from patch-o-matic (especially the extensions), you can
have a look at the netfilter-extension-HOWTO:
http://www.netfilter.org/documentation/HOWTO/netfilter-extensions-HOWTO.html
there is a little paragraph explaining how to use p-o-m.
For upgrading your iptables only, see the reply from Athan.

Have a nice day,

Fabrice.
--
Fabrice MARIE

"Silly hacker, root is for administrators"
       -Unknown

