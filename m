From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: PPTP Conntrack pom patch. compile issues.
Date: Tue, 24 Jun 2003 21:40:05 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200306242140.05934.Alistair@nerdnet.ca>
References: <03a101c33a9c$490d8d80$3964a8c0@comsol.co.nz>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <03a101c33a9c$490d8d80$3964a8c0@comsol.co.nz>
Content-Disposition: inline
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
To: Jeremy <jeremy@paradise.net.nz>, netfilter@lists.netfilter.org

	
	I would bet long odds that your system has the wrong kernel include 
	files in /usr/include/linux.



On June 24, 2003 06:02 pm, Jeremy wrote:
> Hi there,
>
> I run a debian box, and have tried compiling on 2.4.20 & 2.4.21 kernels
> after applying this patch with the same errors. Could someone shed some
> light on this please, im getting very frustrated!! :o) Thanks
>
> p.s. i dont run any debugging of netfilter stuff in the kernel
>
> Compile Errors are as follows:
> NAME=ip_conntrack_proto_gre  -DEXPORT_SYMTAB -c ip_conntrack_proto_gre.c
> ip_conntrack_proto_gre.c: In function `ip_ct_gre_keymap_add':
> ip_conntrack_proto_gre.c:118: union has no member named `gre'
> ip_conntrack_proto_gre.c:120: union has no member named `gre'
> ip_conntrack_proto_gre.c: In function `ip_ct_gre_keymap_destroy':
> ip_conntrack_proto_gre.c:148: union has no member named `gre'
> ip_conntrack_proto_gre.c:150: union has no member named `gre'
> ip_conntrack_proto_gre.c:151: union has no member named `gre'
> ip_conntrack_proto_gre.c:152: union has no member named `gre'
> ip_conntrack_proto_gre.c:154: union has no member named `gre'
> ip_conntrack_proto_gre.c:156: union has no member named `gre'
> ip_conntrack_proto_gre.c:157: union has no member named `gre'
> ip_conntrack_proto_gre.c:158: union has no member named `gre'
> ip_conntrack_proto_gre.c: In function `gre_print_conntrack':
> ip_conntrack_proto_gre.c:242: union has no member named `gre'
> ip_conntrack_proto_gre.c:243: union has no member named `gre'
> ip_conntrack_proto_gre.c: In function `gre_packet':
> ip_conntrack_proto_gre.c:254: union has no member named `gre'
> ip_conntrack_proto_gre.c:258: union has no member named `gre'
> ip_conntrack_proto_gre.c: In function `gre_new':
> ip_conntrack_proto_gre.c:272: union has no member named `gre'
> ip_conntrack_proto_gre.c:273: union has no member named `gre'
> make[3]: *** [ip_conntrack_proto_gre.o] Error 1
> make[3]: Leaving directory
> `/usr/src/linux/TEMP/linux-2.4.21/net/ipv4/netfilter' make[2]: ***
> [first_rule] Error 2
> make[2]: Leaving directory
> `/usr/src/linux/TEMP/linux-2.4.21/net/ipv4/netfilter' make[1]: ***
> [_subdir_ipv4/netfilter] Error 2
> make[1]: Leaving directory `/usr/src/linux/TEMP/linux-2.4.21/net'
> make: *** [_dir_net] Error 2

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

