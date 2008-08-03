From: "linuxmc\@libero\.it" <linuxmc@libero.it>
Subject: Re: Help me... please
Date: Sun,  3 Aug 2008 13:55:49 +0200
Message-ID: <K50X51$B11B6471704EC29972DFCEF422049684@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: x86ever <x86ever@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

I have verified but the mac address is the same.


---------- Initial Header -----------

From      : "Anatoly Muliarski" x86ever@gmail.com
To          : "linuxmc@libero.it" linuxmc@libero.it
Cc          : 
Date      : Sun, 3 Aug 2008 10:19:38 +0300
Subject : Re: Help me... please







> 2008/8/2, linuxmc@libero.it <linuxmc@libero.it>:
> > I have tried to remove de "-m state --state" but nothing change.
> > I have attached the section of the firewall log file with the defect. Look to the first and to the last line.....
> >
> 
> Try to check the correspondence between ARP addresses stated in your
> RULE_9 and the desired IPs to pass through. Hint: arp -a -n on the
> router. Possibly 192.168.1.54's MAC is DIFFERENT than those in your
> RULE_9.
> 
> -- 
> Best regards
> Anatoly Muliarski
> 

