From: "J. Bakshi" <joydeep@infoservices.in>
Subject: iptree question
Date: Tue, 08 Sep 2009 11:59:00 +0530
Message-ID: <4AA5F9AC.8000701@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello list,

I am opening this new thread as I am working in a new direction with
ipset ( as many of you suggested ).

The present rules I am using to auto blacklist ips is like below

````````````````````````````
iptables -N syn-flood
iptables -A INPUT -i $IFACE -p tcp --syn -j syn-flood
iptables -A syn-flood -p tcp --syn  -m hashlimit \
--hashlimit 4/sec --hashlimit-burst 4 --hashlimit-htable-expire 300000 \
--hashlimit-mode srcip --hashlimit-name testlimit -j RETURN

# Drop bad IP and put then in blacklist
iptables -A syn-flood -m recent --name blacklist --set -j DROP
`````````````````````````````````

To manage the ips properly I like to save ips  in iptree which is an
option from ipset. Is there any way to migrate the ips from ipt_recent
to iptree ?

Or a new way as below  ?

```````````````````
ipset --create  blacklistIP   iptree --timeout 3600

iptables   -A PREROUTING    blacklistIP   -j DROP


iptables -N syn-flood
iptables -A INPUT -i $IFACE -p tcp --syn -j syn-flood
iptables -A syn-flood -p tcp --syn  -m hashlimit \
--hashlimit 4/sec --hashlimit-burst 4 --hashlimit-htable-expire 300000 \
--hashlimit-mode srcip --hashlimit-name testlimit -j RETURN

# Drop bad IP
iptables  -A  syn-flood  -j DROP

# save the src IP
ipset -N blacklistIP -j SET --add-set src
ipset -N blacklistIP -j syn-flood
``````````````````````

Am I on the right way ?


