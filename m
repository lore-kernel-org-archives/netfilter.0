From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: bandwidth-limiting on LAN interface egress (2)
Date: Wed, 16 Nov 2011 23:06:58 -0600
Message-ID: <op.v42q5wazx1lyi3@debiandesk2.net>
References: <op.v41qaj2hx1lyi3@debiandesk2.net>
 <1321480803.2382.62.camel@andybev-desktop> <op.v419zu1bx1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <op.v419zu1bx1lyi3@debiandesk2.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: netfilter@vger.kernel.org

I was under the impression that one could define an HTB qdisc, then set up bandwidth classes for of it, then use u32 filters matching on LAN IP numbers to assign the flows for several IPs to the same HTB class.  I tried that and found that the total bandwidth of the class is shared among the connections, which is not what I wanted or expected!

Apparently for bandwidth-limiting to work there needs to be a HTB class declared for *each* user IP number!  This certainly makes sense if the sum of classes' rates should total the rate of the containing HTB.

Andy, you wrote:
"My personal opinion is that you shouldn't limit per user. You should
instead prioritise traffic properly. This way you'll have a lot less
classes and a lot less overhead."

Now I understand what you mean by "a lot less classes"!

Unless someone corrects me, I will assume that there is no way to use filters to assign several "flows" (by user IP) to the same class, such that each flow gets the class's full configured rate.

This leads me to another question: Consider the case where there are 50 users, each with 1 Mbit download rate, but statistics show that all 50 *never* require the full bandwidth, and that a total 35 Mbit total connection rate is sufficient.  Should in this case the HTB qdisc be configured to have total 35 Mbit (or slightly less), even though the sum of all classes' rates will be 50 Mbit?

This might answer my question, or it is an error on the lartc site:

http://lartc.org/howto/lartc.qdisc.classful.html#AEN903 shows an example in which the sum of classes' rates is higher than the total HTB qdisc rate:

"9.5.5.1. Sample configuration

Functionally almost identical to the CBQ sample configuration above:

# tc qdisc add dev eth0 root handle 1: htb default 30

# tc class add dev eth0 parent 1: classid 1:1 htb rate 6mbit burst 15k

# tc class add dev eth0 parent 1:1 classid 1:10 htb rate 5mbit burst 15k
# tc class add dev eth0 parent 1:1 classid 1:20 htb rate 3mbit ceil 6mbit burst 15k
# tc class add dev eth0 parent 1:1 classid 1:30 htb rate 1kbit ceil 6mbit burst 15k"

Thanks in advance for any advice.
