From: Tobias DiPasquale <cbcgtt@gmail.com>
Subject: FIB LPM algorithm
Date: Mon, 7 Jun 2004 07:23:26 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <9e3aacf40406070423583216f@mail.gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

Hello all,

I was wondering if someone could point me to a discussion of what LPM
algorithm the Linux routing FIB uses? Is it detailed in the code
somewhere, or online, or in a book? I have perused the code somewhat
and it appears that it makes use of hash tables to store the FIB(s?),
but I can't seem to find the actual LPM operation used. Any help would
be appreciated. Thanks.

--
Tobias DiPasquale
[ 0x63626367545440676d61696c2e636f6d ]

