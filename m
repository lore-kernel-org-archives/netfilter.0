From: "Kevin L. Collins" <kcollins@qx.net>
Subject: Trying to get a Subnet NATted
Date: Sun, 8 Dec 2002 13:06:57 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000d01c29ee4$9bbecca0$6401a8c0@athlon>
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
To: netfilter@lists.samba.org

I've got a strange situation where I receive data from my WAN links
across the same Interface as my External Interface.

Let me try to explain it with ACSII art....
+--------------+
|     WAN      |
|10.200.9.x/24 |
|10.200.10.x/24|
+------+-------+
       |
       |



