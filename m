From: "Alexis" <alexis@tpys.com.ar>
Subject: Re: IPs blocked still able to connect
Date: Sun, 13 Jun 2004 22:02:57 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001701c451ab$56837610$0200000a@heretic>
References: <200406132359.i5DNx0bJ016290@ylpvm15.prodigy.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter <netfilter@lists.netfilter.org>


----- Original Message ----- 
From: "Spiro Azkoul" <spiro@snacorp.net>
To: <netfilter@lists.netfilter.org>
Sent: Sunday, June 13, 2004 8:59 PM
Subject: RE: IPs blocked still able to connect


>
> Hello,
>
> You should be able to "man iptables"
>
> -> I did, got the info I needed. Thanks.
> I also transferred all my -A rules to -I and an iptables -L INPUT now shows
> priority to the -I rules, which basically should not block any traffic to my
> server.
>
> On the other hand, I have a couple more questions:
>
> 1- If I have 2 Nic Cards, eth0 and eth1, without any kind of NATing
> involved, as I am simply using the private interface for backup jobs, local
> SSH and so forth, should I worry about the FORWARD chain? There is no
> routing between the 2 interfaces nor do I need there be so I assumed so far
> that my INPUT/OUTPUT rules will apply to the public interface without having
> to go the extra step of specifying it.


There's no explicit need of nat to pass the traffic between two interfaces,
without having any nat rule, if you've turned on ip_forwarding, and FORWARD
chain is ACCEPT, traffic will flow between interfaces.



>
> 2- Is there a way to build a text file and have IPTABLES pull from it
> periodically? I know this could be done in perl, but has anyone tried to do
> it with a simple cron job?

the output of iptables-save could help?



> Thanks
>
>
>
>


