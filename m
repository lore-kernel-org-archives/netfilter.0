From: Bryan McAninch <bmcaninch@penson.com>
Subject: NAT'ed Domain Authentication
Date: Wed, 13 Oct 2004 12:40:00 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1097689200.14334.176.camel@wslinux-fractal.penson.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,

I am attempting to setup remote access domain login over an IPSec
tunnel. The tunnel is between a Linux firewall with iptables & openswan,
and a windows xp laptop; the internal domain controllers are 2003
servers. For routing purposes, I need to SNAT the laptop to one of our
internal rfc 1918 addresses on the internal interface of the firewall.
The problem I am encountering is getting the laptop to  successfully log
on to the domain, and I'm certain it has something to do with the SNAT. 

I have found a few posts on the mailing lists discussing the development
of a netfilter module which rewrites the NetBIOS headers accordingly:

http://lists.netfilter.org/pipermail/netfilter-devel/2001-October/005793.html
http://lists.netfilter.org/pipermail/netfilter-devel/2002-April/007535.html

Does anyone know if such a module has been developed or if one will be
in the future, or perhaps a workaround to this?

Thanks.


-- 
Bryan McAninch
Network Security Engineer
Penson Financial Services, Inc.
214.765.1366

