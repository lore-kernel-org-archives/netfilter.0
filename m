From: Fabrice MARIE <fabrice@celestix.com>
Subject: Re: patch-o-matic question.
Date: Tue, 10 Sep 2002 20:50:14 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209102050.14948.fabrice@celestix.com>
References: <A758C299015FD411887B0000E2131186C213E8@TRUVA>
Reply-To: fabrice@celestix.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <A758C299015FD411887B0000E2131186C213E8@TRUVA>
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
To: =?iso-8859-9?q?=DDhsan=20=20Turkmen?= <iturkmen@ifk.com.tr>, "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

On Tuesday 10 September 2002 18:52, =DDhsan Turkmen wrote:
> When I run the following command from within the extracted folder of
> path-o-matic,
> ./runme pending KERNEL_DIR=3D/usr/src/linux-2.4
> I get the error:
> "ERROR: Invalid option KERNEL_DIR=3D/usr/src/linux-2.4"
> What am I doing wrong?
> Thanks..

Hello,

you should run

# KERNEL_DIR=3D/usr/src/linux-2.4 ./runme pending
or
# export KERNEL_DIR=3D/usr/src/linux-2.4; ./runme pending

Have a nice day,

Fabrice.
--
Fabrice MARIE
Senior R&D Engineer
Celestix Networks
http://www.celestix.com/

"Silly hacker, root is for administrators"
       -Unknown

