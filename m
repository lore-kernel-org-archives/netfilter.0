From: Denis JULIEN <denis.julien@vupublishing.net>
Subject: ip_forward file
Date: Thu, 4 Jul 2002 15:16:12 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <839BF5387528D311AD5D00902751CFC301B0418D@HAVASSMX>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: iptables <netfilter@lists.samba.org>

Hi,
In order to validate the routing of my Red hat linux (7.2) I have to do an
echo "1" > /proc/sys/net/ipv4/ip_forward.
But every time that I restart the network service the ip_forward file
returns to the "0" value and my server does not route any more. 
How can I do to keep the ip_forward set to "1"?

(It's my first time on linux..)
thank in advance

Denis   





