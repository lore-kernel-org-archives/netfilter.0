From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Question about REJECT in FORWARD rule
Date: Wed, 11 Aug 2004 11:44:59 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC905126C@asimail2.alphanumeric.com>
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

> What I'd like to do is something like :
> $IPTABLES -A FORWARD -i $LAN_IFACE -p tcp --dport 445 --dst =
sql.se.rv.er -j
> REJECT --reject-with tcp-reset
>
> My problem :
> Packet seems OK (iptables change source ip and port) and is
> TCP RST, but it is sent to the external interface, and my LAN
> hosts do not get the reply and must wait for a timeout to occur
> (since another firewall protects the SQL Server and drops TCP 445)
>
> Is there any way to force an interface for the REJECT rule ?
>
> Is there any configuration that could cause this to happen ?

there is something wrong with your configuration.  post the output of =
"iptables -vnL; iptables -vnL -t nat; iptables -vnL -t mangle" and clue =
us in as to which interface is inside, outside, dmz, etc...

-j

