From: "Ryan / Tilzs" <tilzs@hotmail.com>
Subject: Couple IPQ questions
Date: Tue, 10 Dec 2002 17:12:27 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F40hL7szm8xd8w5A8zW000126bf@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi all,

I have a project where I need to mangle and route packets on 2 different 
network interfaces. Each network interface will be assigned a different 
subnet. I'm trying to figure out the best approach at doing this.

I'm wondering if it is possible to choose what network interface to send 
packets to via a user level IPQ app or is something like this only possible 
doing a kenel level module.

I'm also curious if it is possible (I assume the answer is yes on this one) 
to inject completely new packets to one NIC or the other using an IPQ user 
level app.

Third, if the answer is yes to both, if anyone has an example for me it 
would be appreciated.

I've written kernel netfilter modules before, but I'd rather do codeing at 
user level if IPQ will support what I need to do.


ryan hagelstrom

Sonic Fury        - http://www.sonicfury.net

_________________________________________________________________
The new MSN 8: advanced junk mail protection and 2 months FREE* 
http://join.msn.com/?page=features/junkmail


