From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Patch o matic
Date: Thu, 5 Oct 2006 09:55:50 +0200 (CEST)
Message-ID: <58185.193.173.147.3.1160034950.squirrel@webmail.sterenborg.info>
References: <4523FAF7.1070503@gabrix.ath.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4523FAF7.1070503@gabrix.ath.cx>
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

On Wed, October 4, 2006 20:18, gabrix wrote:
> I have a debian sarge kernel 2.6 i got the patch-o-matic-ng , a kernel
> and iptables source ...
>
>> root@argo:~# ls /usr/src/
>> iptables-1.3.6  kernel-image-2.6.8_custom.1.0_i386.deb kernel-source-2=
.6.8
>> patch-o-matic-ng-20040621
>
> I have placed all in the /usr/src/ dir as you can see , compiled the ne=
w
> kernel , installed by dpkg -i the new kernel,rebooted,no kernel panic a=
nd i
> can't find the new ipt modules.Some got built like NOTRACK and TTL but =
no
> TARPIT or psd ...

[....]

>> root@argo:~# ls /lib/modules/2.6.8-2-386/kernel/net/ipv4/netfilter/
>> arptable_filter.ko      ipfwadm.ko            iptable_nat.ko ipt_ecn.k=
o
>> ipt_mark.ko        ipt_realm.ko     ipt_TOS.ko arp_tables.ko

[....]

> Is this the right dir for iptables kernel modules?

Only if that is the kernel version you are using.
You say that you built a kernel from source, patched the kernel and iptab=
les
using pom-ng:
- Did you really use 2.6.8? We are now at 2.6.18.
- Did you see a patch for TARPIT and psd when you ran pom-ng?
- You installed the kernel but are you sure you are running the version y=
ou
installed (uname -r)?

> Is TARPIT and psd part of a chain of modules i missed to modprobe ?

Check your kernel .config file if you have the lines
"CONFIG_IP_NF_TARGET_TARPIT=3Dm" and "CONFIG_IP_NF_MATCH_PSD=3Dm". If you=
 can't
find them, support for these is not available in your kernel.


Grts,
Rob



