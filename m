From: test@seaconindia.com
Subject: Re: DNAT Problem
Date: Fri, 23 Apr 2004 17:52:25 +0530 (IST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1517.80.0.0.23.1082722945.squirrel@80.0.0.175>
References: <1611.80.0.0.23.1082351242.squirrel@80.0.0.175>
    <200404221421.44015.Antony@Soft-Solutions.co.uk>
    <13723.80.0.0.2.1082657890.squirrel@202.149.196.178>
    <200404222013.26552.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404222013.26552.Antony@Soft-Solutions.co.uk>
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

Hi Antony

> On Thursday 22 April 2004 7:18 pm, test@seaconindia.com wrote:
>
>> > > iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 25 -j DNAT --to
>> > > 192.168.0.6:25
>> >
>> > I don't believe that can be your complete ruleset.
>> >
>> > I see nothing wrong with the above rule as it stands, however on its
>> own
>> > it's not much good - you need a FORWARD rule to allow packets through
>> to
>> > the mail server as well.
>>
>> Can you give me an example of the forward rule set.
>
> iptables -A FORWARD -d a.b.c.d -p tcp --dport 25 -j ACCEPT
>
> where a.b.c.d is the real (internal) IP address of your mail server.
>

I modified my script as suggested by you but no luck

>> > Anyway, I thought (I may be mistaken) that the problem was not with
>> the
>> > inbound DNAT, but with SNAT?
>
> I repeat the statement immediately above.
>
>> Or shall I attach my complete bash script ? (is it ok ?)
>
> Please do post the smallest ruleset which demonstrates the problem (ie it
> allows access to your internal mailserver, but all accesses appear to be
> from
> the firewall's IP address).
>

Please find below the SMTP log of my email server

++++++++++++++++++
@4000000040890aad255365a4 tcpserver: pid 30530 from 192.168.0.151
@4000000040890aad2a6f2e9c tcpserver: ok 30530
mail.localmail.com:192.168.0.6:25 :192.168.0.151::1592
++++++++++++++++++

Please note
Firewall IP = 192.168.0.151
Email Server IP = 192.168.0.6

Regards

Joel

