From: =?iso-8859-1?Q?=D6rjan?= Persson <orange@fobie.net>
Subject: TCP redirect external to external host
Date: Tue, 9 Dec 2003 20:04:02 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031209190402.GA16255@fobie.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hello,

I would like to redirect incoming traffic on host1:33 to host2:44!

Tried to find information about this for a day now but all I come up
with is the DNAT/SNAT solution. The problem with this is when the final
packet arrives at the host2 it thinks that host1 sends them.=20

Is there a way to keep the senders IP?

Thanks in advance,
=D6rjan

