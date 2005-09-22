From: "Harrison, Bruce (CXO)" <Bruce.Harrison@hp.com>
Subject: RE: raw packet capture based on offset
Date: Thu, 22 Sep 2005 09:56:27 -0600
Message-ID: <2F75680A268354469586578F0712182AD60437@CXOEXC12.AMERICAS.CPQCORP.NET>
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
To: colorchip@sify.com, netfilter@lists.netfilter.org


Do you want to do packet capture or packet filtering?  For packet
capture, have a look at tcpdump.  I know it can capture based on source
and/or destination Ethernet address.  Not sure if it can capture on the
other field that you are looking for.

Take care,

Bruce...

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of
colorchip@sify.com
Sent: Wednesday, September 21, 2005 9:29 PM
To: netfilter@lists.netfilter.org
Subject: raw packet capture based on offset

Hi,

I want to capture raw packets based on the ethernet source (mac) and a
16 bit identifier following the ethtype. I am unable to find a generic
filter which gives me a freedom to filter the packet based on any bit
length and offset from the beginning of the packet. Can anyone help?

-nks

