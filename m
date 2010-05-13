From: Markus Feldmann <feldmann_markus@gmx.de>
Subject: Re: iptables NEW or SYN
Date: Thu, 13 May 2010 19:42:28 +0200
Message-ID: <hshdm4$dfr$1@dough.gmane.org>
References: <hshbmv$547$1@dough.gmane.org> <alpine.LSU.2.01.1005131916320.9398@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1005131916320.9398@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Ok i post some important rules, but i think nobody will watch this:




1.        iptables -N attacksinput
2.        iptables -A INPUT -i "$DSLIF" -j attacksinput
3.        iptables -A attacksinput -m state --state ESTABLISHED,RELATED 
-j RETURN
4.        iptables -A attacksinput -m recent --rcheck -m hashlimit 
--hashlimit-name attacksinput_bl --hashlimit-upto 6/hour 
--hashlimit-burst 20 --hashlimit-mode srcip -j LOG --log-level info 
--log-prefix "attacksinput(bl): "
5.        iptables -A attacksinput -m recent --update --seconds 600 -j DROP
6.        iptables -A attacksinput -p tcp -m state --state NEW -m 
multiport --dports 1:79,81:442,444:65535 -m hashlimit --hashlimit-name 
attacksinputnot_80 --hashlimit-upto 6/hour --hashlimit-burst 20 
--hashlimit-mode srcip -j LOG --log-level info --log-prefix 
"attacksinput(!80): "
7.        iptables -A attacksinput -p tcp -m state --state NEW -m 
multiport --dports 1:79,81:442,444:65535 -m recent --set -j DROP
8.        iptables -A attacksinput -p tcp -m state --state NEW -m 
hashlimit --hashlimit-name http --hashlimit-upto 6/hour 
--hashlimit-burst 20 --hashlimit-mode srcip --dport 80 -j RETURN
9.        iptables -A attacksinput -p tcp -m state --state NEW -m 
hashlimit --hashlimit-name https --hashlimit-upto 6/hour 
--hashlimit-burst 20 --hashlimit-mode srcip --dport 443 -j RETURN
10.       iptables -A attacksinput -p icmp --icmp-type 8 -j RETURN
11.       iptables -A attacksinput -m state --state NEW,INVALID -m 
hashlimit --hashlimit-name attacksinput_new_inv --hashlimit-upto 6/hour 
--hashlimit-burst 20 --hashlimit-mode srcip -j LOG --log-level info 
--log-prefix "attacksinput(NEW,INVALID): "
12.       iptables -A attacksinput -m state --state NEW,INVALID -m 
recent --set -j DROP
13.       iptables -A attacksinput -m hashlimit --hashlimit-name 
attacksinput_rest --hashlimit-upto 6/hour --hashlimit-burst 20 
--hashlimit-mode srcip -j LOG --log-level info --log-prefix "attacksinput: "
14.       iptables -A attacksinput -m recent --set -j DROP





Description:
All Packets from the Internet, which comes over ppp0 and want to go into 
my Apache-Server, goes into the chain "attacksinput". Only connections 
to port 80 and 443 are valid and RETURN to the mein chain, all other 
will be logged and dropped.

I friend tried to connect to my server, but couldnt establish a 
connection, here is the log:
https://debianforum.de/forum/pastebin.php?mode=view&s=34615

His computer tries several times to connect, but it fails. The first 
tries send the SYN Flag. Normaly it should be catched by my rule 9 but 
it would catched by the rule 11.

Any idea ?

Regards Markus

