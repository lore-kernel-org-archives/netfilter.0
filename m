From: "T. Take" <t_takejp@hotmail.com>
Subject: Re: ULOG: invalid argument
Date: Sun, 22 Feb 2004 15:28:16 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY15-F664DVvm24Tzm00001610@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="iso-2022-jp"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi, Mr Stearns. 

Thank you for explaining it in detail.

>	One quick check is to type:
>
>iptables -j ULOG -h
>
>	which should show the help text for the ULOG module at the end if
>your binary has support for ULOG.

As you write above,  the command shows the help.

>	The iptables binary support is generally provided as a module.
>Where this is found depends on the compile time options used, but on a
>Redhat stock system it's found as /lib/iptables/libipt_ULOG.so (worst
>case, do a "locate libipt_ULOG.so").  That module not only provides the
>help text but also all the code necessary to parse command line options
>and actually insert your request to _use_ the ULOG kernel module into the
>kernel.

I checked that there was /lib/iptables/libipt_ULOG.so.

Judging from the two points that you teached me, iptables in my system 
seems to support ULOG.

>
>	If you don't have that file, you'll need to compile the iptables
>binary.  The source code is available from
>ftp://ftp.netfilter.org/pub/iptables/ (I personally get the snapshots, but
>for critical systems you might want to stick with the last released
>1.2.9).  The INSTALL file should provide enough hints of what you need to
>do.

The other day, I updated iptables to 1.2.9. But, I haven't resolved the 
problem yet.

Best regards.

_________________________________________________________________
友達と24時間ホットライン「MSN メッセンジャー」、今すぐダウンロード！  
http://messenger.msn.co.jp 


