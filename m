From: Dworf <root@dworf.com>
Subject: on high load the connections drop
Date: Tue, 1 Oct 2002 14:50:02 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210011450.02766.root@dworf.com>
Reply-To: root@dworf.com
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

Dear all,

In high loads (when iptables DROP packets couse of Syn Flood I get `kerne=
l:=20
eth0: Too much work in interrupt, status e401.`  message and the connecti=
ons=20
drop after about 20mins of constant attack. I think it could be the buffe=
r=20
filling up or somthing? Is there any patch for iptables to flush the buff=
er=20
or somthing? or a patch for high loads?

Thank you!

David

