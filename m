From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: Multiple matches and others
Date: Mon, 31 May 2004 16:58:30 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <02c901c446ed$7237a7a0$0100a8c0@newlife>
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


I am try to figure out what is the meaning of multiple match
like this :-

   iptables ......     -m state --state NEW -m mark --mark 1

is it a boolean AND of two conditions or is it a boolean OR ?

If it is boolean AND, does it mean, 

   iptables ..... -m mark --mark 1 -m state --state NEW ....

this is the same as the first  ?

Similarly I have problem with multiple states comma together, eg :-

  iptables ....  -m state --state NEW,INVALID ......

Does it mean state NEW --and-- INVALID or  NEW --or-- INVALID ?






