From: Brent Clark <bclark@eccotours.dyndns.org>
Subject: stop uptime and name + version querying
Date: Tue, 12 Apr 2005 12:15:42 +0200
Message-ID: <425B9FCE.7050105@eccotours.dyndns.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: iptables <netfilter@lists.netfilter.org>

Hi

I would like to know if iptables is the correct tool to stop people from 
retriving data, such as what "NAME" of services I run (e.g vsFTPd) and 
other things like (Uptime 90.302 days (since Wed Jan 12 03:08:12 2005)) etc

And if so, how would you go about stoping the querys etc.

Does anyone know what service nmap talks to, to determine how long the 
box has been up and running for.
Just something I was thinking, kind regards

Brent Clark

Copy and paste below:
=====================================================

[root@ns root]# nmap -sV -P0 -O 1.2.3.4

Starting nmap 3.48 ( http://www.insecure.org/nmap/ ) at 2005-04-12 11:23 BST
Interesting ports on abc.abc.abc (1.2.3.4):
(The 1652 ports scanned but not shown below are in state: closed)
PORT      STATE SERVICE VERSION
21/tcp    open  ftp     vsFTPd
22/tcp    open  ssh     OpenSSH 3.6.1p2 (protocol 1.99)
25/tcp    open  smtp    Exim smtpd 4.50
80/tcp    open  http    Apache httpd 2.0.50 ((Fedora))
10000/tcp open  http    Webmin httpd
Device type: general purpose
Running: Linux 2.4.X|2.5.X
OS details: Linux Kernel 2.4.0 - 2.5.20
Uptime 90.302 days (since Wed Jan 12 03:08:12 2005)

Nmap run completed -- 1 IP address (1 host up) scanned in 12.841 seconds

