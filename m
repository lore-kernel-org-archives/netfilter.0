From: Tim Evans <tkevans@tkevans.com>
Subject: MAC Addresses in Logfile Entries
Date: Tue, 22 Apr 2003 21:07:24 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304230107.h3N17N5c024243@osprey.tkevans.com>
Reply-To: Tim Evans <tkevans@tkevans.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-MD5: rXuBvvpNYolBZrQAHoWOAw==
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Some of our log entries contain MAC addresses, like this:

Apr 20 10:15:35 foo kernel: IPT IN_FIREWALL: IN=eth1 OUT= 
MAC=00:30:48:11:94:e5:00:d0:ba:45:ec:25:08:00 SRC=XXX.XX.XX.XX 
DST=XXX.XX.XX.XX LEN=40 TOS=0x00 PREC=0x00 TTL=48 ID=0 DF PROTO=TCP 
SPT=1572 DPT=1080 WINDOW=32430 RES=0x00 SYN URGP=0

While others don't:

Apr 14 07:55:35 foo kernel: IPT FORWARD: IN=eth0 OUT=eth1 
SRC=XXX.XX.XX.XX DST=XXX.XX.XX.XX LEN=48 TOS=0x00 PREC=0x00 TTL=127 ID=225 
DF PROTO=TCP SPT=1047 DPT=37 WINDOW=64512 RES=0x00 SYN URGP=0

I see the "OUT" field in the latter contains "eth1" instead of a MAC
address.

Can someone elaborate on the difference here? Thanks.
--
Tim Evans		|    5 Chestnut Court
tkevans@tkevans.com	|    Owings Mills, MD 21117
http://www.tkevans.com/	|    443-394-3864;410-748-0160 (pager)


