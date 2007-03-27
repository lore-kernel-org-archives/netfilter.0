From: Julian Hagenauer <chaosbringer@gmx.de>
Subject: Droping all SYN
Date: Tue, 27 Mar 2007 15:15:21 +0200
Message-ID: <20070327151521.371d4312@notebook.chaosbringer.de>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,
this may be a simple Question.
I have a xen-domain which is acting as a server.
For some experiments i want, that every attempt to connect to a services on this server is blocked, but none of the existing connections is affected. 
So, the ip of the server is 192.168.1.4 and the interface on dom0 is vif1.0. Dom0 acts as a arpproxy.
Would 'iptables -A FORWARD -d 192.168.1.4 -o vif1.0 -p tcp --syn -j DROP' enough?

Its crucial for me, so i have to be sure that the syntax is correct.

Thanks,
Julian

