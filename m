From: "Scott Miller" <srmiller@interbel.net>
Subject: RE: Verify rules
Date: Fri, 27 Mar 2009 14:12:15 -0600
Message-ID: <162f01c9af18$52a01ab0$f7e05010$@net>
References: <e4bd24ae0b0148637ca48bf14e29b27a.squirrel@www.dcsnow.com>    <49CBD634.4000203@gmail.com> <c8c16aac285fb28dc9a3c09a70855718.squirrel@www.dcsnow.com> <49CBE955.7030507@gmail.com> <0d6001c9ae55$10b9e040$322da0c0$@net> <49CC88BC.8090201@chello.at> <15a901c9aeff$9bc91570$d35b4050$@net> <49CD1FBC.4020604@mailinator.com> <49CD21E5.7050908@mailinator.com> <162301c9af15$1f45ec60$5dd1c520$@net> <49CD2F2E.3050508@mail.theorb.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49CD2F2E.3050508@mail.theorb.net>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Mike Wright' <mike@mail.theorb.net>
Cc: netfilter@vger.kernel.org

That was it - works perfectly.  Now I have a base-line and can start
tweeking and logging from there.  I will do as others have suggested, and
either only allow SSH from one IP address or range, OR use the pubkey
suggestion.

Thanks!
Scott Miller

-----Original Message-----
From: netfilter-owner@vger.kernel.org
[mailto:netfilter-owner@vger.kernel.org] On Behalf Of Mike Wright
Sent: Friday, March 27, 2009 1:55 PM
To: Scott Miller
Cc: netfilter@vger.kernel.org
Subject: Re: Verify rules

Mike Wright wrote:
 > Scott Miller wrote:
 >> Thanks for the suggestions
 >
 > *filter
 > :INPUT DROP [0:0]
 > :FORWARD ACCEPT [0:0]
 > :OUTPUT ACCEPT [0:0]
 > -A INPUT -m state --state ESTABLISHED,RELATED
                                                  ^^^^^^^^
Sorry, it's been a long week.  The above line should read:

 > -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

 > -A INPUT -i lo -j ACCEPT
 > -A INPUT -p icmp -m icmp --icmp-type any -j ACCEPT
 > -A INPUT -p tcp -m multiport --dports 22,25,53,80,110,873,993,10000 -m
 > state --state NEW -j ACCEPT
 > -A INPUT -p udp -m multiport --dports 53,123,873 -m state --state NEW -j
 > ACCEPT
 > -A INPUT -p tcp --dport 113 -j REJECT --reject-with tcp-reset
 > COMMIT


--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
No virus found in this incoming message.
Checked by AVG - www.avg.com 
Version: 8.0.238 / Virus Database: 270.11.28/2022 - Release Date: 03/27/09
07:13:00

