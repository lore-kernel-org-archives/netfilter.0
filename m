From: "Kevork" <rxlm@comintec.com.ar>
Subject: Did MASQUERADE not work ?
Date: Tue, 9 Mar 2004 23:05:02 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00c001c40644$19931970$6cfaa8c0@Defiant>
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

Hi !,

This problem is making me crazy ...

All of the sudden, PCs from inside network lost conextion to internet.
After some tcpdump on the linux box, I saw the box was not NATing.
Paquets from inside are going to outside on its original IP source.
The most misterious thing is that this was working some hours ago, from the
first time I set up the box.
No software was installed, no change was acomplished on the box ... nothing.
Iptables script is the same as when it worked.
MASQ line is:
iptables -t nat -A POSTROUTING -s 192.168.250.0/24 -d $internet -j
MASQUERADE

I have 2 versions of kernel, one is out-of-the-box RedHat 9, and the other
is compiled by me.
I treid both, but the porblems persists (before there was not problem).

Has some one, please, some idea or any explanation for this ?.
It's getting me quite crazy ...

Thenk you very much,
Kevork.


