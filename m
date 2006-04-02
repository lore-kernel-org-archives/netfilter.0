From: sven@hin.de
Subject: Re: Update Iptables in order to use String-Match
Date: Sun, 02 Apr 2006 20:07:34 +0200
Message-ID: <443012E6.3050204@hin.de>
References: <001501c65678$a8c561d0$0101000a@sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001501c65678$a8c561d0$0101000a@sterenborg.info>
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
Cc: netfilter@lists.netfilter.org

Rob Sterenborg schrieb:
> Dunno.. The crystal ball is a bit cloudy today. Any error messages ?
oh I 've forgotten:

linux:/usr/local/lib/iptables # iptables -m string -h
iptables: match `string' v1.3.3 (I'm v1.3.5)

> You have "updated some versions of p-o-m". What do you mean by that ?
> What have you done exactly ?
> 
> Have you :
> - untarred the kernel,
> - untarred POM,
> - untarred iptables,
all yes

> - patched both the kernel and iptables with POM,
yes, but don't add string-match

> - compiled and installed the kernel and modules,
yes, but no string-match modul seen in kernel menuconfig

> - compiled and installed iptables ?
yes



