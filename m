From: "Jerry Rasmussen" <jerry@cheesymouse.com>
Subject: IPTables error
Date: Wed, 14 Jan 2004 19:08:45 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <217D777D3789FC4591199BA41FB0617A0101EB@nemo.scriptthis.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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

When I try to add a command with eth1:1 get this error 'iptables -t nat
-A PREROUTING -p tcp -i $ex_dev -d 216.27.xxx.xx --dport 3389 -j DNAT
--to 192.168.xx.xxx
Warning: wierd character in interface `eth1:1' (No aliases, :, ! or *)."

I have done a good bit of Googleing I am sure there is an easy answer
that I am missing any help would be apperciated.  I need to have more
than 1 ip address on eth1

Thanks
Jerry

