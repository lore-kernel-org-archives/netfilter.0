From: Iwan Fauzie <iwan@gorontalo.net>
Subject: Re[2]: MAC/IP PAIR MATCH
Date: Wed, 21 Jan 2004 12:46:50 +0700
Message-ID: <1152796788.20040121124650@gorontalo.net>
References: <164362107.20060127145214@gorontalo.net>
	<43DA2B8C.5050007@prosyst.com>
	<10310383401.20060128161251@gorontalo.net>
	<43DE4D3B.8080106@prosyst.com>
Reply-To: Iwan Fauzie <iwan@gorontalo.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43DE4D3B.8080106@prosyst.com>
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

Hello Boryan,

Tuesday, January 31, 2006, 12:30:35 AM, you wrote:

> Iwan Fauzie wrote:
>> Hello Boryan,
>> 
>> Thanks for you help Boryan.
>> 
>> Please see http://www.netservers.co.uk/gpl/ this patch IPtables MAC/IP
>> pair match
>> 
>> This patch to help prevent users from:
>> 
>>  - users have not changed their IP address to conflict with or spoof
>>    others users
>>  - Users have not changed their MAC address (e.g. new network cards
>>  MAC spoofing or NAT)
>>
>> 
>> Friday, January 27, 2006, 9:17:48 PM, you wrote:
>> 
>> 
>>>Iwan Fauzie wrote:
>>>
>>>>Hello,
>>>>
>>>>I would like to patch mac/ip pair match, how to do that? any body help me
>>>>
>> 
>> 
>>>If you want to match IP against MAC address, then check the iptables's
>>>_mac_ match:
>> 
>> 
>>># iptables -m mac -help
>> 
>> 
>>>Example: rule for forwarding packets matching certain IP/MAC pair is:
>> 
>> 
>>># iptables -A FORWARD -s <IP _address> -m -mac --mac-source <MAC 
>> 
>> address>> -j ACCEPT
>> 
>> 
>>>... but if you want to "patch a match", then you need to specify a bit
>>>more detailed what are you trying to do.
>> 
>> 
>>>The _mac_ match exist into the default iptables source (./extensions)
>>>e.g. you don't need to patch anything. Just install iptables and enable
>>>the match inside your kernel's .config file (CONFIG_IP_NF_MATCH_MAC=y)
>>>and finally recompile (and install) the new kernel.
>> 
>> 

> Personally I never used the iptables patch you mentioned above.
> But looking at its tarball content it seems to be a 2.4.xx kernel
> patch, for a kernel patched with iptables (probably 1.2.x).

> Follow this steps (not the smartest one) in order to install it:

> =================================================================
> STEP 1: Patching the kernel
> =================================================================

> The file with the sources (macmatch.patch) is a diff on a patched
> kernel, so you could apply it to an existing kernel tree easily.
> Just go to where you current kernel source is located (I suppose
> it is into:

>    # cd /usr/src/linux

> Make sure it is already patched with iptables (recent kernels are
> by default). To apply the "macmatch.patch" patch simply type:

>    # patch -p1 < /<Patch_Location >/macmatch.patch

> The result from the patch command must look like:

>    patching file include/linux/netfilter_ipv4/ipt_macmatch.h
>    patching file net/ipv4/netfilter/ipt_macmatch.c

> The configuration and make files are not a diff, so the fastest
> way to apply them, is to edit the corresponding files manually:

> -----------------------------------------------------------------
> "macmatch.patch.config.in"
> -----------------------------------------------------------------

> Its content goes to "/usr/src/linux/net/ipv4/netfilter/Config.in"

> Find the line from "Config.in" which says:

>    dep_tristate '  MAC address match support' CONFIG_IP_NF_MATCH_MAC
> $CONFIG_IP_NF_IPTABLES

> ... and replace it (the line only) with the content of the 
> macmatch.patch.config.in:

>    dep_tristate '  MAC address match support' CONFIG_IP_NF_MATCH_MAC
> $CONFIG_IP_NF_IPTABLES
>    dep_tristate '  MAC/IP pair match support' 
> CONFIG_IP_NF_MATCH_MACMATCH $CONFIG_IP_NF_IPTABLES


> -----------------------------------------------------------------
> "macmatch.patch.makefile"
> -----------------------------------------------------------------
> Its content goes to "/usr/src/linux/net/ipv4/netfilter/Makefile"

> Find the line from "Makefile" which says:

>    obj-$(CONFIG_IP_NF_MATCH_MAC) += ipt_mac.o

> ... and replace it (the line only) with the content of the 
> macmatch.patch.makefile:

>    obj-$(CONFIG_IP_NF_MATCH_MAC) += ipt_mac.o
>    obj-$(CONFIG_IP_NF_MATCH_MACMATCH) += ipt_macmatch.o


> -----------------------------------------------------------------
> "macmatch.patch.configure.help"
> -----------------------------------------------------------------
> This is optional and only for convenience. You'll need it if you
> want a help entry for the macmatch kernel configuration option.
> Its content (starting from the second line) should go as an entry
> into "/usr/src/linux/Documentation/Configure.help".


> =================================================================
> STEP 2: Patching iptables
> =================================================================

> Once you have you kernel tree ready its time to let know iptables
> about the macmatch existence:

> Go to your iptables source tree location. I'll suppose it is into

>    #cd /usr/local/src/iptables-1.xx.yy

> Copy both "libipt_macmatch.c" and ".macmatch-test" files from the
> macmatch tree into:

>    #cp <file1> <file2> /usr/local/src/iptables-1.xx.yy/extensions

> And finally compile and install iptables.

>    make KERNEL_DIR=/usr/src/linux
>    make install KERNEL_DIR=/usr/src/linux


> =================================================================
> STEP 3: Enable the patch into the kernel config file
> =================================================================

> Add the following line into "/usr/src/linux/.config" :

>    CONFIG_IP_NF_MATCH_MACMATCH=y

> ... in order to build the patch static into the kernel

> or

>    CONFIG_IP_NF_MATCH_MACMATCH=m

> ... if you need it as loadable module.

> Finally recompile the kernel, load it and reboot.


> Hope this helps.


Thanks Boryan, I hope this helps my problem

-- 
Best regards,
 Iwan                            mailto:iwan@gorontalo.net


