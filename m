From: Costi <costi@cdvultur.com>
Subject: Re: One little problem I don't understand
Date: Thu, 10 Aug 2006 10:55:43 +0300
Message-ID: <44DAE67F.3010702@cdvultur.com>
References: <44DA422F.7000306@cdvultur.com> <44DAE1DC.3080801@rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44DAE1DC.3080801@rtij.nl>
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
To: Martijn Lievaart <m@rtij.nl>
Cc: netfilter@lists.netfilter.org

But still isn't iptables  *first rule wins* policy ? From what I know 
iptables runs with this policy?

Martijn Lievaart wrote:
> Vultur Constantin wrote:
>
>> Hi,
>>
>> I have a little problem understanding the way iptables does the 
>> matching of packets.
>> The problem is like this:
>> I have an subnet A.B.C.D/X which I mark it with --set-mark 1:
>>
>> $IPT -A fw-interfaces -i $INT_IF -s $INT_NET  -d A.B.C.D/X -m state 
>> --state NEW    -j ACCEPT
>> $IPT -t mangle -A PREROUTING -i $INT_IF -d A.B.C.D/X  -j MARK 
>> --set-mark 1
>>
>> and I mark the connections to port 22 ( ssh ) with --set-mark 2
>>
>> $IPT -A fw-interfaces -i $INT_IF -s $INT_NET  -p tcp --dport 22 -m 
>> state --state NEW    -j ACCEPT
>> $IPT -t mangle -A PREROUTING -i $INT_IF -p tcp --dport 22 -j MARK 
>> --set-mark 2  fw-interfaces is used as a custom chain in FORWARD.
>>
>> Now my problem is like this:
>> If I want to connect to ssh to one of the ip's from d A.B.C.D/X all 
>> my packets are set-marked with 2. The rule with d A.B.C.D/X   is 
>> above tho one with ssh.
>> Shouldn't the ssh connection to A.B.C.D/X  be marked with 1 ? If not 
>> what I am doing wrong.
>
>
> It IS marked with 1, subsequently overwritten by 2 by the second rule.
>
> HTH,
> M4
>


