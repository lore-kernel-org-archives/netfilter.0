From: Axel Heinrici <heinrici76@gmx.de>
Subject: ftp connection tracking
Date: Tue, 29 Jul 2003 13:22:04 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200307291322.04698.heinrici76@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Hi

I have problem connecting to a ftp-server on a non-standard port. I 
remember there was an option to be set upon inserting the 
kernel-module. The documentation on module-options seems a little weird 
to me, and I can't find a clear answer.
The Situation is simple. My computer and the router/firewall have 
non-private IPs. Hence no Masquerading/SNAT is done. But the firewall 
has to be set up denying any connection going out except for services 
allowed explicitly. FTP is working fine (even active) when connecting 
to servers on port 21. 
What options do I have to aply when inserting the modules?

greetings
	Axel


