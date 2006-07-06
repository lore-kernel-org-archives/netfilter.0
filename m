From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: How can i use Linux as a router
Date: Thu, 6 Jul 2006 13:58:24 +0200 (CEST)
Message-ID: <60247.193.173.147.3.1152187104.squirrel@webmail.sterenborg.info>
References: <20060706112014.D435C699C3@smtp.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060706112014.D435C699C3@smtp.sterenborg.info>
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
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org

On Thu, July 6, 2006 13:30, Ali Ozaltin wrote:
> Hello,
>
>
> Can i install POM on Fedora 5 ? When i run ./runme extra command while
> patching im giving some erros and kernel patching erros.. Who can send =
me
> IPTABLES and PAM installation guide ? and which linux version(Redhat,De=
bian
> etc.) are you suggest for a router =EF=BF=BD? =EF=BF=BDI want use my li=
nux box as a cisco
> router =3D)

What errors? Did you supply the (correct) kernel-source and iptables-sour=
ce
path? What did you do exactly?

Anyway, you have to be able to compile your own kernel and this list is n=
ot
about compiling a new kernel.
The Fedora kernels are (probably, they used to be anyway) modified kernel=
s so
when you try to patch them with POM, you may get errors in the process.
You had better download a vanilla kernel from www.kernel.org. Also, you s=
hould
compile a new iptables to accompany your kernel.
When you compile a vanilla kernel for Fedora you may run into trouble bec=
ause
of patches that RedHat may have put into their kernel that you are missin=
g.
(This step is optional; you may not have any problem at all.. :=3D))
Also, try this on a test-box first; not in production.

If you still are prepared to compile a new kernel: go ahead, but personal=
ly,
not considering myself a guru, I think you need more experience/reading w=
hen
you are talking about "installing POM on Fedora 5" like it's just some pa=
ckage
you install using RPM or something.


Gr,
Rob



