From: "Chip Shabazian" <chip@shabazian.com>
Subject: QOS/TC
Date: Fri, 4 Jul 2003 15:08:23 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BA12368A8F510340A0CD3D5A7D42A37C04739F@mail.zeus.shabazian.com>
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

I'm hoping to get some help regarding bandwidth restriction.  Basically,
I have a system that is functioning as a router/firewall at a colo site.
It's got 10 ethernet interfaces in it so that I could give each person
their own subnet.  I'm fine with the routing and firewalling, but I want
to be able to restrict certain people to various levels of throughput
since I have to pay when we go over our 1Mb cap.  From what I've been
able to determine, I need to use tc to setup qdisc's, but I have not
been able to find any good references either online or in print that
will explain clearly to someone who doesn't understand these tools how
to setup these queues.  I will probably put something together for
reference if anyone can help me understand these tools.

=20

What would be really nice, is if someone could give me the commands to
setup these queues, and explain what each item in the command is.  I
realize this is a lot of work, but I'll gladly take any help I can get,
and give back to the community what I am able to come up with.

=20

If this is NOT the right list for this question, please don't send
flames my way.  A pointer to where I should go would be appreciated.

=20

Thanks,

=20

Chip


