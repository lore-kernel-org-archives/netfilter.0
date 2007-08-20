From: Bertram Scharpf <lists@bertram-scharpf.de>
Subject: Re: REJECT target not as policy
Date: Mon, 20 Aug 2007 19:46:42 +0200
Message-ID: <20070820174642.GA22613@bart.bertram-scharpf.homelinux.com>
References: <20070820135206.GA18644@bart.bertram-scharpf.homelinux.com>
	<200708201608.39032.r.laban@ism.nl>
	<46C9B8A2.5040201@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <46C9B8A2.5040201@plouf.fr.eu.org>
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

Am Montag, 20. Aug 2007, 17:52:02 +0200 schrieb Pascal Hambourg:
> Ruben Laban a =E9crit :
>> On Monday 20 August 2007, Bertram Scharpf wrote:
>>> on one of my machines the REJECT target doesn't behave as I
>>> expect. It is inserted into a chain but it is not accepted
>>> as a policy.
>
> It behaves as expected. REJECT is an extension, not a built-in target, an=
d=20
> cannot be used as a policy. Check man iptables.

I wrote "as _I_ expect". Obviously I expected wrong. Now, I
found it in the manpage.

On an other list I was told it were a good idea to set
REJECT as policy. I'm so glad that I asked here. Thank you.

Bertram


--=20
Bertram Scharpf
Stuttgart, Deutschland/Germany
http://www.bertram-scharpf.de

