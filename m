From: "Steve Jones" <sjones@ftdata.com>
Subject: RE: NAT and DNS/NTP servers
Date: Sun, 2 May 2004 09:49:12 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <79C037414A4B604CA73F5222570C6DFC7EC6@e2k3.ftdata.com>
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
To: "Andrew E. Mileski" <andrewm@isoar.ca>, netfilter@lists.netfilter.org

If you didn't just make a typo in the transcription of this, you may
want to check your LAN side address.  Your LAN_NET in this is not the
subnet that your LAN_IP is on..  I wonder if this is confusing your
rules?
-Steve

-----Original Message-----

LAN is a private network:
   LAN_IFC=3Deth0
   LAN_NET=3D192.168.0/24
   LAN_IP=3D192.168.1.1

WAN is the internet:
   WAN_IFC=3Deth1
   WAN_NET=3D209.217.118.0/29
   WAN_IP=3D209.217.118.226


