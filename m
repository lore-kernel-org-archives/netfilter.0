From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Questions about the workings of iptables
Date: Mon, 26 Jul 2004 09:43:15 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90511F4@asimail2.alphanumeric.com>
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
To: "Small, Jim" <jim.small@eds.com>, netfilter@lists.netfilter.org

> 1)  How extensive is IPTables stateful packet filtering?  Especially =
with
> TCP and the recent reset paranoia
> (http://www.uniras.gov.uk/vuls/2004/236929/index.htm), what is checked =
for
> stateful TCP inspection?  Are the sequence numbers carefully =
scrutinized as
> part of the state check?  For an excellent paper on TCP state =
checking, I
> like the following:
> http://home.iae.nl/users/guido/papers/tcp_filtering.ps.gz.ps.gz

the "tcp-window-tracking patch" available in patch-o-matic is based upon =
the paper by Guido van Rooij that you reference.

-j

