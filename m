From: "Kevin Saenz" <ksaenz@citistreet.com.au>
Subject: RE: Telnet not being let through
Date: Wed, 18 Sep 2002 14:46:35 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <771DD65729F96D41B132C6189EE644552FE7CD@sydexch1.cs_au.com.au>
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
To: Chris Born <ragable@attbi.com>, netfilter@lists.netfilter.org

To block IP Spoofing there is /proc setting that you need to do.

Also to minimise spoofing what I do is

iptables -A INPUT -s 10.0.0.0/16 -i eth1 -d 203.x.y.z/29 -o eth0 -j =
gooddmz
iptables -A INPUT -s 203.x.y.z/29 -i eth0 -d 10.0.0.0/16 -0 eth1 -j =
dmzgood
iptables -A INPUT -s 0/0 -i ppp0 -d 10.0.0.0/16 -o eth1 -j badgood
iptables -A INPUT -s 10.0.0.0/16 -o eth1 -d 0/0 -o ppp0 -j goodbad

then I apply rules to each chain I have made.
But what the first line is saying is if the source is 10.0.0.0/16 =
address and it enters the firewall via eth1 and the packet is destend =
for the 203 network and out via eth0 then jump down to gooddmz
This might have some advantage doing this when a packet comes in from =
ppp0 and they say they are from the 10.0.0.0/16 network these will not =
be accepted if you have the default policy =3D drop. Because there is no =
input rule for it.


Kevin



-----Original Message-----
From: Chris Born [mailto:ragable@attbi.com]
Sent: Wednesday, September 18, 2002 2:27 PM
To: Kevin Saenz; netfilter@lists.netfilter.org
Subject: RE: Telnet not being let through


Thanks, that fixed the problem. I assumed that the rule would only block =
IP=20
spoofing, as the place I got the rule from indicated so. Seemed logical =
to=20
me and not quite sure how a TCP telnet packet would get matched up to =
that one.

/sbin/iptables -A INPUT -i eth1 -s 192.168.0.0/24 -d 0.0.0.0/0 -j=20
drop-and-log-it

-Chris Born

At 02:07 PM 9/18/2002 +1000, you wrote:
>I think your problem is that you drop-and-log-it
>before accepting anything substantial. IPTables works
>top down unless your forward to other rules.
>Basically what happens is if the rules don't apply to
>the rules before drop-and-log-it then they are getting logged.
>Usually your very last rule should be drop and log.
>
>Have you tired the Iptables tutorial by Oskar Andersen?
>His examples are very good.



