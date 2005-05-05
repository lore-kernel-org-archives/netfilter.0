From: Dimitri Yioulos <dyioulos@firstbhph.com>
Subject: Re: FTP access from outside
Date: Thu, 5 May 2005 10:48:34 -0400
Message-ID: <200505051048.35097.dyioulos@firstbhph.com>
References: <200505051437.j45EbauW006066@eden.inf.ed.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200505051437.j45EbauW006066@eden.inf.ed.ac.uk>
Content-Disposition: inline
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

On Thursday May 5 2005 10:37 am, you wrote:
> > What have I missed (or messed up)?
>
> You have the ip_conntrack_ftp and ip_nat_ftp modules loaded?  And a rule =
to
> pass ESTABLISHED and RELATED?

George,

I beleive I have the rule to pass ESTABLISHED and RELATED, but an lsmod sho=
ws=20
I don't have the ip_nat_ftp modules loaded. =A0Would load that by doing an=
=20
"insmod /dirwhereitlives/ip_nat_ftp.o"?

Thanks.

Dimitri

