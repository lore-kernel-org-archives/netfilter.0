From: "Christoph Galuschka" <christoph.galuschka@tikom.at>
Subject: Trying to set up NAT
Date: Fri, 01 Apr 2005 17:09:43 +0200
Message-ID: <424D8057.28845.115F4D28@localhost>
Reply-To: christoph.galuschka@tikom.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-description: Mail message body
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

I've tried the whole day setting up NAT and it won't work.
I have the follinwg situation:
I have a proxy server (the machine running NAT) and various 
other machines. I want the proxy server to NAT some 
incoming connections to other machines.
ie: A connection to the proxy (10.1.1.1) on port 15000 should 
go to another machine (10.1.1.2) on port 80 via the proxy.
I have already managed a locale NAT (meaning chaning ports 
ie from 15000 to 80 on the proxy), but as soon as I try to DNAT 
to another machine it won't work anymore.

Any help would be apprechiated.

thanks, happy weekend an regards
Christoph


