From: "Luke Hinds" <luke.hinds@neuvoice.com>
Subject: The correct use of scripts
Date: Thu, 4 Sep 2003 12:01:07 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <50D72569B3D8DD468A233F2AFCDE3BEC2341BC@london.plymouth.neuvoice.com>
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

Hi All,

I am fairly new to netfilter. Hopefully you do not mind me asking a =
couple of questions.

I can't quite get the full picture around the different locations of =
iptables scripts.

On my machine for instance i have.

/etc/sysconfig/iptables

/etc/init.d/iptables

/etc/rc.d/init.d/iptables

Now i know that the /sysconfig file is configured by the service command =
i.e service iptables save

But how about the other two? And if i wanted to add a script that =
complimented the /sysconfig rules i have already saved where would i put =
it?

Thanks for your time and patience.

Luke

