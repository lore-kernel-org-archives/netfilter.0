From: Tero Kilkanen <tkilkane@cc.hut.fi>
Subject: A question on netfilter behavior.
Date: Wed, 8 May 2002 14:38:49 +0300 (EET DST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.OSF.4.10.10205081432250.20901-100000@kosh.hut.fi>
Reply-To: kilkanen@iki.fi
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Hello, 

I have a question, on IPTables behavior in the following scenario. I have
not subscribed to the netfilter list, so please CC me when answering.

First, I am using Linux kernel version 2.4.9, and IPTables v1.2.

The scenario is the following:

I have a private network, with 192.168.x.x addresses, and an ADSL
connection to the outside. I have configured NAT like this:

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
ACCEPT     all  --  192.168.0.0/24       192.168.0.0/24
SNAT       all  --  192.168.0.0/24       0.0.0.0/0
to:10.131.80.34

Now, I am running a program which uses a TCP connection to a server. The
TCP connection is from the private network to the Internet. Now, when I
try to block this connection by denying all traffic from this machine's IP
address to outside world, the TCP connection is still there. I have put a
DENY rule both to the INPUT chain and PREROUTING chain.

Is this the way it should work? I think this could be a problem with
normal firewall setups in some scenarios. If there is a malicious program
connected from inside network to outside world, and the connection needs
to be stopped at the firewall. This looks impossible with the current
software.

Greetings,

- Tero Kilkanen




