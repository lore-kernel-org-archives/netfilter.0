From: =?iso-8859-2?B?SvpsaXVzIEJlbbk=?= <julius.bems@gmail.com>
Subject: NAT preformance and table processing
Date: Thu, 9 Aug 2007 19:33:56 +0200
Message-ID: <46bb504e.17945e0a.3908.122f@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:from:to:subject:date:mime-version:content-type:content-transfer-encoding:x-mailer:thread-index:content-language:x-cr-hashedpuzzle:x-cr-puzzleid:message-id;
	b=iU5lcarjKAdJyeAFAo2ihjCSkRKHijQ4uO1IYO/09OOYi5NEco0eY60vdNKoOhp6M5jiGKshAlPV8GMifNdut9A3ETUTg6SZwCHRXmAuvlyEXicFz4+Lkmxce/yix09ZJO//61cd9eLt3fl7QJxJizlaxUL+MmA0Siyscxacbiw=
Content-Language: sk
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi,

I=A0wrote some performance tests of NAT table. The main idea is, that =
I=A0add
10000 random+senseless rules to the NAT table (snat, postrouting) and =
then
I=A0add some rule to specific position which will stop traversing of NAT
table. I=A0use UDP packets.=20

When I=A0insert my reasonable rule to position 2000 and =A0run my test, =
it shows
delay of packets cca 300ms. But when I=A0run it more times, this delay =
is 2ms.
I=A0don't understand why, because I=A0use UDP(connectionless) - so =
I=A0think, that
netfilter must process each packet and find appropriate rule. Is this =
true?
Or does netfilter do some optimalization? Because this behavior is =
expected
in TCP, but not UDP.

Thanks for replies



