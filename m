From: Vinod Chandran <vinod_chandran@multitech.co.in>
Subject: FTP Bounce Attack
Date: Fri, 28 Jan 2005 21:08:48 +0530
Message-ID: <41FA5C88.7040403@multitech.co.in>
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

Hi,

I am currently using iptables 1.2.11 with the patch-o-matic patch applied.
Its documented that netfilter is patched to  protect against FTP bounce 
attacks, when an invalid IP is given in the FTP PORT command.
I can detect the PORT command reaching the FTP server through the 
router( containing netfilter), even when I give an ivalid IP.
I would like to know whether the patch is not working or whether the 
patch is meant to not allow the resulting bounce attack, even with 
allowing the PORT command to pass through.

Thanks and Regards,
Vinod C



