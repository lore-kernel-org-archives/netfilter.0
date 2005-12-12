From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: Very wierd problem
Date: Mon, 12 Dec 2005 10:28:24 -0500
Message-ID: <FAC4E024BF776842876169173CE2F01313B4AC@mailbox.vikus.com>
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
To: Svenne Krap <svenne@krap.dk>, netfilter@lists.netfilter.org

Inline.

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of=20
> Svenne Krap
> Sent: Saturday, December 10, 2005 8:23 AM
> To: netfilter@lists.netfilter.org
> Subject: Very wierd problem
>=20
> Hi.
>=20
> I have quite a problem.
>=20
> One of my customer is suddently unable to upload data to his=20
> machine (neither via SFTP/SCP nor regular FTP nor HTTP)=20
> behind my firewall. I believe it is due to something changed=20
> on the network he is connected to (as I have not changed=20
> anything during that period). He has no problems downloading=20
> data, but when uploading the upload stalls after 4kb of transfer.
> What is even worse, I cannot recreate the problem from=20
> anywhere I have tried (>5 different ISP's).

I interpret this to mean that the problem is with a particular customer
on a particular ISP - your other customers can upload just fine. The
fact that data can be downloaded (but not uploaded) is very strange.

[snip]

> This has worked flawlessy for half a year or so. But=20
> suddently it stop working.
> The customer's upstream provider blames my firewall. An=20
> interesting point is that the customer CAN upload to the=20
> firewall itself by scp through it's /29 adress (it has no /26).
> But as said, I have not changed anything in the way the=20
> firewall works around when the problem arose, and any attempt=20
> to recreate it has been a failure.

Of course they blame your firewall. Did they give a reason? I assume
when you attempt to recreate the problem you are uploading to the
customer's server on your network and it works fine, and that your other
customers are not having problems with similar rulesets.

If you haven't changed anything, I would recommend not messing with your
firewall. My first urge when there is a problem is to check everything
and start changing things which "don't look right". However if there is
a system which is the same now as it was when things were working then I
stifle that urge and look elsewhere. Maybe there's something with the
client's internal server or settings on the VLAN switch... Verify your
settings but don't go changing them without a good reason. If you do
find something odd change one thing at a time and then test - otherwise
you'll never know exactly what the problem was.

> I have tried to log packets both in the filter tables and the=20
> prerouting chain of the nat filter (before doing the nat).=20
> But nothing really catches my eyes.
>=20
> Any suggestions to what could be the problem ? Or how I could=20
> zero in on it ? What to log and so on?
>=20
> I am not really keen on publishing the firewall script, but I=20
> will send it to helpful individuals by email on request.
>=20
> Thanks in advance
>=20
> Svenne
>=20

I would set up ethereal on your firewall and monitor both sides of a
transfer from this client. See who sends the last packet before the
connection is dropped. Since this problem appears to be protocol
independent, I would pay close attention to the TCP connections, but I
would also be curious about HTTP and FTP since they are cleartext and
may have some additional information about what might be going on
(timeouts, etc.).

Derick Anderson

