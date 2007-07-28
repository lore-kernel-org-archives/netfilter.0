From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: filtering in mangle table
Date: Sat, 28 Jul 2007 12:24:23 +0200
Message-ID: <46AB1957.6020607@plouf.fr.eu.org>
References: <dae53550707270302r6887a6a4g3c9ddfd7d070afab@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <dae53550707270302r6887a6a4g3c9ddfd7d070afab@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Ganesan Natarajan a =E9crit :
>        My requirement is before giving the packets to user space
> application(even before routing) I need to filter the packets.

Why even before routing ? (Yes, I'm curious)

> so I am using the the mangle table with PREROUTING chain to filter as
> well as to queue the packets using the DROP, QUEUE targets of
> "iptables". But in man pages it is specified that the filter rules
> should not be added into mangle table.

Built-in targets such as DROP and QUEUE can be used in any table and=20
chain. But target extensions may have limitations. For exemple the=20
REJECT target can be used only in the filter table, so it cannot be used=20
in the mangle table. Also, filtering in the nat table is not recommended=20
because the nat table does not see all packets but only packets in the=20
NEW state which are the first packet of a connection.

