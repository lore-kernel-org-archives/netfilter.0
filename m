From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: Firewall Issues
Date: Sun, 2 Sep 2007 09:05:34 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE5829024F4D0@pxtbenexd01.pxt.primeexalia.com>
References: <F354ED761879468F86DCB19505DD6DB5@mikePC>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <F354ED761879468F86DCB19505DD6DB5@mikePC>
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
To: Mike <catchall@stengele.biz>, netfilter@lists.netfilter.org

Mike,=20

You may also need to put an entry on the output in the NAT table as
well.  Here is what I have had to do in the past, to make things work.
Please note that many people noted that this isn't necessary, and
recommend using split DNS instead.  But for some of the small officers I
have setup, split DNS really wasn't an option.

Here is a sample.

-A PREROUTING -d 216.x.x.x -j DNAT --to-destination 10.94.17.2=20
-A POSTROUTING -s 10.94.17.2 -o eth0 -j SNAT --to-source 216.x.x.x=20
# We had to add this to it so people on the local subnet would be able=20
# to see the servers as if they are external. =20
-A POSTROUTING -s 10.94.17.0/255.255.255.0 -d 10.94.17.2 -o eth0 -j SNAT
--to-source 216.x.x.x=20
-A POSTROUTING -o eth0 -p ! ipv6-crypt -j SNAT --to-source 216.x.x.x

Now, in your case, the 192.168 if on a different 172.24 range, so it
should have worked for you to begin with but you might need to do
something like we've done above.

HTH,=20

Gary

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Mike
> Sent: Tuesday, August 21, 2007 5:05 AM
> To: netfilter@lists.netfilter.org
> Subject: Firewall Issues
>=20
> Hi all,
> I have an issue with my linux iptables firewall and cannot figure out
> what
> to do.
> I will make this as short and sweet as I can.
> My Network is setup as follows:
> Static IP: 24.106.xxx.xx
> Firewall IP ETH1:(Static points to this) 172.24.xxx.xx
> All my servers are ETH0: 192.168.0.xx
> I have 2 game servers, 1 mail server and a web server.
> My problem is I cannot see my websites, or join game servers unless I
> put
> this firewall rule in: iptables -A PREROUTING -d 24.xxx.xxx.xx -i eth0
> -j
> DNAT --to-destination 192.xxx.x.35 (192.xxx.x.35 being my web server
IP
> Address)
> With this rule I can from the inside of my network go to my website
via
> www.xxx.com but cannot join any of my game servers unless I chnage the
> above
> rule to the game server IP.
>=20
> Can anyone help me on this?
>=20
> Thanks in advance,
> Mike
>=20


