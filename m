From: "hare ram" <hareram@sol.net.in>
Subject: Re: Problem with iptables P-O-M
Date: Tue, 22 Oct 2002 21:40:38 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <02ee01c279e5$8fcddc20$7cfcc5cb@nextto>
References: <20021021233312.512.qmail@web40701.mail.yahoo.com> <200210221014.g9MAErL00581@vulcan.rissington.net> <01c901c279b7$fe7a5000$7cfcc5cb@nextto>
Reply-To: "hare ram" <hareram@sol.net.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

Hi all
thanks to Hard__warE
i have rectified my problem

hare
----- Original Message -----
From: "hare ram" <hareram@sol.net.in>
To: "Antony Stone" <Antony@Soft-Solutions.co.uk>;
<netfilter@lists.netfilter.org>
Sent: Tuesday, October 22, 2002 4:14 PM
Subject: Problem with iptables P-O-M


> Hi all
>
> iam using redhat 7.2 with iptable 1.2.5 rpm
> iam trying to patch the iptables with P-o-M
> i was patched only one option iplimit
> its patched with
>
> /var/tmp/patchomatic/netfilter/patch-o-matic/runme
> ../userspace/extensions/libipt_iplimit.c
>
> patch is applied
> then
> i run in kernal
>
> make dep
> make
> make bzImage
> make modules
> make install
> make modules_install
>
> when iam doing make modules_install, iam getting following error
> any one can point me where iam doing wrong
>
>
>
> find kernel -path '*/pcmcia/*' -name '*.o' | xargs -i -r ln -sf ../{}
pcmcia
> if [ -r System.map ]; then /sbin/depmod -ae -F System.map  2.4.18-3custom;
> fi
> depmod: *** Unresolved symbols in
> /lib/modules/2.4.18-3custom/kernel/net/ipv4/netfilter/ipt_iplimit.o
> depmod:         ip_conntrack_find_get
> make: *** [_modinst_post] Error 1
>
> thanks
> advance
>
> hare
>
>
>


