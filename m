From: "Juan Pablo Ramirez" <ramirez.juanpablo@gmail.com>
Subject: hi.. problems with DNAT
Date: Sun, 7 Jan 2007 23:14:19 -0300
Message-ID: <d23e54db0701071814s65d1287ds94cfa9f472c5a1a6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

first of all sorry for my level of english is very very bad i know,
i'am working on that...

here's my question...

if i do something like this, could work?

gate/home/admin -> iptables -t nat -N mellon
gate/home/admin ->iptables -t nat -A mellon -p tcp -j DNAT
--to-destination 192.168.9.8:20

i want to put all my DNAT rules and my fowarding rules to my server
area in one rule only.
can i do this?

-- 
Atte.
Ramirez Angeloni Juan Pablo

