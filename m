From: Mike Wright <mike.wright@mailinator.com>
Subject: Re: Verify rules
Date: Fri, 27 Mar 2009 11:49:32 -0700
Message-ID: <49CD1FBC.4020604@mailinator.com>
References: <e4bd24ae0b0148637ca48bf14e29b27a.squirrel@www.dcsnow.com>    <49CBD634.4000203@gmail.com> <c8c16aac285fb28dc9a3c09a70855718.squirrel@www.dcsnow.com> <49CBE955.7030507@gmail.com> <0d6001c9ae55$10b9e040$322da0c0$@net> <49CC88BC.8090201@chello.at> <15a901c9aeff$9bc91570$d35b4050$@net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <15a901c9aeff$9bc91570$d35b4050$@net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Scott Miller wrote:
> Thanks for the suggestions - I now have the following, combining two replies
> I received.  I will implement this afternoon and see what happens.  I am
> also using Webmin to moidify the /etc/sysconfig/iptables file.  If anyone
> sees anything wrong - please let me know.  My goal is to lock down
> everything except for the mentioned ports.  Thanks for your help.
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
> # MODIFIED APRIL 27 2009 11:01AM
> # TALKING TO OURSLEVES IS ALLOWED
> -A INPUT -p icmp -m icmp --icmp-type any -j ACCEPT
> -A INPUT -i lo -j ACCEPT
> # ALLOW THE FOLLOWING TCP PROTOCOLS HTTP, SSH, DNS, WEBMIN, SMTP, POP3,
> IMAP, RSYNC-TCP
> -A INPUT -p tcp -m multiport -m state --state NEW,ESTABLISHED -j ACCEPT
> --dports 22,25,53,80,110,873,993,10000
> # ALLOW THE FOLLOWING UDP PROTOCOLS TIME, RSYNC-UDP
> -A INPUT -p UDP -m multiport -m state --state NEW,ESTABLISHED -j ACCEPT
> --dports 123,873

if you're going to serve dns you must open port 53 to udp

> # DENY ALL OTHERS ETH0
> -A INPUT -i eth0 -j DROP
> # DENY ALL OTHERS ETH0:1
> -A INPUT -i eth0:1 -j DROP

iptables won't accept an alias.  Besides, the previous rule already 
covers the physical device.  if you set the INPUT chain's default policy 
to DROP you don't need either of the above rules.

also consider that you are not allowing RELATED traffic.  for some 
services that is a deal-breaker.

some additional notes:

some outsiders use the ident port (113) to probe for valid users; if you 
don't reset those you could see 30 second delays waiting for the ident 
to fail.  i seem to remember that it impacted mail severely.  by 
resetting those you save time and they get no revealing information out 
of you.

you may also want to rate limit the number of attempts from the same IP 
to connect to SSH or you WILL get hammered.  If you search the archives 
I think *Joanne Dow* posted an example of how to do so.

> COMMIT

Here is a version that may do what you want:

*filter
:INPUT DROP [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -m state --state ESTABLISHED,RELATED
-A INPUT -i lo -j ACCEPT
-A INPUT -p icmp -m icmp --icmp-type any -j ACCEPT
-A INPUT -p tcp -m multiport --dports 22,25,53,80,110,873,993,10000 -m 
state --state NEW -j ACCEPT
-A INPUT -p udp -m multiport --dports 53,123,873 -m state --state NEW -j 
ACCEPT
-A INPUT -p tcp --dport 113 -j REJECT --reject-with tcp-reset
COMMIT
