From: Michal Martinek <michal.martinek@siemens.com>
Subject: netfilter_queue: how to obtain address info from queued packet
Date: Tue, 23 Jan 2007 11:03:44 +0100
Message-ID: <45B5DD80.70809@siemens.com>
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

Hello all,

I am quite a newbie to the netfilter world, so maybe my approach is 
naive. I would like to block communication coming from/to some ports 
according to the content of packets. Unfortunately these ports are not 
static, so port specific netfilter rule cannot be used. So my question is:

Is it possible to obtain some address info (source/destination address 
and ports) from the packet queued from netfilter?


Thanks in advance for any help,

Michal

