From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: RE: capture arp in hook and queue to userspace
Date: Wed, 25 Aug 2004 17:17:40 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1093447059.2246.45.camel@anduril.intranet.cartel-securite.net>
References: <2E314DE03538984BA5634F12115B3A4E62EABD@email1.mitretek.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <2E314DE03538984BA5634F12115B3A4E62EABD@email1.mitretek.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Le mer 25/08/2004 =E0 17:09, Piszcz, Justin Michael a =E9crit :
> Doesn't etables handle ARP packets?

Yes it does.

Another approach could be to implement a QUEUE target for arptables
framework.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

