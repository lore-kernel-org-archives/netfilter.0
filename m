From: Sheldon Hearn <sheldonh@starjuice.net>
Subject: Re: SSH Connections Lost After 1 minute idle
Date: Wed, 14 Jul 2004 13:42:20 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1089805340.19080.21.camel@axl.seasidesoftware.co.za>
References: <20040713165106.65338.qmail@web40710.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040713165106.65338.qmail@web40710.mail.yahoo.com>
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
To: Real Cucumber <monkcucumber@yahoo.com>
Cc: netfilter@lists.netfilter.org

On Tue, 2004-07-13 at 18:51, Real Cucumber wrote:
> I have a fedora firewall/router using iptables to
> forward incoming SSH packets to an internal server and
> it works great....however, only if the user does not
> remain idle for 1 minute.

If you're going to use SSH through a stateful firewall, you should
disable out-of-band keep-alives and enable in-connection keep-alives.

I use this in sshd_config:

# In older versions of OpenSSH, it's KeepAlive, not TCPKeepAlive
TCPKeepAlive no
ClientAliveInterval 30
ClientAliveCountMax 120

See the sshd_config(5) manual page for implications.

Ciao,
Sheldon.


