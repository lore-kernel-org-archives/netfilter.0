From: john decot <johndecot@yahoo.com>
Subject: how to filter
Date: Sun, 23 Apr 2006 07:19:29 -0700 (PDT)
Message-ID: <20060423141929.41864.qmail@web37707.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi all,
   
  i wish any one help me on filtering syn-flood for
the forward packets. as i have used iptables with
limit:

$IPTABLES -N syn-flood
    $IPTABLES -A FORWARD -p tcp --syn -j syn-flood
$IPTABLES -A syn-flood -m limit --limit 1/s
--limit-burst 4 -j RETURN
    $IPTABLES -A syn-flood -j DROP
 i have faced problem with surfing when there are lots
of subscribers. when i increased limit rule then again
it gives problem during less no. of subscribers.

Could any one help me out from this sort of problem.
Any help will be apprieciated.

Rgrds,
John

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

