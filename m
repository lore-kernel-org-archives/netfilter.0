From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: what is patch-o-matic?
Date: Sat, 30 Nov 2002 14:55:13 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0211301446560.12156-100000@dns.toxicfilms.tv>
References: <F542LFnonGXw6SAcSQs00022366@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F542LFnonGXw6SAcSQs00022366@hotmail.com>
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
To: Afshin Lamei <linux_st@hotmail.com>
Cc: netfilter@lists.netfilter.org

Hi Afshin,

patch-o-matic is a set of patches that:
- apply changes pending for inclusion to the kernel tree
- apply functionality/bugfixes which have been submitted to the kernel,
  and which you may not have with your running kernel
- add new features/targets/matches written by people from around the world
  that may prove useful.

It's a way to make your netfilter firewall a swiss army knife.
It includes features known from other firewall solutions, and some totally
unknown. Thanks to the modularity and opensource character :))

> Is it necessarily needed or only provides additional functionalities?
Well, sometimes its patches are needed, if you need eg. amanda nat module,
quake conntrack modules, mms, h.323 modules, pptp modules, or the ability
to change the conntrack timeouts on the fly via /proc

Regards,
Maciej Soltysiak



