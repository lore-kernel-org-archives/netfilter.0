From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: EtherTalk Packet Filtering
Date: 15 Apr 2003 07:54:39 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1050386079.5203.11.camel@elendil.intranet.cartel-securite.net>
References: <Pine.LNX.4.33.0304141655390.11005-100000@molbio.uoregon.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0304141655390.11005-100000@molbio.uoregon.edu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Dan Graham <graham@molbio.uoregon.edu>
Cc: netfilter@lists.netfilter.org

Le mar 15/04/2003 =E0 02:04, Dan Graham a =E9crit :
>   I'm new to the list, and I'm new to netfilter. I've just set up a
> Bridge+IPtables firewall, and it seems to be working well, with one
> exception.  The bridge is passing EtherTalk packets, when I'd my defaul=
t
> FORWARD policy is DROP.  So the question is , did I miss a
> configuration option which would allow dropping of non-IP packets?
>  I'm willing to start adding non-IP filtering, but I'd rather not
> duplicate previous work.

For what you present, you do not seem to have only used bridge-nf patch,
that allows forwarded frames contents (layer 3 and more) to get injected
into Netfilter's framework in order to get filtered. Problem is this
kind of filtering "only" works for layer 3 protocols that Netfilter
supports. And Netfilter does not support EtherTalk. Thus, frames
containing EtherTalk are free to go through.

You should then consider use ebtables :

	http://ebtables.sourceforge.net/

ebtables is a patch that allows layer 2 filtering and sometimes a bit
more depending on layer 3 protocol. You'll be able to set up filtering
for your EtherTalk frames using its protocole number, based on source
and destination MACs.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

