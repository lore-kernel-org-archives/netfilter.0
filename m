From: Tim Evans <tkevans@tkevans.com>
Subject: RE: Looking for automation scripts
Date: Sat, 6 Jan 2007 09:55:40 -0500 (EST)
Message-ID: <200701061455.l06EtejU010151@osprey.tkevans.com>
Reply-To: Tim Evans <tkevans@tkevans.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-MD5: b7siQszjsv6DSqmomFWiHw==
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
To: jengelh@linux01.gwdg.de, netfilter@lists.netfilter.org


>denyhosts.sf.net?

This is a great package, but it doesn't touch iptables rules.  Rather, it relies 
on tcp wrapper (ssh must be built with libwrap) and it dynamically adds IP's to 
/etc/hosts.deny
--
Tim Evans, TKEvans.com, Inc.	|    5 Chestnut Court
tkevans@tkevans.com		|    Owings Mills, MD 21117
http://www.tkevans.com/		|    443-394-3864
http://www.come-here.com/News/	|    


