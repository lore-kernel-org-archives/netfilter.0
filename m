From: "Ranjeet Shetye" <ranjeet.shetye@zultys.com>
Subject: RE: natting specific ports
Date: Fri, 13 Dec 2002 11:34:09 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c2a2de$9bcedca0$0100a8c0@zultys.com>
References: <CAFAAEC91CC8D511952000062938C6F12ECDC4@ozlan.fcdomain.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <CAFAAEC91CC8D511952000062938C6F12ECDC4@ozlan.fcdomain.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


Yes,

You need to DNAT the destination ports and therefore you need to look
for them using the --dport flag extension of the -p tcp/udp flag.

i.e. for telnet you'll have "-p tcp --dport 23".

Ranjeet Shetye
Senior Software Engineer
Zultys Technologies
771 Vaqueros Avenue
Sunnyvale  CA  94085
USA
Ranjeet.Shetye@Zultys.com
http://www.zultys.com/

 


> -----Original Message-----
> From: Simpson, Doug [mailto:DSimpson@friedmancorp.com] 
> Sent: Friday, December 13, 2002 11:19 AM
> To: 'Ranjeet Shetye'
> Subject: RE: natting specific ports
> 
> 
> I want this for traffic going out.  So that my internal 
> clients can send mail and telnet to servers out on the Public 
> Net. I need to use -dport instead of -sport? Thanks, Doug
> 
> -----Original Message-----
> From: Ranjeet Shetye [mailto:ranjeet.shetye@zultys.com]
> Sent: Friday, December 13, 2002 11:58 AM
> To: netfilter@lists.netfilter.org
> Subject: RE: natting specific ports
> 
> 
> 
> Hi Doug,
> 
> Do you want to NAT for traffic coming in or for traffic going out ?
> 
> If you want your internal network to be able to reach 
> external telnet and smtp servers, then your destination port 
> will be 23 or 25, not your source port.
> 
> If you want to host telnet and smtp servers behind a firewall 
> and allow only NATted access to these servers, then you 
> should be using DNAT, not SNAT.
> 
> Hope this helps,
> 
> Ranjeet Shetye
> Senior Software Engineer
> Zultys Technologies
> 771 Vaqueros Avenue
> Sunnyvale  CA  94085
> USA
> Ranjeet.Shetye@Zultys.com
> http://www.zultys.com/
> 
>  
> 
> 
> > -----Original Message-----
> > From: netfilter-admin@lists.netfilter.org
> > [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of 
> > Simpson, Doug
> > Sent: Friday, December 13, 2002 9:49 AM
> > To: 'netfilter@lists.netfilter.org'
> > Subject: natting specific ports
> > 
> > 
> > I want to "NAT" just specific ports to my Public IP.  Do the
> > commands below make sense?  I want my internal network to be 
> > able to telnet and send email. (eth0 is my External NIC - it 
> > is exposed to the internet) 
> > iptables -t nat -A POSTROUTING -p tcp --sport 25 -o eth0 -s 
> > $INTERNAL_IP -j SNAT --to $EXTERNAL_IP iptables -t nat -A 
> > POSTROUTING -p tcp --sport 23 -o eth0 -s $INTERNAL_IP -j SNAT 
> > --to $EXTERNAL_IP
> > 
> > Thank you,
> > Doug
> > 
> 
> 



