From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: Re: [OT] Was: ESP does not hit the nat table
Date: Thu, 5 Aug 2004 12:36:01 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00f201c47aa5$b6157ab0$0100a8c0@newlife>
References: <D5C9032B2B09C64EA2409D6214E91AC9051228@asimail2.alphanumeric.com> <200408040949.39972.Antony@Soft-Solutions.co.uk>
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


Did you patch the kernel using NAT-T patch ? And 
did you turn on the nat_traversal ?

It happens to my system too where I have
nat-t patch, but nat_traversal is disabled (default) in 
freeswan configuration, then I put in a rule like this :-

     iptables -t nat -I PREROUTING -p esp

When I list the rule, I can't see any packet going thru' it.

Regards.






