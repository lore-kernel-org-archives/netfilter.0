From: =?ISO-8859-2?Q?=A3ukasz_Hejnak?= <sziftgroup@wp.pl>
Subject: Re: Could anyone, please, tell me what's wrong with this:
Date: Fri, 18 Nov 2005 12:26:50 +0100
Message-ID: <437DBA7A.8060807@wp.pl>
References: <437DB2FC.7080000@camline.net.mt> <437DB4B9.9040606@wp.pl>
	<437DB767.5050100@camline.net.mt>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <437DB767.5050100@camline.net.mt>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Anthony Azzopardi napisa=B3(a):
> It gives >>
> No chain/target/match by that name !!!??
Then this is a completely different matter (altrough You _do_ need to=20
delete those two spaces in that rule You posted)

And for this, ((You need to upgrade Your iptables (what iptables do You=20
use??, try 'iptables -V')) or (add the 'iprange' match with some=20
patch-o-matic)) and (enable them in Your kernel config file) and=20
(finally recompile Your kernel).
  :)

--
Best wishes
=A3ukasz Hejnak

