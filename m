From: Tobias Hintze <th@hbsn.de>
Subject: NAT-HOWTO erreta?
Date: Mon, 5 Jan 2004 23:33:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040105223333.GA27409@hbsn.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

hi,

i think i just noticed a mistake in your NAT-howto...
(http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO.html)

section 5.2 Finer Points Of Selecting What Packets To Mangle

4th paragraph:

"These options must follow the `-p' option (which has a side-effect of
loading the shared library extension for that protocol). You can use
port numbers, or a name from the /etc/services file."

we talk about protocols here. not ports! so /etc/protocols is the right
reference not /etc/services.

so i'd suggest:

s/port numbers/protocol numbers/
and s,/etc/services,/etc/protocols,

or am i horribly wrong?

regards,
th
-- 
Tobias Hintze http://hbs-solutions.de
HBS solutions GbR - Network & Information Systems

