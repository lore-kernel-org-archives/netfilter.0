From: "Mark C. Casey" <markcc@jadepress.co.uk>
Subject: MIRROR.. would this work?
Date: Mon, 12 Jul 2004 16:34:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <627ED3D5182532448B61510FFAB3D37F10A94F@srvdc01.jade.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

Would the following work in trying to access 172.16.0.1 but seeing the =
address of 123.123.123.123. (say 123.123.123.123 is an external address =
and when 172.16.0.1 tries accessing 123.123.123.123 it accesses itself? =
it's a long story, I just need to be able to access 172.16.0.1 from =
172.16.0.1 but using the external address of 123.123.123.123 from =
172.16.0.1)

iptables -A FORWARD -p tcp -s 172.16.0.1/32 -d 123.123.123.123/32 -j =
MIRROR

Thanks

Mark

