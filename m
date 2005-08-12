From: Tim Evans <tkevans@tkevans.com>
Subject: RE: IPTables for Sun Solaris
Date: Thu, 11 Aug 2005 20:26:17 -0400 (EDT)
Message-ID: <200508120026.j7C0QHas028256@osprey.tkevans.com>
Reply-To: Tim Evans <tkevans@tkevans.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-MD5: 1DU8easwXrRfBjmuea79vg==
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
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tkevans@tkevans.com, dufresne@sysinfo.com, codeslinger@gmail.com, Ruiyuan_Jiang@liz.com
Cc: netfilter@lists.netfilter.org


>Does IP Filter contains "libipq library that allows snort_inline to
>interface with iptables. Also, you must build and install LibNet, which
>is available from http://www.packetfactory.net."? 
>
>I don't think I installed IP Filter on Solari 10 but I can install it no
>problem. Once I installed IP Filter, if I follow the rest instruction to
>install snort_inline, will it work? Thanks, Tim.

It does not appear libipq is included.

(I don't use ipfilter on Solaris 10; I just happened to remember that it is 
included--and is a supported Sun package.)
--
Tim Evans, TKEvans.com, Inc.	|    5 Chestnut Court
tkevans@tkevans.com		|    Owings Mills, MD 21117
http://www.tkevans.com/		|    443-394-3864
http://www.come-here.com/News/	|    


