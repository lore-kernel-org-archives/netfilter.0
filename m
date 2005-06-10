From: Tib <tib@tigerknight.org>
Subject: ip_conntrack_ftp issues
Date: Thu, 9 Jun 2005 20:03:38 -0500 (CDT)
Message-ID: <Pine.LNX.4.53.0506092001190.29097@altaica>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


I am trying to setup an ftp service on a non-standard port (42), and had
initially encountered information that I may have to recompile the module
entirely.

Then I saw information saying that I could specify port arguments on the
insmod command (ie. insmod ip_conntrack_ftp ports=xx,yy,zz).

I'm on debian with iptables 1.2.11 installed - which of the above is true?
I tried using the insmod command with arguments and got no errors in
response, but the module didn't appear to work. Is it possible (if
necessary) to recompile just the module or will I have to redo my whole
kernel just for a single file or two?

<EOL>
Tib

