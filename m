From: "Gary W. Smith" <gary@primeexalia.com>
Subject: Dynamic chain alternatives
Date: Sun, 19 Nov 2006 17:23:53 -0800
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE5829024ED10@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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

I have a need to create a dynamic table in that will have random IP's
inserted and deleted on a regular basis.  Currently we do this by
creating a chain at load time and on a scheduled basis we flush that
chain and then to a iptables-restore -n < dynamic_rules.txt. =20

Is there a better approach to doing this?

Gary Wayne Smith


