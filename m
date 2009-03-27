From: "Scott Miller" <srmiller@interbel.net>
Subject: RE: Verify rules
Date: Fri, 27 Mar 2009 13:49:20 -0600
Message-ID: <162301c9af15$1f45ec60$5dd1c520$@net>
References: <e4bd24ae0b0148637ca48bf14e29b27a.squirrel@www.dcsnow.com>    <49CBD634.4000203@gmail.com> <c8c16aac285fb28dc9a3c09a70855718.squirrel@www.dcsnow.com> <49CBE955.7030507@gmail.com> <0d6001c9ae55$10b9e040$322da0c0$@net> <49CC88BC.8090201@chello.at> <15a901c9aeff$9bc91570$d35b4050$@net> <49CD1FBC.4020604@mailinator.com> <49CD21E5.7050908@mailinator.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49CD21E5.7050908@mailinator.com>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I tried the following as suggested (removing 53 as this is not a dns
server):

*mangle
:PREROUTING ACCEPT [6:948]
:INPUT ACCEPT [6:948]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [7:3269]
:POSTROUTING ACCEPT [7:3269]
COMMIT
*nat
:OUTPUT ACCEPT [0:0]
:PREROUTING ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
COMMIT
*filter
:INPUT DROP [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -m state --state ESTABLISHED,RELATED -A INPUT -i lo -j ACCEPT -A
INPUT -p icmp -m icmp --icmp-type any -j ACCEPT -A INPUT -p tcp -m multiport
--dports 22,25,80,110,873,993,10000 -m state --state NEW -j ACCEPT -A INPUT
-p udp -m multiport --dports 123,873 -m state --state NEW -j ACCEPT -A INPUT
-p tcp --dport 113 -j REJECT --reject-with tcp-reset COMMIT

However - this seemed to completely lock down the server - I could not
access it via port 1000 or http 80, and it would not accept mail for
delivery (smtp) - not exactly sure what happened.  I had to physically go to
the server, and do a "service iptables stop" to regain access and allow
mail.

I'll do some searching for Jane Dow's example, and read again the netfilter
how-to's and see what I can come up with.

Thanks,
Scott Miller





-----Original Message-----
From: netfilter-owner@vger.kernel.org
[mailto:netfilter-owner@vger.kernel.org] On Behalf Of Mike Wright
Sent: Friday, March 27, 2009 12:59 PM
To: Mike Wright
Cc: netfilter@vger.kernel.org
Subject: Re: Verify rules

Mike Wright wrote:
> Scott Miller wrote:
>> Thanks for the suggestions - I now have the following, combining two 
>> replies
>> I received.

> you may also want to rate limit the number of attempts from the same IP 
> to connect to SSH or you WILL get hammered.  If you search the archives 
> I think *Joanne Dow* posted an example of how to do so.

oops! *Joanne Dow* posted an example of how to do so on the fedora-list.
--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
No virus found in this incoming message.
Checked by AVG - www.avg.com 
Version: 8.0.238 / Virus Database: 270.11.28/2022 - Release Date: 03/27/09
07:13:00

