From: "Michael Frank" <mhf@linuxmail.org>
Subject: Possible to block ports by user group?
Date: Sun, 04 Jul 2004 21:16:19 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <opsal65hoe4evsfm@smtp.pacific.net.th>
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
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: netfilter@lists.netfilter.org

Would like to block ports depending on the group in use

For example:

group "browser" can only access port tcp 8118 so it _must_ talk through p=
rivoxy

group "wget" can access ports tcp 21 and 80

group "trusted" can access all ports

Searched and googled but could not find anything.

How can this be done?

	Michael

