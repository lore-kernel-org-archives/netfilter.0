From: Alex Satrapa <alex@lintelsys.com.au>
Subject: Re: Questions about Patch-o-Matic
Date: Mon, 22 Dec 2003 08:30:37 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FE610FD.6080505@lintelsys.com.au>
References: <EOEIJIEEJODPHJKGJHMBGEHKCBAA.arthur.niu@neighbourhoodlink.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <EOEIJIEEJODPHJKGJHMBGEHKCBAA.arthur.niu@neighbourhoodlink.ca>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: netfilter@lists.netfilter.org

Arthur Niu wrote:
>    1. How to check kernel version?

'uname -r' will return a version number in the format '2.4.21'.

>    2. When I run ./runme base, it told me program =93'patch' is missing,
>       please install it!=94, what does the patch mean? Redhat patch or
>       iptables patch?

That means you need to install the program called 'patch'. I don't know=20
which RPM it comes in though. This is actually a piece of software which=20
applies patches to existing source code thus:

    [root@localost]# patch -p0 < myversion.diff

HTH
Alex


