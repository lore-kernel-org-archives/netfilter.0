From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: About loadable kernel modules
Date: Mon, 7 Oct 2002 21:06:51 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210072106.51708.netfilter@newkirk.us>
References: <001001c26a3e$1900bab0$c5327d9e@alex>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001001c26a3e$1900bab0$c5327d9e@alex>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Alexandros Fragkiadakis <A.Fragiadakis@lboro.ac.uk>, netfilter@lists.netfilter.org

On Wednesday 02 October 2002 02:04 pm, Alexandros Fragkiadakis wrote:
> Hi all,
>
> Well, i have written a (netfilter) loadable kernel module for filtering
> various packets. I pass these packets from kernel space to user space u=
sing
> libipq. I also have a user process thas loads and unloads this loadable
> kernel module using the commands: system("insmod kernel_module.o")
> system("rmmod kernel_module") respectively.
>
>  I'd like to pass parameters to the loadable module, hence having a mor=
e
> flexible user process. So, instead of using the command system("insmod
> kernel_module.o"), i'd like to use: system("insmod kernel_module.o <par=
am1>
> <param2>...<param n>") , hence passing command line parameters to my
> loadable module.

Probably execl(*command,*arg1,*arg2,*arg3...,null) will do what you want.

j


