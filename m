From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Poor mans cluster question
Date: Tue, 4 Oct 2005 11:48:31 +0200 (CEST)
Message-ID: <63047.193.173.147.3.1128419311.squirrel@webmail.sterenborg.info>
References: <57F9959B46E0FA4D8BA88AEDFBE582900B581D@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <57F9959B46E0FA4D8BA88AEDFBE582900B581D@pxtbenexd01.pxt.primeexalia.co
	m>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tue, October 4, 2005 08:19, Gary W. Smith wrote:
> Hello,
>
> I need to setup a very simple cluster for testing a couple different
> devices and applications.  I'm not looking for perfection.
>
> What I have are 3 web servers in our test environment.  We are testing
> both Windows and a Linux web server at the same time.  We basically
> want
> to round robin traffic via IP to any one of the 3 servers.  My
> understanding is that the following should make this happen:
>
> -A PREROUTING -d 10.0.16.89 -j DNAT --to 10.0.16.90-10.0.16.92

Perhaps the nth patch from POM will work for you :
http://www.netfilter.org/patch-o-matic/pom-base.html#pom-base-nth

See these threads :
https://lists.netfilter.org/pipermail/netfilter/2003-October/047215.html
http://linuxgazette.net/108/odonovan.html


Gr,
Rob



