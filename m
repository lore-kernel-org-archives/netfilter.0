From: "Reginald NALLARATNAM" <regi@toolsnottoys.com>
Subject: Routing packets with IPTABLES?
Date: Mon, 10 Feb 2003 12:34:16 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <se479e38.044@mail.toolsnottoys.com>
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

Hardware Layout:
   Firewall #1: (Linux Box)
    I have a linux box with 2 nics.
   eth1 @ 192.168.20.1 =20
   eth0 @ 192.168.30.2=20
   Gateway:  192.168.30.1 =20

   Firewall # 2: (Some other router)
   interface 1:  192.168.20.2
   interface 2:  192.168.30.2
   Gateway:  192.168.30.1 =20

   Web server:
   192.168.20.100
   Gateway:  192.168.20.2 (Firewall # 2)  =20

   Gateway - is someother Firewall/Router that allows both firewall #1 and =
#2 to connect to the internet.
   192.168.30.1

Question:
   Is there a way to route incomming packets from the gateway to eth0 on =
firewall #1 based on source IP and destination Port to the web server @ =
192.168.20.100?
The only way this will work if Firewall # 1 routes or forwards the packets =
to web server without connection tracking, since the return answer from =
web server will go through firewall # 2.

Could some give me an example or the command to do this using iptables, if =
not how else can this be done?

Thanks in advance.







