From: "David Cannings" <lists@edeca.net>
Subject: Re: Proof Read
Date: Fri, 16 Apr 2004 18:01:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002701c423d4$7df36ac0$1400a8c0@DAVIDVAIO>
References: <00e701c423cb$a4584cc0$6c45a8c0@ntbrt.bigrivertelephone.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

> Can anyone proof over the following rc.firewall script and throw some
> light as to why I get an 'Invalid Argument' on the two -m physdev upon
> bootup. Yet, once the system is active the modules are loaded and I can
> execute the script and, aside from the error that the modules are
> already loaded, it will not error out on the -m physdev statements.

I assume you have already checked this but are you sure the interfaces have
been configured and brought up by the point the script is run?  If you're
running it in rcX.d, make sure the iptables script comes after the one that
configures network interfaces.

David


