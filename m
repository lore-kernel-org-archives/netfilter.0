From: "Seferovic Edvin" <edvin.seferovic@kolp.at>
Subject: logging and droping bad tcp packets
Date: Mon, 17 Oct 2005 09:53:58 +0200
Message-ID: <5732.68048833615$1129535670@news.gmane.org>
Reply-To: edvin.seferovic@kolp.at
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

 

I would like to log and drop bad TCP packets on all my interfaces... but in
my eyes it means that I would have to write every rule three times. Is there
a way to simplify this or should I really write those rules for every
interface.. or can I just enter eth+ in the input chain for all my ethernet
interfaces? 


Thank you in advance

 

Regards,

 

Edvin Seferovic

 

 

 

