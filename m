From: "Reginald NALLARATNAM" <regi@toolsnottoys.com>
Subject: Forwarding packets to another private gateway.
Date: Thu, 24 Jun 2004 10:08:52 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <s0daa508.020@mail.toolsnottoys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Hello,

I have Linux box @ 192.168.3.1 with acts as a firewall, there is another =
firewall @ 192.168.1.1 which acts as a vpn to another network 192.168.2.0

I have a citrix server on 192.168.3.11 with a default gateway of 192.168.3.=
1.
I need to access other machines in the 192.168.2.0 subnet remotely from =
this citirx server.
My question is what rule must I add in the 192.168.3.1 Linux firewall to =
forward any trafic going to 192.168.2.0 network to 192.168.1.1.


Thanks.




