From: "Mark C. Casey" <markcc@jadepress.co.uk>
Subject: RE: Redirecting from one ip to another problem
Date: Fri, 25 Jun 2004 11:16:09 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <627ED3D5182532448B61510FFAB3D37F1D328C@srvdc01.jade.local>
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

Oh, another question.

Is it possible to point an external ip address that we have to an =
internal machine so when said machine tries accessing the external ip =
address it simply accesses itself?

For example, say externally (on the internet) I have an ip address of =
62.39.23.52.
If 172.16.0.1 tries accessing 62.39.23.52 it simply points to 172.16.0.1 =
instead? (so, say I tried pinging or ftp'ing to 62.39.23.52 it would be =
accessing 172.16.0.1 from 172.16.0.1)

Thanks

Mark

<snip>

