From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: FTP Connection problems.
Date: Wed, 25 Aug 2004 07:48:11 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90512CA@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> ... but the connection takes a long time to terminate. If I disable =
all
> the rules, ftp connection goes directly but with iptables enabled it
> takes such 8 seconds to accomplish the annonymomus connection ( with
> data port and passive models ).
>
> What is this all about ???
>
> Regards
> Vincent

your server is trying to do a reverse DNS lookup on the IP address of =
the connecting client.  either disable reverse lookups on your FTP =
server, or allow it to resolve DNS through your firewall.

-j

