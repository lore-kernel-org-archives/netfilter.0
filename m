From: test@seaconindia.com
Subject: Re: DNAT Problem
Date: Thu, 22 Apr 2004 18:36:09 +0530 (IST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1645.80.0.0.23.1082639169.squirrel@80.0.0.175>
References: <1611.80.0.0.23.1082351242.squirrel@80.0.0.175>
    <200404221207.12965.Antony@Soft-Solutions.co.uk>
    <1589.80.0.0.23.1082637754.squirrel@80.0.0.175>
    <200404221347.13412.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404221347.13412.Antony@Soft-Solutions.co.uk>
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

Hi Anthony

> On Thursday 22 April 2004 1:42 pm, test@seaconindia.com wrote:
>
>> Hi Antony
>>
>> Thanks for your reply, but my problem is as follows
>>
>> I have email server running behind my firewall. Now all request coming
>> from internet are logged as if coming from my firewall. I want the
>> request
>> to be logged with source ip and not with firewall ip.
>
> I know that is your problem.
>
> I believe the change to your MASQUERADE / SNAT rule which I posted is a
> solution to that problem.
>
> If it is not a solution, then post your current ruleset so that we can
> think
> about it further.
>

iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 25 -j DNAT --to
192.168.0.6:25

Regards

Joel

