From: eribicic@sinectis.com <kisero@uolsinectis.com.ar>
Subject: imq compilation
Date: Sat, 19 Jul 2003 15:16:34 -0300 (GMT+3)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030719181634.932006C5B8@honorio.sinectis.com.ar>
Reply-To: kisero@uolsinectis.com.ar
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Hello, i cant get the -j IMQ of iptables work.

I applyed this patch (http://trash.net/~kaber/imq/linux-2.4.21-imq-1.diff) to my 2.4.21 kernel and this patch (http://trash.net/~kaber/imq/pom-20030625.diff) to my pom 20030107. I did the chmod +x the the imq files on POM. 

After applyed i added the netfilter module for IMQ and the networking debice IMQ. Compiled ok the kernel, reboted. The imq device can be created..the htb etc too..but when i try to do the:

tino:/wk/htb# iptables -t mangle -A PREROUTING -i ppp0 -j IMQ
iptables v1.2.8: Couldn't load target `IMQ':/usr/local/lib/iptables/libipt_IMQ.so: cannot open shared object file: No such file or directory

I tryed recompiling iptables 1.2.8, when doing make i see al the extra modules i added (string, time, mport, etc) but not the imq one.

What could be happen here?
-- 
Slds.

