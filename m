From: "David Cannings" <lists@edeca.net>
Subject: Re: open ports
Date: Mon, 17 May 2004 10:43:53 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003701c43bf3$7a1ab980$1400a8c0@DAVIDVAIO>
References: <BAY15-F36xiW2wqUjfg0006b834@hotmail.com>
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

From: "azeem ahmad" <azeem484@hotmail.com>
> but its not the soulution to just leave the programs that have dynamic
> ports. there must be a solution for them in netfilter

If you are very worried and have a large network, set up a SOCKS proxy.  I
believe the Windows MSN client also supports HTTP proxying but I've never
tried.  On a smaller scale, it is fairly safe to allow the whole range of
outgoing ports to be ACCEPTed in your OUTPUT chain, such as allowing out
2000-3000. You would have to find out the exact range it uses.  A rule
allowing ESTABLISHED or RELATED in your INPUT chain will handle the replies.

Unless you're going to use UPnP to open and close ports as needed it isn't
easy to get programs like MSN that use lots of ports to work fully behind a
firewall or NAT.  There is a UPnP daemon for Linux and a good article at:
http://www.ruwebit.net/article/77.

David


