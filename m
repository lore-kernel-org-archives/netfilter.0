From: "jimbo jones" <jdvuyk_crap@hotmail.com>
Subject: Errors with POM
Date: Wed, 03 Sep 2003 13:19:00 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Sea1-F165avjrRZ1UbD0001ce09@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I have been struggling to get POM to work for quite a while now and its 
getting frustrating.
I am following the netfilter-extensions-HOWTO when I get the following 
error:

[root@localhost userspace]# make patch-o-matic
Making dependencies: please wait...
Something wrong... deleting dependencies.
make: *** 
[/usr/src/linux-2.4.20-20.8/include/linux/netfilter_ipv4/ipt_CLASSIFY.h] 
Error 1

Of course ipt.CLASSIFY.h does not exsist in this location which is causing 
the error.  How can I get around or resolve this issue so that I can get POM 
to run.

I have also tried the make patch-pending as suggested in other posts but get 
the same error for that as well.

Redhat 8
Kernel = linux-2.4.20-20.8
Iptables = 1.2.8-8.80.2
(both installed using apt-get)

Ideas greatfully appreciated.
Thanks
Jamie

_________________________________________________________________
Stay in touch with absent friends - get MSN Messenger 
http://www.msn.co.uk/messenger


