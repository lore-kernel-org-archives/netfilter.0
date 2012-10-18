From: Chiara Simoni <chiara.simoni@cnaf.infn.it>
Subject: servers redirection
Date: Thu, 18 Oct 2012 14:39:42 +0200
Message-ID: <032613bb98974765717d7ae8ebe48e3c@imap.cnaf.infn.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Chiara simoni <chiara.simoni@cnaf.infn.it>

Hi,
I need to redirect all requests to my server "Xserver:Xport", to server 
"Yserver:Yport".

For some months I've been using these iptables commands,
with Destination NAT and Source NAT on server "Xserver":

/sbin/iptables -t nat -A PREROUTING  -p tcp -d "$Xserver" --dport 
"$Xport"  -j DNAT --to-destination "$Yserver:$Yport"
/sbin/iptables -t nat -A POSTROUTING -p tcp -d "$Yserver" --dport 
"$Yport" -j SNAT --to-source "$Xserver"

Now, these same commands don't work any more,
and I don't now why.
Recently the only changes I made on my servers
is a reboot.

Can you help me?
Have I made some mistakes on these commands?

Thanks

Ch.

