From: "Rob" <rwideman@austin.rr.com>
Subject: having issues with kernel 2.4.18 and iptables 1.2.6a
Date: Tue, 9 Jul 2002 21:52:45 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <NEENJAPFEAIEMGMNIGFLOEEOCBAA.rwideman@austin.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.samba.org

I am trying to install 2.4.18 and 1.2.6a on an NEC VP75 (proc swapped upto
p100mhz)with 40mb ram, commandline, on MDK 8.2 fresh install with updated
packages...  I ran the following and got the error below:
-----
# make pending-patches KERNEL_DIR=/usr/src/linux/
Making dependencies: please wait...
Something wrong... deleting dependencies.
make: *** [/usr/src/linux/include/linux/autoconf.h] Error 1
-----
Anyone have a thought on this? I dont find anything on google or the list
about this error.  I do find alot of install/compile issues with 2.4.18 all
over.  I have tried this 2 times after deleting the directories and
recreating them, fresh tar xvf...


Rob


