From: arif <djreef@yahoo.com>
Subject: identical scripts, 2 boxes, different behavior - what else should i look for?!
Date: Tue, 16 Mar 2004 11:11:01 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040316191101.41549.qmail@web10207.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

ok, after being super frustrated trying to figure out
why i can't forward ports properly, i decided to just
take the script we currently are using on the soon to
be old firewall, and load it onto the new one. It
loaded fine, but I get different behavior with the two
machines! I compared the rules line by line using
iptables -L, and theyre identical. But I do not get
forwarded to the internal hosts like I should, when I
try with the new machine! The routing tables are
identical also, and they both have the same kernel
modules loaded... the original is a 2.4.20 precompiled
redhat kernel, and the new one is 2.4.25 that i
compiled myself - could it be something i am missing
in the kernel?? or is there something else i should
check? i have  /proc/sys/net/ipv4/ip_forward set to 1
of course.. i dont know what else to look for!!!
HELP!!! :)

__________________________________
Do you Yahoo!?
Yahoo! Mail - More reliable, more storage, less spam
http://mail.yahoo.com

