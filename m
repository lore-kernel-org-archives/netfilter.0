From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Clear Iptables chains?
Date: Mon, 8 Jul 2002 15:56:09 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200207081456.g68EuF807141@vulcan.rissington.net>
References: <839BF5387528D311AD5D00902751CFC301B0419A@HAVASSMX> <20020708144658.GR32764@tik.ee.ethz.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020708144658.GR32764@tik.ee.ethz.ch>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Monday 08 July 2002 3:46 pm, Lukas Ruf wrote:

> iptables -P INPUT ACCEPT
> iptables -P OUTPUT ACCEPT
> iptables -P FORWARD ACCEPT
> iptables -F
> iptables -X

Don't forget:
iptables -F -t nat
iptables -F -t mangle

Antony.

> but rtfm.

Always good advice :-)

> On Mon, 08 Jul 2002, Denis JULIEN wrote:

> > How can I clear all iptables chains before that my FW script be launched?
> >
> > thank in advance
> >
> > Denis

