From: nikita <admin@getsense.net>
Subject: from iptable user
Date: Mon, 17 Feb 2003 19:09:23 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302171909.23866.admin@getsense.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

Hello,
My name is Nikita
I have made the following command

iptable -A FORWARD -m mac -mac-source 00:C0:DF:10:4D:99 -j REJECT

and=20

i have been answered the following


Couldn't load match ac-source:
/lib/iptables/libipt_ac-source.so ....

Please,
What shell i do in that case?

