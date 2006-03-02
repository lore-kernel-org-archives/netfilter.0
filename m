From: "Buddy wu" <ejournal4me@gmail.com>
Subject: how to connect to VPN server using IPTABLES nat
Date: Thu, 2 Mar 2006 18:46:04 +0800
Message-ID: <43a0cdcb0603020246n4da19616p@mail.gmail.com>
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

   I DON'T mean there is a VPN serving making from linux.
   The fact is that:
   I set up a VPN server using windows server(IP:192.168.1.1) and it
is behind a Linux server which is using iptables for nat
   iptables -A PREROUTING -d 218.0.0.0 -j DNAT --to 192.168.1.1

   but I can't establish the VPN connection from out(etc IP address is
218.10.0.1, I have tested that I can connect to other service such as
web(port 80). How can I establish the VPN connection ? Is there need
some setting in IPTABLES?

