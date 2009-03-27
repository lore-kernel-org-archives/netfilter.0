From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Verify rules
Date: Fri, 27 Mar 2009 23:49:31 +0100
Message-ID: <49CD57FB.4010008@chello.at>
References: <e4bd24ae0b0148637ca48bf14e29b27a.squirrel@www.dcsnow.com>    <49CBD634.4000203@gmail.com> <c8c16aac285fb28dc9a3c09a70855718.squirrel@www.dcsnow.com> <49CBE955.7030507@gmail.com> <0d6001c9ae55$10b9e040$322da0c0$@net> <49CC88BC.8090201@chello.at> <15a901c9aeff$9bc91570$d35b4050$@net> <49CD1FBC.4020604@mailinator.com> <49CD21E5.7050908@mailinator.com> <162301c9af15$1f45ec60$5dd1c520$@net> <49CD2F2E.3050508@mail.theorb.net> <162f01c9af18$52a01ab0$f7e05010$@net>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <162f01c9af18$52a01ab0$f7e05010$@net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

netfilter-owner@vger.kernel.org wrote:
> That was it - works perfectly.  Now I have a base-line and can start
> tweeking and logging from there.  I will do as others have suggested, and
> either only allow SSH from one IP address or range, OR use the pubkey
> suggestion.
>
>
>  > -A INPUT -p icmp -m icmp --icmp-type any -j ACCEPT
>   

Also think of maybe not allowing all icmp types. Some you might not 
want, as redirects for example.
suggestion:

iptables -N icmp_input
-A icmp_input -p icmp --icmp-type pong -m state --state ESTABLISHED -j 
ACCEPT
-A icmp_input -p icmp --icmp-type destination-unreachable -m state 
--state RELATED -j ACCEPT

... also problem describing, but should not break anything if not 
allowed (AFAIK...): source-quench, time-exceeded, parameter-problem - 
accept in related state also...
-A icmp_input -p icmp -j DROP
-A INPUT -p icmp -j icmp_input

greets

Mart
