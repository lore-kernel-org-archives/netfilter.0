From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: nmap difficulty number??
Date: Wed, 30 Oct 2002 16:33:24 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210301633.g9UGXWe11985@vulcan.rissington.net>
References: <39778BFB9C25BA429794B15B50AEC78104B1F3@server-dcms>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <39778BFB9C25BA429794B15B50AEC78104B1F3@server-dcms>
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
To: netfilter@lists.netfilter.org

On Wednesday 30 October 2002 2:08 pm, Didier Hung Wan Luk wrote:

> hello all,=0D
>  =0D
> what do the difficulty numbers mean is higher better or worse??=0D
>  =0D
> Difficulty=3D2463109 (Good luck!) ?? what does this mean?=0D

This is a netfilter mailing list, not nmap.

However, from the nmap man page:

              Another test enabled by -O  is  TCP  Sequence  Pre=AD
              dictability Classification.  This is a measure that
              describes approximately how hard it is to establish
              a  forged  TCP  connection against the remote host.
              This is useful for exploiting source-IP based trust
              relationships  (rlogin,  firewall  filters, etc) or
              for hiding the source of  an  attack.   The  actual
              difficulty  number is based on statistical sampling
              and may fluctuate.  It is generally better  to  use
              the  English  classification  such as "worthy chal=AD
              lenge" or "trivial joke".  This is only reported in
              normal output with -v.

Antony.

--=20

Software development can be quick, high-quality, or low-cost.

The customer gets to pick any two out of three.

