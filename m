From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: kernel helper modules parameters
Date: Wed, 8 Feb 2012 16:49:07 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1202081631580.21312@frira.zrqbmnf.qr>
References: <4F31B772.2040102@googlemail.com> <4F31E7D3.5060203@googlemail.com> <alpine.LNX.2.01.1202080454140.12624@frira.zrqbmnf.qr> <4F31F30A.3020902@googlemail.com> <alpine.LNX.2.01.1202080621310.25781@frira.zrqbmnf.qr> <4F32846D.2060408@googlemail.com>
 <alpine.LNX.2.01.1202081521290.1820@frira.zrqbmnf.qr> <4F3291B3.1030107@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F3291B3.1030107@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: Netfilter user mailing list <netfilter@vger.kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>

On Wednesday 2012-02-08 16:16, Mr Dash Four wrote:

>
>> "ENOENT has many meanings, and iptables prints just one of them,
>> which is potentially misleading."
>>  
> Thanks, this will be corrected I take it?

Is this wording compatible enough with non-developers? :)

diff --git a/libiptc/libiptc.c b/libiptc/libiptc.c
index 42d9784..4106afe 100644
--- a/libiptc/libiptc.c
+++ b/libiptc/libiptc.c
@@ -2730,7 +2730,10 @@ TC_STRERROR(int err)
 	    { NULL, ENOPROTOOPT, "iptables who? (do you need to insmod?)" },
 	    { NULL, ENOSYS, "Will be implemented real soon.  I promise ;)" },
 	    { NULL, ENOMEM, "Memory allocation problem" },
-	    { NULL, ENOENT, "No chain/target/match by that name" },
+	    { NULL, ENOENT, "An object was not found. Check that the chain, "
+	                    "target/match extension, and/or per-extension "
+	                    "named object exists. Look at `dmesg` for "
+	                    "reports about the latter." },
 	  };
 
 	for (i = 0; i < sizeof(table)/sizeof(struct table_struct); i++) {

>>The reason you have to specify -p tcp is so that CT can take a
>>reference to the particular helper instance (which is identified
>>by name, L3 family, _and_ L4 family) and/or load a module that
>>does provide such instances, respectively.
>  
>Is there a need for the L4 inclusion (seems that it causes the initial error
>message)?


I guess this is a relic of the past. Before we had the CT target, the 
only way to assign packets to a helper was by port number.

Without the L4proto number being part of what uniquely identifies a 
helper instance (struct nf_conntrack_helper), you would not have been 
able to have both a RFC959-compatible helper listening on 21/tcp and a 
$my_own_fancy_protocol-understanding helper on 21/udp.

With CT, this now looks moot to me like it does to you, since packets 
can now be assigned via the awesome iptables logic, and the 
nf_conntrack_tuple inside struct nf_conntrack_helper basically goes 
unused.

Let's hear what Pablo (cc'd) has to say.
