From: Kevin McConnell <kevymac@yahoo.com>
Subject: Re: Doing Bridge with firewalling
Date: Tue, 31 Dec 2002 12:23:21 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021231202321.1635.qmail@web40307.mail.yahoo.com>
References: <20021231190312.98050.qmail@web40908.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021231190312.98050.qmail@web40908.mail.yahoo.com>
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
Content-Transfer-Encoding: 7bit
To: Brad Chapman <kakadu_croc@yahoo.com>, Afshin Lamei <linux_st@hotmail.com>
Cc: netfilter@lists.netfilter.org


--- Brad Chapman <kakadu_croc@yahoo.com> wrote:
> Yes. You have to remove all addressing data from the
> config files your distro uses
> to configure eth0 and eth1. Then you need to use a
> kernel with CONFIG_BRIDGE and the
> netfilter-bridge patches applied, and you need the
> bridge-utils package installed.
> Those thre items can be found at kernel.org and
> http://www.math.leidenuniv.nl/~buytenh/bridge. The
> Red Hat 8.0 2.4.18-14 kernel has
> the appropriate infrastructure present.

I have a question though. If he removes all addressing
data, how can he do NAT'ing properly?


=====
Kevin C. McConnell --RHCE-- <Red Hat Certified Engineer>

__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com

