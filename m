From: "Alexis" <alexis@tpys.com.ar>
Subject: RE: nat and dns
Date: Thu, 23 Sep 2004 10:19:37 -0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <E1CATPQ-00028v-00@deer.gmane.org>
References: <20040923112331.GL27327@metastasis.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040923112331.GL27327@metastasis.org.uk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="windows-1252"
To: 'Netfilter Mailing List' <netfilter@lists.netfilter.org>

Just to add some information to the correct one below.

Tcp queries are queries greater than 512 bytes. (normally). Microsoft =
uses
to query via tcp with short queries too, I didn=92t found any doc or =
pattern
looking the queries to asume why m$ do this.

Zone transfers like Nick said, are all via tcp
=20

-----Mensaje original-----
De: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] En nombre de Nick Drage
Enviado el: Jueves, 23 de Septiembre de 2004 8:24
Para: netfilter@lists.netfilter.org
Asunto: Re: nat and dns

On Thu, Sep 23, 2004 at 01:09:43PM +0200, Samuel D=EDaz Garc=EDa wrote:
> For DNS query only UDP is necesary, not TCP.

Heh, that's such a common misconception that I almost mentioned it in my
original email.  Most DNS queries take place over UDP, however if the =
reply
to the query is especially large then a new TCP connection is opened =
between
the client and server.  Also zone transfers take place over TCP IIRC, it
depends what kind of functionality the DNS server will be providing.

--
mors omnia vincit



