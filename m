From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: -m string --string cmd.exe
Date: Tue, 11 Jun 2002 18:15:10 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.21.0206111813280.14660-100000@dns.toxicfilms.tv>
References: <20020611161436.F3A0D4891@lists.samba.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020611161436.F3A0D4891@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Allen Wayne Best <iptables@atoka-software.com>
Cc: netfilter@lists.samba.org

> when i try to use this rule, i get the following error:
> 
> iptables v1.1.1: Couldn't load match `string'
You need to run:
make patch-o-matic from the netfilter tree and patch your kernel with
the string module.

and then load the module :)

But please, search the archives on discussion about the string match.
It is not advised to use this match agains cmd.exe, etc.

Best Regards,
Maciej Soltysiak



