From: Ben <bench@silentmedia.com>
Subject: simple nat question
Date: Tue, 2 Jul 2002 12:34:53 -0700 (PDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.30.0207021225140.7072-100000@gilgamesh.eos.SilentMedia.com>
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
To: NetFilter <netfilter@lists.samba.org>

I've got a basic nat setup:

  internet
     |
+====+=====+ eth0: 1.2.3.4
| firewall |
+====+=====+ eth1: 10.0.0.1
     |
+====+=====+ eth0: 10.0.0.2
|  server  |
+==========+


What I would like is for packets coming from the server (10.0.0.2) to get
SNAT'd to the firewall's IP address, 1.2.3.4. It seems easy enough to do:

iptables -t nat -A POSTROUTING -o eth0 -s 10.0.0.2 -j SNAT --to 1.2.3.4

But now I don't see how return packets are going to make it back to my
server, because the firewall is going to think they are destined for it.
If I add the rule:

iptables -t nat -A PREROUTING -d 1.2.3.4 -i ! eth0 -j DNAT --to 10.0.0.2

Then it seems I loose the ability for the firewall to run anything
accessable to the outside world, like ssh.


