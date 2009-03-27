From: Mike Wright <mike@mail.theorb.net>
Subject: Re: Verify rules
Date: Fri, 27 Mar 2009 12:55:26 -0700
Message-ID: <49CD2F2E.3050508@mail.theorb.net>
References: <e4bd24ae0b0148637ca48bf14e29b27a.squirrel@www.dcsnow.com>    <49CBD634.4000203@gmail.com> <c8c16aac285fb28dc9a3c09a70855718.squirrel@www.dcsnow.com> <49CBE955.7030507@gmail.com> <0d6001c9ae55$10b9e040$322da0c0$@net> <49CC88BC.8090201@chello.at> <15a901c9aeff$9bc91570$d35b4050$@net> <49CD1FBC.4020604@mailinator.com> <49CD21E5.7050908@mailinator.com> <162301c9af15$1f45ec60$5dd1c520$@net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <162301c9af15$1f45ec60$5dd1c520$@net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Scott Miller <srmiller@interbel.net>
Cc: netfilter@vger.kernel.org

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


