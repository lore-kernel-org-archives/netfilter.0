From: "Krishnamoorthy (Siva) Sivakumar" <ksivakumar@packetmotion.com>
Subject: RE: Iptables rule on span traffic
Date: Thu, 26 Apr 2007 09:15:33 -0700
Message-ID: <E8AFFEFDBE97C94E9297963F0527A07B01E822AB@pmi00exf00.us.packetmotion.com>
References: <E8AFFEFDBE97C94E9297963F0527A07B01DFAED8@pmi00exf00.us.packetmotion.com>
	<E8AFFEFDBE97C94E9297963F0527A07B01DFB0EC@pmi00exf00.us.packetmotion.com>
	<462A8014.6000105@plouf.fr.eu.org>
	<E8AFFEFDBE97C94E9297963F0527A07B01DFB16F@pmi00exf00.us.packetmotion.com>
	<462C4337.1060508@rtij.nl>
	<E8AFFEFDBE97C94E9297963F0527A07B01DFB187@pmi00exf00.us.packetmotion.com>
	<016c01c78593$061fc2e0$0302a8c0@southern>
	<E8AFFEFDBE97C94E9297963F0527A07B01DFBA0D@pmi00exf00.us.packetmotion.com>
	<007301c787a6$13fdceb0$6501a8c0@southern>
	<E8AFFEFDBE97C94E9297963F0527A07B01E821F4@pmi00exf00.us.packetmotion.com>
	<be4ffce60704260256j5cd06e93o6aeb512cb5fd36a1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
In-Reply-To: <be4ffce60704260256j5cd06e93o6aeb512cb5fd36a1@mail.gmail.com>
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
To: Iceman <iceman.linux@gmail.com>
Cc: netfilter@lists.netfilter.org

I can understand the inability to send (reset) packets out of the span
interface. But what I am puzzled with is that there is no log of the
said packets either.=20

Siva
________________________________________
From: Iceman [mailto:iceman.linux@gmail.com]=20
Sent: Thursday, April 26, 2007 2:57 AM
To: Krishnamoorthy (Siva) Sivakumar
Subject: Re: Iptables rule on span traffic

IMHO sometimes, switches and other Layer2/3 network devices block sent
traffic on SPAN port; this could explain
because tcp-reset fail.

Iceman

