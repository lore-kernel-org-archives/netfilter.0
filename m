From: Anthony Liu <anthony@nexus-online.com>
Subject: Re: Purely NAT
Date: Tue, 29 Oct 2002 02:37:55 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021028183756.34671877D8@defiant.starfleet.net>
References: <005401c27e43$73946990$0bc8c80a@dolphin>
	<200210281444.g9SEime08636@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200210281444.g9SEime08636@vulcan.rissington.net>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: Netfilter Mailing List <netfilter@lists.samba.org>

On Mon, 28 Oct 2002 14:44:43 +0000 Antony Stone <Antony@Soft-Solutions.co.uk> wrote:

> On Monday 28 October 2002 5:32 am, yenjet.chan@eglobal.com.my wrote:
> 
> > Hi all,
> >
> > This is my first post to the list, so please bare with me.
> > I have a requirement here. Is there possible to create a purely NAT
> > iptables rules for certain IP addresses?
> 
> No.   You can turn off stateful inspection by not loading or compiling the 
> connection tracking support, but you cannot use it for some addresses but not 
> others.

Are you sure? By not using "-m state" it might actually work, how about:
iptables -A FORWARD -o ppp0 -s aaa.bbb.ccc.eee -j ACCEPT
iptables -A FORWARD -o ppp0 -s aaa.bbb.ccc.ddd -m state --state ! INVALID -j ACCEPT


