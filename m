From: Paul Caritj <pcaritj@riovia.net>
Subject: Deleting Rules
Date: Sun, 14 Sep 2003 05:00:11 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F642E1B.8010801@riovia.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Simple Question:

Is it possible to delete rules without complete knowledge of its 
contents? E.g., Would it be possible to delete all rules that match a 
source ip of X?

If not, can anyone reccomend a workaround? I am creating rules on the 
fly and setting them to mark packets with a flag that would not be 
knowable subsequently. (Rather, unknowable unless there is no solution 
to this problem and I am forced to keep some sort of log...eew)


Thanks,
Paul


