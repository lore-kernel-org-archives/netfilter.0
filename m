From: "Mark Steele" <msteele@inet-technologies.com>
Subject: ipt_string+udp...
Date: Mon, 23 Sep 2002 14:12:06 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <48364.66.46.161.131.1032804726.squirrel@www.funio.com>
Reply-To: msteele@inet-technologies.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Doh!

My bad, disregard the last post I sent. Removing the dot
fixed the problem. Just to enlighten me a bit, what
string would I use if I wanted to use the whole
domain name?



-- 
Mark Steele
Vice president recherche et developpement
Inet Technologies Inc.
email: msteele@inet-technologies.com
tel: (514) 397-4638 ext. 252


>Yes.   You are assuming that a UDP port 53 packet corresponding to a >lookup
>of militaire.org actually contains the literal string "militaire.org".
>
>In fact it doesn't.   Specifically, the dot separating the domain name >from
>the org is not an Ascii 46 (0x2E).
>
>Try changing your string match to look for just "militaire" and see if >that
>works.
>
>Antony.
>
>--
>
>Software development can be quick, high-quality, or low-cost.
>
>The customer gets to pick any two out of three.






