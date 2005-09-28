From: Ron Powell <rpowelljr@gmail.com>
Subject: Newb here,
	I need help opening port 1723 and setting a public IP address to a
	private IP
Date: Wed, 28 Sep 2005 17:02:37 -0500
Message-ID: <fd2d54f80509281502596ad06b@mail.gmail.com>
Reply-To: Ron Powell <rpowelljr@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Ok I very little firewall knowledge and really know nothing about Linux\Uni=
x
so go easy on me.
 What I need to know is this, I have setup a VPN connection on our Windows
2003 server. I need to configure our iptables firewall to allow this
connection, also if anything is different on a 2000 server I will need to
know what to change in case we decide to use it in the future. I need the
vpn's Public IP to point to the private IP of our VPN server and open any
ports to that IP that need to be opened for the vpn connection to work, Im
guessing just 1723. I think that some rules have already been created that
point the Public IP to the Private address but not port 1723.
 Thanks in advance for any advice you can give.
