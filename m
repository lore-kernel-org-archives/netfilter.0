From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: multiple destinations
Date: Tue, 17 Aug 2004 15:12:06 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC9051299@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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

> iptables -t nat -A PROSROUTING -p tcp --dport 80 -d ! 192.168.0.1 =
(and)
> ! 192.168.0.50 (and) ! xxx.xxx.xxx.xxx -j REDIRECT 3128
>
> I need more than one destination ... may be ussing my own new =
chains????
>
>
> Thanks in advance

you can use ACCEPT, or your own chain (which would use ACCEPT):

iptables -t nat -A PREROUTING -p tcp -d 192.168.0.1 --dport 80 -j ACCEPT
iptables -t nat -A PREROUTING -p tcp -d 192.168.0.50 --dport 80 -j =
ACCEPT
iptables -t nat -A PREROUTING -p tcp -d xxx.xxx.xxx.xxx --dport 80 -j =
ACCEPT
[ ... ]
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port =
3128

-j





