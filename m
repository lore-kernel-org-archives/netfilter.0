From: Mike Wright <mike.wright@mailinator.com>
Subject: Re: Verify rules
Date: Thu, 26 Mar 2009 16:35:37 -0700
Message-ID: <49CC1149.3020604@mailinator.com>
References: <e4bd24ae0b0148637ca48bf14e29b27a.squirrel@www.dcsnow.com>    <49CBD634.4000203@gmail.com> <c8c16aac285fb28dc9a3c09a70855718.squirrel@www.dcsnow.com> <49CBE955.7030507@gmail.com> <0d6001c9ae55$10b9e040$322da0c0$@net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <0d6001c9ae55$10b9e040$322da0c0$@net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Scott Miller wrote:
> I was wondering if I could get someone to verify my rules.  What I am trying
> to do to start with, is make only certain ports available on my outgoing
> mail server - essentially blocking all other ports not listed.  I have the
> below on my server in an inactive state because when I activate it, it locks
> it completely down.
> 
> Could someone please take a look at my rules and share with me what I did
> wrong?  Here is my entire config file:
> 
> 
> -----------------------------
> 
> *mangle
> :PREROUTING ACCEPT [6:948]
> :INPUT ACCEPT [6:948]
> :FORWARD ACCEPT [0:0]
> :OUTPUT ACCEPT [7:3269]
> :POSTROUTING ACCEPT [7:3269]
> COMMIT
> *nat
> :OUTPUT ACCEPT [0:0]
> :PREROUTING ACCEPT [0:0]
> :POSTROUTING ACCEPT [0:0]
> COMMIT
> *filter
> :FORWARD ACCEPT [0:0]
> :INPUT ACCEPT [0:0]
> :OUTPUT ACCEPT [0:0]
> # HTTP
> -A INPUT -p tcp -m tcp -m state NEW,ESTABLISHED --dport 80 --state NEW -j
> ACCEPT
> # SSH
> -A INPUT -p tcp -m tcp -m state NEW,ESTABLISHED --dport 22 --state NEW -j
> ACCEPT
> # DNS
> -A INPUT -p tcp -m tcp -m state NEW,ESTABLISHED --dport 53 --state NEW -j
> ACCEPT
> # TIME
> -A INPUT -p udp -m udp -m state NEW,ESTABLISHED --dport 123 --state NEW -j
> ACCEPT
> # WEBMIN
> -A INPUT -p tcp -m tcp -m state NEW,ESTABLISHED --dport 10000 --state NEW -j
> ACCEPT
> # SMTP
> -A INPUT -p tcp -m tcp -m state NEW,ESTABLISHED --dport 25 --state NEW -j
> ACCEPT
> # POP3
> -A INPUT -p tcp -m tcp -m state NEW,ESTABLISHED --dport 110 --state NEW -j
> ACCEPT
> # IMAP
> -A INPUT -p tcp -m tcp -m state NEW,ESTABLISHED --dport 993 --state NEW -j
> ACCEPT
> # RSYNC-TCP
> -A INPUT -p tcp -m tcp -m state NEW,ESTABLISHED --dport 873 --state NEW -j
> ACCEPT
> # RSYNC-UDP
> -A INPUT -p udp -m udp -m state NEW,ESTABLISHED --dport 873 --state NEW -j
> ACCEPT
> # DENY ALL OTHERS
> -A INPUT -i eth0 -j REJECT --reject-with icmp-net-unreachable
> COMMIT
> 
> --------------------------

Hi Scott,

No expert here but I'll give this a try.  This is very basic but 
hopefully may provide some ideas.

You say you want to run a server so that means you should lock down 
everything you specifically don't want to serve.  That's accomplished by 
setting the INPUT chain's default policy to DROP.

#> iptables -P INPUT DROP

Let the network gossip

#> iptables -A INPUT -p icmp -m icmp --icmp-type any -j ACCEPT

We have to be able to talk to ourselves...

#> iptables -A INPUT -i lo -j ACCEPT

...and carry on a conversation.

#> iptables -A INPUT -m state --state ESTABLISHED,RELATED --j ACCEPT

With regard to unwanted traffic: UDP is stateless so we'll let the 
default DROP policy discard that.  TCP is stateful so we may or may not 
want to let the default DROP policy apply.  If we decide against 
dropping unwanted TCP traffic we may want to cleanly terminate those 
connections by resetting them

#> iptables -A INPUT -p tcp -j REJECT --reject-with  tcp-reset


We're ready.  Let's open for business and allow NEW customers

(this one is shopping for SMTP)

#> iptables -A INPUT -p tcp --dport 25 --state NEW -j ACCEPT

(this one is shopping for HTTP)

#> iptables -A INPUT -p tcp --dport 80 --state NEW -j ACCEPT


Hope that is enough to get you going  :m)
