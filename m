From: Jean-Christian Imbeault <jc@mega-bucks.co.jp>
Subject: rules disappear after a few seconds
Date: Mon, 17 Feb 2003 15:46:38 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E50854E.5060108@mega-bucks.co.jp>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Ok, this one is bizarre. I have a small shell script to clear my 
iptables rules and then insert 9 rules. If I run my script and then do 
"iptables -n -L" my rules show up.

If I keep doing "iptables -n -L" after about 10-20 seconds the rules 
disappear and I am left with three empty INPUT/OUTPUT/FORWARD tables.

Where did my rules go? What made them disappear?

Thanks,

Jc


