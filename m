From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: string module with kernel 2.4.20
Date: Mon, 28 Jul 2003 17:25:13 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0307281721030.11010@dns.toxicfilms.tv>
References: <000001c3551b$65930e00$c800a8c0@klintan.local>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c3551b$65930e00$c800a8c0@klintan.local>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael K <micke@klintan.se>
Cc: netfilter@lists.netfilter.org

Hi,
> Does this men that it won't work with NEWER kernels than 2.4.9? If so,
> is there a replacement.
It works with everything after 2.4.9. (and with 2.4.9 with my patch
available at http://soltysiak.com/linux/string-compilation-249issue.patch
- it's a patch against the netfilter tree so apply this before using
patch-o-matic)

> iptables v1.2.7a: Couldn't load match
> `string':/lib/iptables/libipt_string.so: cannot open shared object file:
> No such file or directory
You have to recompile iptables and its modules to install the shared
library for the string match. Do a make install again on the iptables source.

Please also read the entry in FAQ about stopping worms, virii, etc. It
mentions the string match should not be used for that.

Regards,
Maciej

