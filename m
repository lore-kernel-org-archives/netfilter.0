From: "zze-Proxy_Corveller ball001 exterieur FTRD" <proxycorveller.ball001@rd.francetelecom.com>
Subject: Problem with NAT table
Date: Thu, 24 Apr 2003 18:52:26 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <8C19E3FBB6467846AFF97E366D34CB6055A01F@lanmhs20.rd.francetelecom.fr>
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

Hi,

I'm trying to catch packets coming from VLANs (by using vconfig) at =
PREROUTING.=20
The mangle table sees VALNs packets but not the NAT table.=20

I've tried different targets such as the incoming interface or the =
destination address,=20
at each time the mangle table see packets but not the NAT table.

Is it normal ?

