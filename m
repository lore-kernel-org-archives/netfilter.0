From: "Michael K" <micke@klintan.se>
Subject: discard TCP SYN
Date: Wed, 6 Aug 2003 13:32:03 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c35c0e$5ba651f0$c800a8c0@klintan.local>
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
To: netfilter@lists.netfilter.org

My firewall have default policy to drop (in, out & fwd)
Some protocols are open for communications, such as tcp/80, ftp/21 from
the internet
Then I use stateful inspection, accepting estabished,related.
However, the nessus scanner is reporting this:
-----
The remote host does not discard TCP SYN packets which
have the FIN flag set.

Depending on the kind of firewall you are using, an
attacker may use this flaw to bypass its rules.

See also :
http://archives.neohapsis.com/archives/bugtraq/2002-10/0266.html
http://www.kb.cert.org/vuls/id/464113

Solution : Contact your vendor for a patch
Risk factor : Medium
BID : 7487
Nessus ID : 11618
----
Should I be worried? The remote host is Windows 2000 server.
Should I drop syn? iptables -A FORWARD -p tcp --tcp-flags SYN,FIN
SYN,FIN -j DROP

regards Klintan



