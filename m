From: "George J. Jahchan, Eng." <NetFilter-Users@Compucenter.org>
Subject: Floppyfw 2.0.4 & ppp.
Date: Mon, 27 Jan 2003 05:25:19 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NGBBIFPIJNDPMFBPKBPGAECHCPAA.NetFilter-Users@Compucenter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: Netfilter <netfilter@lists.netfilter.org>

I've been trying to get Floppyfw v2.0.4 (kernel 2.4.20 and pppd 2.4.2)
PPPoE/PPP (set up as PPP and using built-in scripts) to dial an ISP without
success.
When invoking /etc/ppp-start it reports: "On <date & time> a connection to
10.64.64.64 was established." But it does not even try to dial thru the
external USR modem on ttyS0. Tried to invoke pppd manually (with the
appropriate options) with similar results.
/bin/pppd file /etc/ppp/options.ppp usepeerdns ttyS0 57600 connect
'chat -v -f /etc/ppp/options.chat
Tested the system under Win2K Pro just to make sure the serial port and
modem are working fine, both are OK.
Did anyone on this list get Floppyfw to dial an ISP? Any hints or
suggestions?
TIA


