From: cc <cc@belfordhk.com>
Subject: Re: uninstall/re-install iptables
Date: Sat, 23 Aug 2003 10:06:47 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F46CC37.60403@belfordhk.com>
References: <200308222328.14788.mrakotom@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200308222328.14788.mrakotom@free.fr>
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
To: Netfilter Group <netfilter@lists.netfilter.org>

Mihamina Rakotomandimby wrote:

> 
> - There is not rules to "make uninstall" .Will it be enough to remove all the 
> copied files during the install process ?
> - what option have i got to specify to have it installed at /usr ( rather than 
> the default /usr/local )?


It's actually in the INSTALL file.

% make BINDIR=/usr/bin LIBDIR=/usr/lib MANDIR=/usr/man
% make BINDIR=/usr/bin LIBDIR=/usr/lib MANDIR=/usr/man install

hth





