From: Jan Du Caju <Jan.DuCaju@kuleuven.net>
Subject: Re: failover with iptables?
Date: Wed, 11 Sep 2002 16:06:42 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D7F4DF2.7000804@kuleuven.net>
References: <200209111410.14005.roy@karlsbakk.net> <200209111312.g8BDCuv08567@vulcan.rissington.net> <200209111544.46249.roy@karlsbakk.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Cc: Netfilter mailinglist <netfilter@lists.netfilter.org>

Hi,

Roy Sigurd Karlsbakk wrote:

>>Use vrrp for this.   The MAC address *is* important too.
>>    
>>
>
>hm ... 
>
>vrrp is a protocol - right?
>
>do you know where I can find a (good?) implementation for it for linux?
>
http://www.keepalived.org
http://www.linuxvirtualserver.org/~acassen/

you only need the vrrp component of keepalived (--disable-lvs ;-)

Greetz,
Jan.
------------------------- KULeuvenNet ----



