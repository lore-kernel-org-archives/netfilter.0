From: Tomas Edwardsson <netfilter@tommi.org>
Subject: Re: DCC receive works fine but not SEND
Date: Tue, 26 Nov 2002 10:26:29 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021126102629.GB854@ok.is>
References: <F139s6sJzGKBECcYJlj0002016c@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <F139s6sJzGKBECcYJlj0002016c@hotmail.com>
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
Content-Transfer-Encoding: 7bit
To: Joel Linuxdude <linuxlists@hotmail.com>
Cc: nix@go-nix.ca, netfilter@lists.netfilter.org

RECIEVE problems with DCC are usually problems at the other end.

Remote client sends: DCC SEND file.txt <size> <IP> <port> <size> 
Your client in return connects to  <IP> <port> to initiate the transfer.

I'd suggest that the client you are trying to recieve from is firewalled
in.

- Tomas Edwardsson

On Tue, Nov 26, 2002 at 12:32:00AM -0500, Joel Linuxdude wrote:
> From: "Joel Linuxdude" <linuxlists@hotmail.com>
> To: nix@go-nix.ca, netfilter@lists.netfilter.org
> Subject: Re: DCC receive works fine but not SEND
> Date: Tue, 26 Nov 2002 00:32:00 -0500
> 
> 
> >On Mon, 2002-11-25 at 18:51, Joel Linuxdude wrote:
> >> I can not send files over IRC using DCC but I can receive
> >> them just fine. I played with the firewall script and didnt
> >> have any luck. Maybe its the ISP, but what can I do to ensure
> >> that it will work?
> >>
> >> eth0 = cable modem
> >> eth1 = LAN
> >>
> >> I make sure to do this;
> >> $IPT -t nat -A POSTROUTING -o eth0 -j SNAT --to-source x.x.x.x
> >>
> >> For ports that seem to not get forwarded right I do this;
> >> $IPT -t nat -A PREROUTING -i eth0 -p tcp --dport 6699 -j DNAT --to
> >> 192.168.0.9-192.168.0.20  (WinMX stuff)
> >>
> >> I can not find any specs to tell me what IRC DCC is all about!
> >> Is it TCP or UDP? What port?
> >
> >modprobe ip_nat_irc
> 
> 
> I have a monolithic kernel. Although I dont use modules, I have
> them all compiled right into the kernel. I did compile all of
> the Netfilter IRC modules. Now what? *whimper* *pout*
> 
> 
> _________________________________________________________________
> MSN 8 with e-mail virus protection service: 2 months FREE* 
> http://join.msn.com/?page=features/virus
> 

