From: Javier Ramirez Molina <jramirez@ip-cable.com>
Subject: Iptables Unknown Error
Date: Thu, 02 Feb 2006 10:17:39 +0100
Message-ID: <43E1CE33.5040706@ip-cable.com>
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
To: netfilter@lists.netfilter.org

Good Morning, I have installed iptables from sources as described in:
http://pastebin.ca/39582

And I have this complete ruleset:
http://pastebin.ca/39577

And I having these errors:

/sbin/iptables -t mangle -A ms-all-chains -m connmark --mark 0xebc013d6 -j
ms-chain-eth0-1:21
Error: iptables: Unknown error 4294967295


Any Clue?

Thanks

-- 
Un Saludo
Javier Ramirez Molina
Departamento Ingenieria  IP-Cable
Tfno: 951230266 


