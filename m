From: afshin lamei <afshinlamei@gmail.com>
Subject: iptables permission problem in perl scripts
Date: Sun, 14 Aug 2005 12:04:30 +0430
Message-ID: <3115d56e05081400344964ebcd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Dear all,
I have a cgi script, which uses some perl scripts in which i'm running
iptables command using "system" function, like this:
myfile.pl:
......
system("iptables -F FORWARD")
......

the cgi file is owned by root/root and is run by user nobody.
myfile.pl is owned by root/root, and I've it setuid (chmod u+s
myfile.pl ; chown root:nobody myfile.pl) to be able to run iptable
commands, but it returns this error:
/////
modprobe: Can't locate module ip_tables.
iptables v1.2.11: can't initialize iptables table `nat': Permission
denied (you must be root) perhaps iptables or your kernel needs to be
upgraded.
/////
what's the solution?
thanks a lot
afshin lame

