From: Jason Opperisano <opie@817west.com>
Subject: Re: question about --tcp-flags
Date: Thu, 02 Dec 2004 18:08:54 -0500
Message-ID: <1102028933.3217.2.camel@hubcap.ljm.dom>
References: <41AF9255.4040408@lopsch.com>
	<20041202231155.GA6712@bender.817west.com>
	<41AF9865.2090401@lopsch.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41AF9865.2090401@lopsch.com>
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

On Thu, 2004-12-02 at 17:34, Lopsch wrote:
> Thank=C2=B4s will take look at that list :). But a last question. --syn=
 is=20
> the same as --tcp-flags ALL SYN?

no.  "--syn" is the example you asked about:

  --tcp-flags SYN,RST,ACK SYN

this is clearly explained in 'man iptables' btw...

-j

--
"Fame was like a drug. But what was even more like a drug were
 the drugs."
	--The Simpsons


