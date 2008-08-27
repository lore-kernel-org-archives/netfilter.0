From: sean darcy <seandarcy2@gmail.com>
Subject: DNAT'ing print from XP to Brother 2070N
Date: Tue, 26 Aug 2008 21:40:52 -0400
Message-ID: <g92bb5$1uf$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

We're running XP in one office. I'd like to be able to print to a 
"network ready" Brother 2070N in another office, and in my home.

I can print to the 2070N over a local network using ipp ( 
10.10.11.151:631 ) and lpd ( 10.10.11.151:9100 ).

In the office I have set up iptables like so:

$IPT -t nat -A PREROUTING -d 10.10.11.151 -p tcp --dport 631 -j DNAT 
--to $HOME_ADDRESS:631
$IPT -A FORWARD -p tcp -m state --state NEW -d $HOME_ADDRESS --dport 631 
-j ACCEPT

and set up my home iptables:

$IPT -t nat -A PREROUTING -i $EXTIF -p tcp --dport 631 -j DNAT --to 
10.10.11.151:631
$IPT -A FORWARD -p tcp --dport 631 -m state --state NEW -d 10.10.11.151 
-j ACCEPT

The xp machine is set to use 10.10.11.151:631, raw. I've installed the 
2070N driver on XP.

I've also tried using port 9100.

But it doesn't work. I realize this is a combination, linux - xp , 
printing and dnat issue, but I thought I'd start here. Anybody else 
doing this? Any suggestions of other lists that might be useful?

Thanks for any help.

sean

