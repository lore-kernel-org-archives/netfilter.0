From: "Muhammad Talha" <talha@worldcall.net.pk>
Subject: kernel 2.6.x and iptables
Date: Tue, 13 Jan 2004 14:22:45 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00cb01c3d9b6$cd9b2d00$23c051cb@ns3.worldcall.net.pk>
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
To: netfilter@lists.netfilter.org

Dear all

i have upgraded kernel 2.4.20 to kernel 2.6.1 and i have same problem with
2.6.0 kernel as well
OS Redhat
module-init-tools 0.9.13

but i am iptables stop working its was iptables-1.2.7
then i upgraded to iptables to 1.2.9 ( lastest ) still same problem

error message i get

iptables v1.2.9:can't initialize iptables table 'filter' iptables who? (do
you need to insmod)
Perhaps iptables or kernel needs to be upgraded.

i aslo get these kind of errors when compiling iptables-1.2.9

/usr/src/linux-2.6.1/include/linux/compiler-gcc3.h:22:1 warning
""__attribute_pure__" redefined
In file included from  /usr/include/feature.h:291
                       from  /usr/include/stdio.h:28
                       from extensions/libipt_conntrack.c:5
/usr/include/sys/cdefs.h:183 warning this the location of the prevoius
definiation


###########################################

Plz help me urgently

THANKS AND Regards

TALHA



