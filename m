From: "=?iso-8859-1?Q?Geffrey_Vel=E1squez?=" <g_netfilter@netfids.com>
Subject: iptables and netfilter dependencies
Date: Tue, 28 Oct 2003 11:58:38 -0500 (PET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40612.200.48.142.49.1067360318.squirrel@www.netfids.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi friends, a basic question:

The user space tool (iptables) is dependent of the kernel that is compiled
for?
I had build kernel 2.4.22 with patch-o-matic-20030912 and iptables 1.2.9rc1,
appears to work well, but when I use iptables with the default kernel that
comes with RH9 it do not works SNAT and DNAT commands.


Regards,
Geffrey



