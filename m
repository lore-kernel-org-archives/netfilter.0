From: Martijn Lievaart <m@rtij.nl>
Subject: Re: One little problem I don't understand
Date: Thu, 10 Aug 2006 14:13:09 +0200
Message-ID: <44DB22D5.8010004@rtij.nl>
References: <44DA422F.7000306@cdvultur.com> <44DAE1DC.3080801@rtij.nl>
	<44DAE67F.3010702@cdvultur.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44DAE67F.3010702@cdvultur.com>
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
To: Costi <costi@cdvultur.com>
Cc: netfilter@lists.netfilter.org

Costi wrote:

[ Please don't top post! ]

>>>
>>> Now my problem is like this:
>>> If I want to connect to ssh to one of the ip's from d A.B.C.D/X all 
>>> my packets are set-marked with 2. The rule with d A.B.C.D/X   is 
>>> above tho one with ssh.
>>> Shouldn't the ssh connection to A.B.C.D/X  be marked with 1 ? If not 
>>> what I am doing wrong.
>>
>>
>>
>> It IS marked with 1, subsequently overwritten by 2 by the second rule.
>>

 > But still isn't iptables  *first rule wins* policy ? From what I know 
iptables runs with this policy?

No, first rule gets executed first. If that is a rule with a terminal 
target, the processing stops there. Otherwise processing continues with 
the next rule.

To get what you want, do this:

$IPT -t mangle -A PREROUTING -i $INT_IF -d A.B.C.D/X  -j  T1
$IPT -N T1
$IPT -A T1 -j MARK --set-mark 1
$IPT -A T1 -j ACCEPT
$IPT -t mangle -A PREROUTING -i $INT_IF -p tcp --dport 22 -j MARK 
--set-mark 2

HTH,
M4


