From: Zainul M Charbiwala <zainul@ee.iitb.ac.in>
Subject: Loose Routing Query
Date: Fri, 31 Jan 2003 16:42:54 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030131164254.080e5942.zainul@ee.iitb.ac.in>
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


Hi,

I would like to know how (and where) netfilter processes IP pkts with
source routing option. 

From observed behaviour, I figure that all incoming (from external
interface) pkts with options must be NF_DROPped, but I can't seem to find
the code segment which does this processing.

Does netfilter masquerade pkts with the source routing option set ?


Thanks,

Zainul.

-- 


