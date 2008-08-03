From: "linuxmc\@libero\.it" <linuxmc@libero.it>
Subject: Re: Help me... please
Date: Sun,  3 Aug 2008 14:12:17 +0200
Message-ID: <K50XWH$4383AA3D9D187A48A82DB26F0FDC5E0B@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linuxmc <linuxmc@libero.it>
Cc: x86ever <x86ever@gmail.com>, netfilter <netfilter@vger.kernel.org>

The strange thing is that this problem occurs only with the rule where hosts are defined with mac address.... the hosts defined with ip address works correctly.
And another very strange thing is that until few days ago, works correctly also the rules defined with mac address. 
Next, i have installed squid proxy server and modified the firewall script in order to grant direct access to outgoing http connection only for 3 hosts (those defined with mac address)...... and boom.... i have this problem.





---------- Initial Header -----------

From      : netfilter-owner@vger.kernel.org
To          : "x86ever" x86ever@gmail.com
Cc          : "netfilter" netfilter@vger.kernel.org
Date      : Sun,  3 Aug 2008 13:55:49 +0200
Subject : Re: Help me... please







> I have verified but the mac address is the same.
> 
> 
> ---------- Initial Header -----------
> 
> From      : "Anatoly Muliarski" x86ever@gmail.com
> To          : "linuxmc@libero.it" linuxmc@libero.it
> Cc          : 
> Date      : Sun, 3 Aug 2008 10:19:38 +0300
> Subject : Re: Help me... please
> 
> 
> 
> 
> 
> 
> 
> > 2008/8/2, linuxmc@libero.it <linuxmc@libero.it>:
> > > I have tried to remove de "-m state --state" but nothing change.
> > > I have attached the section of the firewall log file with the defect. Look to the first and to the last line.....
> > >
> > 
> > Try to check the correspondence between ARP addresses stated in your
> > RULE_9 and the desired IPs to pass through. Hint: arp -a -n on the
> > router. Possibly 192.168.1.54's MAC is DIFFERENT than those in your
> > RULE_9.
> > 
> > -- 
> > Best regards
> > Anatoly Muliarski
> > 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

