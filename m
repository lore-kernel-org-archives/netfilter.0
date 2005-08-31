From: "Jimmy" <squid@oranged.to>
Subject: Source NAT
Date: Wed, 31 Aug 2005 12:18:39 +0100 (BST)
Message-ID: <58867.212.100.225.55.1125487119.squirrel@webmail.*>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Received: from 212.100.225.55
	(SquirrelMail authenticated user squid@oranged.to)
	by webmail.* with HTTP; Wed, 31 Aug 2005 12:18:39 +0100 (BST)
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

I currently have a situation that I am hoping iptables can resolve. The
issue is that I need to NAT the source address based on the destination
address. Is that possible with IPTables ?

For example

if dst = 1.1.1.1 src = 10.1.1.1
if dst = 1.1.2.1 src = 10.1.1.2

Can anyone give me any advice on completing that?

Regards,




