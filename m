From: "Rodre Ghorashi-Zadeh" <rodrico7@hotmail.com>
Subject: ip_conntrack and ipt_conntrack
Date: Fri, 23 Jan 2004 18:14:41 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY10-F46m2m2XkO28Q0000cf3b@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

On Friday 23 January 2004 2:22 am, Rodre Ghorashi-Zadeh wrote:

>Hello,
>
>I was hoping that someone could tell me the difference between these two
>modules and what they are each used for. Thanks in advance.

ip_conntrack does connection tracking for various protocols, placing entries
in the conntrack table and recognising "related" packets etc.

ipt_conntrack is the connection tracking state match, which allows you to
write rules matching the state of a connection, eg:

iptables -I FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

Regards,

Antony.

--
Anything that improbable is effectively impossible.

- Murray Gell-Mann, Novel Prizewinner in Physics

                                                     Please reply to the=20
list;
                                                           please don't CC =

me.


Hello Anthony,

Thanks for your response.

If ipt_conntrack does the state matching then what does the ipt_state modul=
e=20
do? All of the rules I have for my firewalls track state, so the ipt_state =

module gets loaded automatically with the firewall startup script, but=20
ipt_conntrack doesn't, I would have to load it manually if I needed it (or =

write rules that use it perhaps?). As far as I can tell the state matching =

is working on my firewall. I really need to get to the bottom of this so I =

can rule it out on my=20
https://lists.netfilter.org/pipermail/netfilter/2004-January/050005.html=20
problem. Also is the source file for the ip_conntrack module named=20
ip_conntrack_core.c? Thanks again for all your help.

=AEodre

_________________________________________________________________
Add photos to your messages with MSN 8. Get 2 months FREE*. =20
http://join.msn.com/?page=3Ddept/features&pgmarket=3Den-ca&RU=3Dhttp%3a%2f%=
2fjoin.msn.com%2f%3fpage%3dmisc%2fspecialoffers%26pgmarket%3den-ca


