From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Problem: ISA card & iptables (2.4.26) - disappearing packets
Date: Sun, 18 Jul 2004 16:56:39 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407181656.39460.Antony@Soft-Solutions.co.uk>
References: <40F8D503.3040608@polbox.com> <200407181140.35100.Antony@Soft-Solutions.co.uk> <40F93C01.5020107@polbox.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40F93C01.5020107@polbox.com>
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

On Saturday 17 July 2004 3:47 pm, adderek wrote:

> I have removed all cards except those three network cards and graphic card.

If you take netfilter and the other two PCI cards completely out of the 
equation (ie: unplug the other cards, and set netfilter to default ACCEPT on 
all chains with no ruleset), can you communicate with the system at all 
through this card?

Regards,

Antony.

-- 
I want to build a machine that will be proud of me.

 - Danny Hillis, creator of The Connection Machine

                                                     Please reply to the list;
                                                           please don't CC me.


