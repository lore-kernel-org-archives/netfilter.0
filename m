From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: tcp-MSS target extensions Patch
Date: Sun, 16 May 2004 07:55:38 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405161455.i4GEtfou018565@server5.bandwidthco.com>
References: <BAY1-F39s3nJQHd4Kkc00018f2c@hotmail.com>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY1-F39s3nJQHd4Kkc00018f2c@hotmail.com>
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
To: 'Stephen Jones' <sljones8@hotmail.com>, netfilter@lists.netfilter.org

 

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Stephen Jones
Sent: Sunday, May 16, 2004 2:28 AM
To: netfilter@lists.netfilter.org
Subject: tcp-MSS target extensions Patch

Hello All,

I am having difficulty locating and applying the tcp-MSS patch as described
here:

http://www.netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO-4.h
tml#ss4.7

I have run through both the patch-o-matic-20031219 and the
patch-o-matic-ng-20040302 against an iptables 1.2.9 and  2.4.25 kernel
sources.  The option to apply the patch does not appear as I run through the
./runme extra or ./rume userspace  scripts for either patch-o-matics.

I am in desperate need to implement:

iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS
--clamp-mss-to-pmtu

with a pptp client I have installed on a gateway device.  
(http://pptpclient.sourceforge.net/  <-- main page, and see these for the
problem I am tryting to solve:  
http://pptpclient.sourceforge.net/howto-diagnosis.phtml#connections_freeze 
and finally     http://lartc.org/howto/lartc.cookbook.mtu-mss.html)

The kernel config has these options set:

CONFIG_IP_NF_MATCH_TCPMSS=y
CONFIG_IP_NF_TARGET_TCPMSS=y

Both the kernel and iptables appear to compile without complaints.

I get an "unknown arg `--clamp-mss-to-pmtu'  gripe from the recompiled
iptables when I enter the full command as specified above.

The only "hits" I could find using tcp-MSS on a google hunt were to a post
on the netfilter list from October of 1999, and a reference to the patch on
the samba cvs, but it was a dead link...

A nudge in the right direction would be greatly appreciated!  Thanks for
your time!

SJ
_________________________________________________________________
MSN Toolbar provides one-click access to Hotmail from any Web page - FREE
download! http://toolbar.msn.click-url.com/go/onm00200413ave/direct/01/


Tough one Stephen as everything appears to be correct. The kernel support
you need CONFIG_IP_NF_TARGET_TCPMSS=y is statically built-in and your rule
definition is correct. In fact, it is identical to the one I successfully
use. Based on the error you are getting, the only thing I can think of at
this time is that your new iptables executable may not have been copied
correctly to the correct directory,i.e. IPT="/usr/sbin/iptables". If not,
that could be throwing the error.



