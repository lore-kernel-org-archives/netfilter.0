From: Andre Lorenz <andre@highsecure.de>
Subject: Re: Modprobe .
Date: Wed, 23 Apr 2003 16:20:50 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304231620.50861.andre@highsecure.de>
References: <NGBBLGFEALDADHNDAAFFGEIKDJAA.ksmith@perfht.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NGBBLGFEALDADHNDAAFFGEIKDJAA.ksmith@perfht.com>
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
To: Kevin Smith <ksmith@perfht.com>, netfilter@lists.netfilter.org

Am Mittwoch, 23. April 2003 15:14 schrieb Kevin Smith:
> I recently patched my kernel and all went well with POM. After I recompiled
> it and rebooted, I didn't see the module on lsmod, so I tried insmod which
> responded with and "module not found" error.
> I looked in the /lib/modules and saw the module was not compiled. (.c file)
> when the other patch was compiled ok. (.o) file.
> What would cause a patch not to compile? I checked the source and saw the
> #include lines and all the files are where is suggest it should be, though
> running gcc (lack of anything better to do) responds with file or directory
> not found errors. Is there a PATH that needs to be set up to get this
> working?
> I am using RH 7.2 Kernel 2.4.20,  IPTables 2.2.7a, the module is
> ip_nat_cuseeme.c.
>
> Kev
Hi,
I had the same problem, I'm using SuSE 8.2.
The problem was fixed after setting the "right path-vraiable".

now it works fine for me

with friendly regards
Andre

