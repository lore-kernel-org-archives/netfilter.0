From: Scott MacKay <scottmackay@yahoo.com>
Subject: Packet Mangling, conn_tracking
Date: Tue, 1 Apr 2003 05:02:01 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030401130201.27234.qmail@web13908.mail.yahoo.com>
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

Hiyas,
I am interested in performing some packet mangling,
preferably in a Userspace QUEUE.  My general goal is
to obfuscate packet contents (IP payload and below)
'on the wire' between 2 hosts which both have the
QUEUE application, so:

HostA
  |    (Normal packet)
FW Router
  |
  |    (Mangled packet)
  |
FW Router
  |    (Normal packet)
HostB

Since I want to mangle the IP payload (including
tcp/udp header), I was curious about where I could do
it so that it was demangled before I do filtering
rules and before any connection tracking was
performed.
If I establish a QUEUE for the mangle PREROUTING and
de-mangle an incoming packet, will that make the
contents of the unmangled packet available for INPUT
and connection tracking?

-Scott 

__________________________________________________
Do you Yahoo!?
Yahoo! Tax Center - File online, calculators, forms, and more
http://platinum.yahoo.com

