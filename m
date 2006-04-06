From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset command ipporthash anormal behavior
Date: Thu, 6 Apr 2006 11:54:00 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0604061146340.17700@blackhole.kfki.hu>
References: <200604041446.01536.clist@uah.es>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="110391808-587513186-1144317240=:17700"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200604041446.01536.clist@uah.es>
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
To: Clist <clist@uah.es>
Cc: netfilter@lists.netfilter.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
  Send mail to mime@docserver.cac.washington.edu for more info.

--110391808-587513186-1144317240=:17700
Content-Type: TEXT/PLAIN; charset=US-ASCII

Hi,

On Tue, 4 Apr 2006, Clist wrote:

> ipset -N clients ipporthash --from 192.168.153.206 --to 192.168.153.207
> --hashsize 1024 --probes 4 --resize 50 || echo "failure .."
>
> it prints :
>
> "failure .."
>
> But the set got created!!.
>
> This is confusing and make my script run bad, if the commnad ran sucessfully,
>
> Why it returns error code !=0 to the OS??

That's a small bug: the set specific parse function returns 1 when it
could parse the command line successfully and this return value is not
erased later, but used as the final return value of the ipset command.

There'll be a new release somewhere in this month: until then you can use
the attached patch.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
--110391808-587513186-1144317240=:17700
Content-Type: TEXT/PLAIN; charset=US-ASCII; name="ipset-create.patch"
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.58.0604061154000.17700@blackhole.kfki.hu>
Content-Description: ipset-create.patch
Content-Disposition: attachment; filename="ipset-create.patch"

ZGlmZiAtdXJOIGlwc2V0LTIuMi44L2lwc2V0LmMgaXBzZXQtMi4yLjkvaXBz
ZXQuYw0KLS0tIGlwc2V0LTIuMi44L2lwc2V0LmMJMjAwNS0xMS0yNCAxMDow
ODo1Ny4wMDAwMDAwMDAgKzAxMDANCisrKyBpcHNldC0yLjIuOS9pcHNldC5j
CTIwMDYtMDQtMDYgMTE6NTE6MjguMDAwMDAwMDAwICswMjAwDQpAQCAtMjA5
OSw3ICsyMDk5LDggQEANCiAJCQkJCWV4aXRfZXJyb3IoUEFSQU1FVEVSX1BS
T0JMRU0sDQogCQkJCQkJICAgIlVua25vd24gYXJnIGAlcyciLA0KIAkJCQkJ
CSAgIGFyZ3Zbb3B0aW5kIC0gMV0pOw0KLQ0KKwkJCQkNCisJCQkJcmVzID0g
MDsNCiAJCQl9DQogDQogCQkJRFAoIm5leHQgYXJnIik7DQo=

--110391808-587513186-1144317240=:17700--

