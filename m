From: fgentili@ialeware.it
Subject: pom-2003-09-12 and kernel 2.4.22
Date: Tue, 21 Oct 2003 13:39:24 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF43231202.37435874-ONC1256DC6.003F631F-C1256DC6.00400866@tomware.it>
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

Hi to all,
After applied pom-2003-09-12  to a 2.4.22 kernel I could not be able to
setup rules  like :

iptable -t nat - A POSTROUTING -o eth3 -j SNAT etc ...

I obteined an error which points " --oif not defined" or similar .....
This error occute only working on nat TABLE

I tried to do a simple "run pending" but the error persist ....

it was  not a problem on kernel source because I work perfeclty with kernel
2.4.22

Did anyone had the same problem ???

Thank you very Much



