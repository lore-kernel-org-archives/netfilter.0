From: "Paul Albert" <palbert@rovingplanet.com>
Subject: RE: Ip handling
Date: Wed, 18 Jun 2003 11:09:44 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <661F9268BBA8CB4EB92CC12B8C42F06912EAE7@pluto.rovingplanet.com>
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
To: mick <mick@mohawkplastics.com>, netfilter@lists.netfilter.org

It looks like you would like to do source NAT on the incoming packets.
There is a good tutorial online:

http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO.html

Paul

-----Original Message-----
From: mick [mailto:mick@mohawkplastics.com]=20
Sent: Wednesday, June 18, 2003 10:54 AM
To: netfilter@lists.netfilter.org
Subject: Ip handling


I have a delema and i'm not sure how to handle it.=20
I run a login server on port 5999 that does authentication based on IP
address. So when someone with a dynamic internet connection tries to
login with a differnt IP then the registered one, The login server
rejects them. I am not good enough with Iptables to know if it is
possible or not but is there some way to make it so all connections to
that PORT(5999) appear to come from my Local network 192.168.0

The other method i thought about was running my authentication/login
server on another machien behind the firewall. but i think i would have
to make all packets coming from the inter net to that port appear to
come from the local network prior to forwarding them to the Other
server. both of which i am unsure how to accomplish.=20

The Authentication server is a binary that is not linux/unix nativly so
at this time i can not recode it and remove the IP matching function.
Any help with this problem is greatly appreciated. Mick


Does anyone know of a way to make say all connections from the outside
going to my outside IP address Appear to be coming from my local lan of
192.168.0.1 =20








