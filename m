From: kilho Kim <kilho8667@yahoo.com>
Subject: Help Netfilter+Bridge+Tokenring
Date: Mon, 29 Sep 2003 21:34:57 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030930043457.45349.qmail@web11406.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I have somewhat wiered setup and need some advices.

One machine(A) has 3 Ethernet adapters and 1 token
ring adapter installed. Three clients will be attached
to 3 Ethernet adapter, and the tokenring adapter is
connected to the another linux box (B) acting as a
router. The box (B) will be connected to the internet.

I setup the bridge on box (A). (basically I followed
Ethernet-Bridge-Howto).
The bridge (br0) includes eth0, eth1, and eth3. Then
there is a tokenring interface to box (B).

I'm trying to see if I can use iptables to forward any
packets incoming from the client machines attached to
br0 to tokenring adapter and eventually end up at box
(B).

Well the other requirement I have is those clients
attached to Box (A) shouldn't be able to access the
Box (A) and Box (B) other then sending packets through
them.

I'm a very novice iptables user so if you're kind
enough to show me some of the iptables command and
configuration strings, it would help me a lot.

Thanks much.


__________________________________
Do you Yahoo!?
The New Yahoo! Shopping - with improved product search
http://shopping.yahoo.com

