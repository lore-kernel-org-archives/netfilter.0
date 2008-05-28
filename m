From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: TEE target
Date: Wed, 28 May 2008 19:40:39 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0805281936290.19264@fbirervta.pbzchgretzou.qr>
References: <d95317090805270919s5a8347d5y75a3b8cbf5114727@mail.gmail.com>  <alpine.LNX.1.10.0805271843320.12937@fbirervta.pbzchgretzou.qr> <d95317090805281027i70b46548sbfeed39a040f746c@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d95317090805281027i70b46548sbfeed39a040f746c@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gilad Benjamini <gilad.benjamini@gmail.com>
Cc: netfilter@vger.kernel.org


On Wednesday 2008-05-28 19:27, Gilad Benjamini wrote:

>I tried compiling and installing without the attached version.
>The installation, by default, places the ".so" files in different
>location that the standard iptables shared libraries.
>Is iptables supposed to find the libraries there somehow or am I
>suppose to configure the location differently ? I couldn't quite
>understand what variable I need to set in the configuration.

Distributions often pass in a path to configure that is different from 
the default when building their rpms/debs, usually
--prefix=/usr (to not have things in /usr/local), and
--libexecdir=/usr/lib (or lib64).

Note however that Xtables-addons does require at least iptables
1.4.0.77 because earlier iptables versions do not export the 
required header files into /usr/include [or a path of your choice].
