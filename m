From: Marc Haber <mh+netfilter@zugschlus.de>
Subject: Re: Question; what is this netfilter logfile entry ?
Date: Sun, 14 Nov 2004 08:42:11 +0100
Message-ID: <20041114074211.GB27066@torres.ka0.zugschlus.de>
References: <1100392955.4894.25.camel@localhost.localdomain>
	<000c01c4c9f0$4807a0d0$de0aa8c0@comp>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000c01c4c9f0$4807a0d0$de0aa8c0@comp>
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
Content-Transfer-Encoding: 7bit
To: Bo Jacobsen <subs@systemhouse.dk>
Cc: netfilter <netfilter@lists.netfilter.org>

On Sun, Nov 14, 2004 at 03:18:46AM +0100, Bo Jacobsen wrote:
> Nov 14 02:24:48 WF1-HOME kernel: DENY-OUT:.IN= OUT=eth0 SRC=192.168.1.2 DST=198.41.0.4 LEN=560 TOS=0x00 PREC=0xC0 TTL=64 ID=3123 PROTO=ICMP TYPE=3 CODE=3 [SRC=198.41.0.4 DST=192.168.1.2 LEN=532 TOS=0x00 PREC=0x00 TTL=49 ID=41159 PROTO=UDP SPT=53 DPT=51981 LEN=512 ]
> 
> It looks like ICMP with an embedded DNS call  ?.
> What is it exactly, and how would a rule to allow this look like ?

That's a "destination unreachable" triggered by the DNS call (probably
an answer packet) mentioned there.

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Mannheim, Germany  |  lose things."    Winona Ryder | Fon: *49 621 72739834
Nordisch by Nature |  How to make an American Quilt | Fax: *49 621 72739835

