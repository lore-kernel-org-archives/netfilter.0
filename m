From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: logging mac address
Date: Wed, 16 Jul 2003 09:23:38 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0192BE@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>, Antonio Paulo Salgado Forster <aforster@br.ibm.com>
Cc: netfilter@lists.netfilter.org

>>It makes sense though that you don't get that in FORWARD since the =
routing
decision has not yet been made.

Sorry, that's not true, routing decision HAS been made which is why it's =
FORWARDing onto another interface. But remember that MAC addresses are =
visible only as they come off the wire.. that's what I've found.. so =
INPUT and PREROUTING see it but once they are in, the macs are dropped =
off into limbo...

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

Phone   : +61 2 9955 2644
HelpDesk: +61 2 9955 2698
=20

