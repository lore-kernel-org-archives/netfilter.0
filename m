From: "Peter Marshall" <peter.marshall@caris.com>
Subject: transfer speed through firewall
Date: Tue, 23 Nov 2004 11:33:29 -0400
Message-ID: <0ee701c4d171$c8a5b870$49caa8c0@caris.priv>
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
To: netfilter <netfilter@lists.netfilter.org>

I posted about this yesterday and J gave some very helpful suggestions to
try ...(thank you by the way).  But I have still not getten any better
results.  Since then, I have changed some switches, put in brand new
Ethernet cables, and still no difference.  I can transfer data between boxes
in my DMZ extremely fast.  (3 seconds for a 40 MB file using ftp).  However,
when I try to transfer that same file from a box on my interior network to a
box in my DMZ (so it goes to a switch, then to the firewall, then to another
switch, and then to the box) it takes approx. 40 seconds.  I am 99%
confident that it is not the switches or network cables.  All cards and
switches along the way are 100 MB.

Does anyone know of problems with netfilter with slowing down transfers ?
The box is an 850 with 512 MB of ram.  It has 3 nic cards, and 5 interfaces
(2 virtual) + the loopback.  Data from my internal network to the DMZ always
goes in one interface and then out a different.  I did a netstat -ni as
suggested, but found no errors.

Again, thank you for any information that can be provided.

Peter


