From: "Robert Wideman" <rwideman@austin.rr.com>
Subject: No such file or directory when using an asterisk
Date: Mon, 25 Nov 2002 11:19:44 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c294a6$db3c4f80$010da8c0@mrboboo.com>
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
To: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

Getting errors with my script when I am running it.  My system works fine
except for these echo commands:
echo 1 > /proc/sys/net/ipv4/conf/*/log_martians
The error that I get when I run the script is "No such file or directory."
I can do the individual files without the "*" in there but when I use the
asterisk (*) I get an error "Ambiguous redirect" when run from the command
line.
Any thoughts?


Rob


