From: <scott@scottwahlstrom.org>
Subject: libipt_u32.c Question
Date: Mon, 5 Jun 2006 10:37:47 -0500
Message-ID: <1D15E43506A9CC4DB9D384021C57FCB0015146@server.localdomain.sec>
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



I need to add u32 match capability to my iptables.  Can anyone tell me
how?


I would like to:

iptables -I RH-Firewall-1-INPUT -p udp -m length --length 39 \
  -m u32 --u32 "27&0x8f=3D7" --u32 "31=3D0x527c4833" -j DROP


And the error returned is:

Couldn't load match litipt_u32.so: cannot open shared object file: No
such file or directory


I notice that the extensions/libipt_u32.c isn't being built into a .so
during the make from my 1.3.5 iptables src...


Thank you in advance for your time,


Scott Wahlstrom
System Administrator
scottwahlstrom.org

 =20

