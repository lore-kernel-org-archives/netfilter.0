From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: ftp.netfilter.org and IPv6
Date: Sun, 29 Jul 2007 17:01:39 +0200
Message-ID: <46ACABD3.5000201@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Liste Netfilter <netfilter@lists.netfilter.org>

Hello,

ftp.netfilter.org has an AAAA record which resolves to the IPv6 address 
2001:780:45:1d:20d:93ff:fe9b:e443. But surprisingly it seems that the 
FTP port (21/TCP) on this address is closed. Is this normal ? On the 
other hand the HTTP port (80/TCP) is opened, but I would expect the FTP 
port on a host called ftp.something to be opened.

