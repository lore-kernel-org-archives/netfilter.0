From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: nat and dns
Date: Thu, 23 Sep 2004 09:09:09 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4152D905.90509@pbl.ca>
References: <415290B1.5030401@imag.fr>	<20040923103428.GK27327@metastasis.org.uk>
	<20040923110943.14715.qmail@arcoscom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Samuel D=EDaz Garc=EDa wrote:
> For DNS query only UDP is necesary, not TCP.

Wrong.  If reply does not fit into single UDP datagram, client will=20
reissue the query over TCP.

--=20
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

