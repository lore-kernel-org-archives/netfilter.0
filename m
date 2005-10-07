From: "Fiala Daniel" <d.fiala@el-me.de>
Subject: Reverse MASQUERADING
Date: Fri, 7 Oct 2005 12:19:12 +0200
Message-ID: <E0401B10F7BAC5469FE5ACE7B93387640192E1@exchange05.elmedmn.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello *.

I want to set up a reverse MASQUERADING on a local box connecting
to 2 or more identical networks. Each network has the ip=20
192.168.1.0/24 and a target host with the IP 192.168.1.123 in it.=20
I now want to setup a NAT so that each device appears to be a new
Network:

Host box behind eth0 (192.168.1.124) -> accessible/pingable by
192.168.2.124=20
Host box behind eth1 (192.168.1.124) -> accessible/pingable by
192.168.3.124
...

Is this kind of mapping possible with NAT?

Best Regards,

Daniel
--=20
Daniel Fiala

EL-ME AG
Gewerbering 1

D-84072 Au i. d. Hallertau

Tel.: +49/8752/864-0
Fax.: +49/8752/864-100

