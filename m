From: "James Naples" <oicu812_116@msn.com>
Subject: Cannot find CONFIG_IP_NF_MATCH_STATE in kernel config
Date: Tue, 27 Jun 2006 23:19:03 -0700
Message-ID: <BAY104-F1032D8D540256FFC8DD0C4877F0@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello!

I am trying to follow some directions from 
http://www.gentoo.org/doc/en/hpc-howto.xml and they give some kernel config 
options that should be enabled.  I have located all but 
CONFIG_IP_NF_MATCH_STATE=y, although i did locate a 
CONFIG_NETFILTER_XT_MATCH_STATE=y.  I am wondering if this is the new tag 
for that setting since who knows what kernel version was being referenced to 
in the documentation.  I am guessing that the identifier was updated or 
relocated in the 2.6.16.16 vanilla kernel i am working on.  If someone could 
please point me in the right direction so i have an equivalent setting 
enabled id appreciate it!

P.S.  I did not subscribe to the list since i am not heavily into this 
stuff, just looking for a quick pointer.  Please drop me an email if you 
have any hints for me.  Thanks in advance! :D

-James Naples



