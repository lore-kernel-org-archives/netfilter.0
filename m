From: Mihai Tanasescu <mihai@duras.ro>
Subject: Basic dummy iptables SNAT multiple IPs algorithm question
Date: Fri, 10 Feb 2012 15:46:58 +0100
Message-ID: <4F352DE2.4040106@duras.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi guys,

I've been using iptables and some of the modules it comes with for a
while now but only recently as I stumbled into a big NAT444 setup, did I
reach the point at which I'd like to find an answer to a theoretical
question.

I wanted to ask:
If I have a rule that says:
iptables -t nat -A POSTROUTING -o eth0 -s 192.168.0.0/16 -j SNAT --to
20.20.20.1-20.20.20.22.254

Then how are the IPs from the private pool distributed to the ones from
the public pool in the two following cases:
- with persistent
- with random

Is it a simple mathematical thing like:
if private pool has X IPs ( 65536 in this case) and public Pool (Y) has
let's say 766 IPs in theory =>  X / Y = aprox 85 private IPs per public
IP and then:
- 192.168.0.0-84 =>  20.20.20.1
- 192.168.0.85-169 =>  20.20.20.2
and so on ?
or does this depend on the number of IPs which are online and the
algorithm is a bit more complex ?

Also, what happens in case random is being used to the same algorithm ?

Hope I'm not troubling you too much with theory related questions.

Thanks,
Mihai

