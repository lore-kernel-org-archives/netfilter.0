From: Thierry ITTY <thierry.itty@besancon.org>
Subject: what about IIOP
Date: Wed, 23 Apr 2003 14:37:02
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3.0.1.16.20030423143702.264f6b20@s-net-04.besancon.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

Hello

I'll have to let IIOP go throught my netfilter gateway
I had a look to IIOP, CORBA 2.0 and related doc, and the problem seems to
be that iiop embeds ip addresses in its paylod, thus it can't be simply
NATed, some protocol analysis has to occur like for example h323
Unfortunately I didn't find some netfilter add-on for iiop

Did I miss something or is this feature not available for the moment ?

thanks for your answers=20
			- * - * - * - * - * - * -
Bien s=FBr que je suis perfectionniste !
Mais ne pourrais-je pas l'=EAtre mieux ?
	Thierry ITTY
eMail : Thierry.Itty@Besancon.org		FRANCE

