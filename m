From: "Landon Chelf" <landonc@starrobbins.com>
Subject: Broken ftp through iptables
Date: Tue, 26 Aug 2003 11:21:18 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000701c36be5$b629a050$6901a8c0@Station13>
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

Hello,

I've ran into a recent problem both on rh8 and rh9 using iptables.  I've
setup my firewall to drop everything incomming and forward and am only
allowing certain ports to be open.  I've opened ftp (port 21 tcp) and I
can connect via FTP from one machine and authenticate, but when I issue
my first command like "ls" for instance the connection locks up and
won't do anything.  Is there a way to fix this?

Landon


