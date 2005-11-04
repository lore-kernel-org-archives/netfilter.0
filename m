From: "Harrison, James" <james.harrison@americancolor.com>
Subject: Firewall Sending Resets(was Troubleshooting Netfilter Firewall
	(performance issues))
Date: Fri, 04 Nov 2005 15:39:52 -0600
Message-ID: <1131140392.10871.11.camel@localhost.localdomain>
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

List,

We have determined, that during large(50-100MB) file transfers the
firewall is spuriously sending a tcp reset to both server and client.

The same file (which is a compressed format to begin with) when zipped
will copy just fine.

Why does the firewall feel the need to pull down the connection?  The
reset(based on TTL counts) is being sent from the primary internal
interface.

This is devil-linux 1.2.6 i686 SMP (2.4.31)

Thanks


-- 
James Harrison RHCE
Manager, Information Security - American Color
PH: 615-377-7426
FX: 615-377-0325
AIM: harrijh1

