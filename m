From: Axel Heinrici <heinrici76@gmx.de>
Subject: FTP connection trackung
Date: Mon, 27 Jan 2003 10:46:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301271046.37445.heinrici76@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

Hi

I have a problem making passive FTP-connections on non standard port.=20
Login is no problem but I cannot transfer any data. I am sitting behind=20
a firewall. It is no problem to connect to ftp-servers outside on=20
standard port.=20
It seems that FTP-conntrack doesn't track these non-standard=20
connections. How can I teach netfilter to track these=20
non-standard-ftp-connections?

greetings
=09Axel

