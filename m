From: "Don Woodruff" <donw@minglewood.net>
Subject: RE: exempt some source addresses from nat??
Date: Thu, 7 Nov 2002 12:11:06 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6BED17A9718E204F812CBBAF3B102E2A01C0E3@babylon.metropolis.minglewood.net>
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
To: Yogini Parkhi <yparkhi@bivio.net>, netfilter@lists.netfilter.org

As far as I know, you don't. Usually SNAT is applied to packets heading
out an interface. The decision to send the packets out that interface is
actually a routing decision, not a NAT or Firewall, but despair not!!!

You need to use the iproute2 package and create a few entries using "ip
rule". If you want to email me a rough idea of what you want, I can
probably give you a script that will suffice. I am not an expert, but I
did manage to get a far more complex set of routing rules installed on
my firewall - works GREAT!!!!  The wonderful thing is how low the
overhead is on the durn thing. (The not so wonderful thing is the
documentation for iproute2 ;-)

Don

-----Original Message-----
From: Yogini Parkhi [mailto:yparkhi@bivio.net]=20
Sent: Wednesday, November 06, 2002 7:59 PM
To: netfilter@lists.netfilter.org
Subject: exempt some source addresses from nat??

Hi All,

Just curious, if I have a nat rule that snats a certain network. How do
I exempt certain addresses from this nat rule?=20
Do I write ACCEPT rules in the POSTRUTING chain for those?

Thanks,
Yogini

