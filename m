From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: Question regarding packet src/dst rewriting
Date: Sat, 21 Aug 2004 11:10:35 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <32820.207.236.167.130.1093101035.squirrel@207.236.167.130>
References: <4126279F.7040109@closednetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4126279F.7040109@closednetworks.com>
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
To: Russell Handorf <rhandorf@closednetworks.com>
Cc: netfilter@lists.netfilter.org

On Fri, August 20, 2004 12:32 pm, Russell Handorf said:
> The weird behavior I am having is that whenever a packet from the
> Internet comes in interface eth0, and gets forwarded to a server on
> eth1, the server which resides on the eth1 side of the network sees the
> source IP as coming from the router and not the real host on the
> Internet. Vice versa applies as well (a node behind eth1 sends a packet
> out to, say, google.com. Google.com sees the data as coming from the
> router, and not the node which is behind eth1).
>

My assumption is that you are using a MASQUERADE rule regardless of the
outgoing device.

> I dont understand why the packet headers are being re-written. I also
> dont understand if this is a specific problem with iptables, or the
> linux kernel itself.
>
> eth2 and eth3 are masquerading, but eth1 is not.
>

Okay, so you are using 2 MASQUERADE rules with specific outgoing device ?
Please post your ruleset. PREROUTING and POSTROUTING chains should be eno=
ugh.



