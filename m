From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: nat and dns
Date: Thu, 23 Sep 2004 12:23:31 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040923112331.GL27327@metastasis.org.uk>
References: <415290B1.5030401@imag.fr>
	<20040923103428.GK27327@metastasis.org.uk>
	<20040923110943.14715.qmail@arcoscom.com>
Reply-To: Netfilter Mailing List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040923110943.14715.qmail@arcoscom.com>
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

On Thu, Sep 23, 2004 at 01:09:43PM +0200, Samuel D=EDaz Garc=EDa wrote:
> For DNS query only UDP is necesary, not TCP.

Heh, that's such a common misconception that I almost mentioned it in my
original email.  Most DNS queries take place over UDP, however if the
reply to the query is especially large then a new TCP connection is
opened between the client and server.  Also zone transfers take place
over TCP IIRC, it depends what kind of functionality the DNS server will
be providing.

--=20
mors omnia vincit

