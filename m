From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: logging with iptables
Date: Sat, 13 Dec 2003 09:58:23 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312130958.24160.Antony@Soft-Solutions.co.uk>
References: <37701240971DD31193970000F6CCB9F704CB7EFB@duke.datcon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <37701240971DD31193970000F6CCB9F704CB7EFB@duke.datcon.co.uk>
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

On Saturday 13 December 2003 9:45 am, Piers Finlayson wrote:

> Hi,
>
> Is it possible to log a packet's entire contents with iptables, rather than
> just useful stuff from the packet header?

No.   Netfilter has a single fixed logging format which shows onlt the packet 
header information, nothing from the body itself.

> I can run tcpdump/tethereal etc to log the packets I'm interested in, but
> figure it would be much neater if I can just use iptables to do it.

You might want to have a look at http://gnumonks.org/projects/ulogd to see if 
it will help with what you want, but I suspect tcpdump etc will remain your 
best bet.

Antony.

-- 
"Note: Windows 98, Windows 98SE and Windows 95 are not affected by [MS
Blaster].   However, these products are no longer supported.   Users of these
products are strongly encouraged to upgrade to later versions."

(which *are* affected by MS Blaster...)

http://www.microsoft.com/security/security_bulletins/ms03-026.asp

                                                     Please reply to the list;
                                                           please don't CC me.


