From: Alaios <alaios@yahoo.com>
Subject: how to change the tos
Date: Tue, 8 Feb 2005 04:46:23 -0800 (PST)
Message-ID: <20050208124623.60439.qmail@web54701.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Hi i want to apply the patch ftos in order to change
the tos field in ip packets...
The problem is that i don't know how to do that
One guy suggest me the
http://www.paksecured.com/patches/
but the patch is for the 2.4 kernel  but i use the
2.6.10 kernel.
In addition to this i have noticed that the 2.6 kernel
has the following option
CONFIG_IP_NF_MATCH_TOS
I don't know if i need to compile it as module or i
should insert them directly to the kernel...
Afte recompiling the kernel i have run the make
KERNEL_DIR=3D/usr/src/linux-2.6.10 but still the command

iptables -t mangle -A PREROUTING -i eth0 -p tcp
--dport 22 -j TOS --set-tos 15
iptables v1.2.11: Bad TOS Value
Any suggestion?




	=09
__________________________________=20
Do you Yahoo!?=20
All your favorites on one personal page =96 Try My Yahoo!
http://my.yahoo.com=20

