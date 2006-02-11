From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: [OT] Strange bash phenomenon
Date: Sat, 11 Feb 2006 08:44:52 -0500
Message-ID: <1139665492.21361.37.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: Netfilter users list <netfilter@lists.netfilter.org>

Hello everyone.  This is a little off topic but I find it both
perplexing and amusing.  I've been spending the last few days enabling
support for CyberGuard security devices for the ISCS network security
management platform.  It has gone very well with the new firmware and
has given us a near off the shelf solution.

However, in one of the scripts for automated distribution of the rules,
it checks for the presence of existing iptables files.  I originally
thought I could do something like:

if [ -f iptables* ];then

But the shell expands all the iptables file names and creates an error
when passing that many arguments to the test.

So I then thought I could do:

FILES=/etc/config/iptables*
if [ -f ${FILES%% *} ];then
        cp /etc/config/iptables* /etc/config/PEPBackup/ 2>/dev/null
        if [ $? -ne 0 ]; then
                echo '[PEP Update Error]' Could not backup up PEP
configuration files >&2
                exit 1
        fi
fi

I'd trim off everything after the first space and test for that single
file.  However, it doesn't work.  ${FILES%% *} expands to include all
the file names.  On the other hand, the version below works!


FILES=$(echo /etc/config/iptables*)
if [ -f ${FILES%% *} ];then
        cp /etc/config/iptables* /etc/config/PEPBackup/ 2>/dev/null
        if [ $? -ne 0 ]; then
                echo '[PEP Update Error]' Could not backup up PEP
configuration files >&2
                exit 1
        fi
fi

Any ideas why the latter one works fine but the other does not? Just
curious - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

If you would like to participate in the development of an open source
enterprise class network security management system, please visit
http://iscs.sourceforge.net


