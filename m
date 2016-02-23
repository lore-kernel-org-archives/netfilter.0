From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Ipset kernel module functions
Date: Tue, 23 Feb 2016 10:25:50 +0100 (CET)
Message-ID: <alpine.DEB.2.10.1602230936460.11314@blackhole.kfki.hu>
References: <CAKJ7aR5_xNAeDdnU53K4sVvOVzDTzBjYZ1yxJ7jX8cL=jCRBJQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	blackhole.kfki.hu; h=mime-version:user-agent:references
	:message-id:in-reply-to:from:from:date:date:received:received
	:received; s=20151130; t=1456219511; x=1458033912; bh=8HR3/tGzg/
	2/0uenDRiMkC73EDDe/Wzk7h4v72M5hh0=; b=elaM/GPGpQbZGUToNCBEl8s5hU
	6U82MAF9mRyvbxzDEwuj8//m5iADywM0XKtQkJgr2LXpsbrKqA/fp+n51/ETY4lh
	kE6HasHh4FNh8LmArWUDwWrp9akYDw5F8cjKKtXs/76CY3M9UHCwTzXgnU0bZOAB
	+1cL73/5+xwffC+p8=
In-Reply-To: <CAKJ7aR5_xNAeDdnU53K4sVvOVzDTzBjYZ1yxJ7jX8cL=jCRBJQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gadre Nayan <gadrenayan@gmail.com>
Cc: netfilter@vger.kernel.org

On Tue, 23 Feb 2016, Gadre Nayan wrote:

> I am trying to understand the IPSET modules in linux kernel 4.3. 
> Particularly Macset. In the source file: 
> /net/netfilter/ipset/ip_set_hash_mac.c
> 
> I have few questions:
> 
> 1. What is the purpose of HTYPE, it is not getting used further.
> 
> /* Type specific function prefix */
>          #define HTYPE           hash_mac
> 
> 2. What is the purpose of MTYPE.
>           #define MTYPE           hash_mac4

Most of the functions are generated and the macros are used in the 
included ip_set_hash_gen.h file. HTYPE is used for the IPv4/IPv6 
independent functions while MTYPE required for the IPv4, IPv6 specific 
ones.

> 3. Why 2 different functions are used. KADT and UADT. I understand ADT
> is Add delete, Test and K and U might be Kernel space and User space.
> But what is different operation of KADT and UADT.

Those are the kernel and userspace common routines for add, del and test 
elements. The functions are separated because the input comes in different 
forms: in the userspace case in netlink attributes, while in the kernel 
case through the API.

> 4. Who calls Kadt in kernel space. How is UADT called from User space.

The kadt functions are called from the kernel part interfaces (ip_set_add, 
etc) while the uadt ones from ip_set_uadd, etc (see ip_set_core.c). Please 
note uadt functions are NOT called in userspace: the functions work on 
data sent FROM userspace.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
