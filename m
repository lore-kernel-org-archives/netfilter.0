From: Unknown <unknown@unknown.invalid>
Subject: Re: Is this config OK, plus where should I be logging...
Date: Mon, 5 Apr 2004 09:14:19 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <48685.6847572655$1081171146@news.gmane.org>
References: <000001c41ad1$692d25b0$0464a8c0@stu> <200404051011.16437.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
From: Alistair Tonner <>
In-Reply-To: <200404051011.16437.Antony@Soft-Solutions.co.uk>
Content-Disposition: inline
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

On April 5, 2004 05:11 am, Antony Stone wrote:
> 
		< much snippage for brevity>
>
> > Also, I currently have an eth0 which is the Un-trusted interface
> > connecting to my DSL modem.
> > I have eth1 which is my trusted LAN and ppp0, which is the virtual
> > interface that comes up when the DSL line is up, pritty much 24/7.
> > However, I base my rules on ppp0 as the un-trusted interface and not
> > eth0, in fact in a previous email, you asked where is eth0? What should
> > I do here?
>
> To be honest I'm not sure - I'm not familiar with that arrangement.   I use
> DSL, however I have an ethernet cable between my firewall and my DSL modem
> and I talk pure IP/ethernet over that - no PPP involved anywhere.   Maybe
> someone else can suggest how you should deal with this.
>


	I'm in the pppoe boat myself.  I have eth0 connected to a DSL modem, and the 
	ineternet pipe is indeed ppp0.  What my system does is come up with 
	eth0 configured to 0.0.0.0 to get the pppoe tunnel running, then after its
	up configures eth0 to the ip address range that the modem itself talks
	on (10.0.3.x in my case) and then drops all traffic initiated from the modem 
	side. I allow out ONLY telnet (to allow management of the modem in those freaky 
	moments when someone is playing in the CO) and related established back in,
	based on the source ip of the modem. -- works for me.
	
	This causes no havoc for me since my internal lan is on a different 10. subnet and
	since there really aren't too many 'sploits that can get back through the modem 
	I'm probably being paranoid.  In this configuration the modem doesn't 'exist' on the 
	internet, nor is it a device that can be connected to --- it HAS no ip address on the internet,
	the internet IP is attached to the ppp0 device on my machine.


	Alistair Tonner

	(on an aside Anthony ... what value do you see in a smoll system config of breaking the traffic down
	into user chains based on direction of traffic? -- and only using the builtins to get the packets into those
	user chains?)

