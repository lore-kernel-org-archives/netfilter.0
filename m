From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Internal ip exiting network on firewall external nic despight rule
Date: Fri, 20 Sep 2002 22:44:21 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020920214423.TTIJ295.mta06-svc.ntlworld.com@there>
References: <000d01c260e8$df710380$0801a8c0@s3ac>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000d01c260e8$df710380$0801a8c0@s3ac>
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

On Friday 20 September 2002 10:01 pm, Rowan Reid wrote:

> > Ugh !!!   This is a horrible way to connect a firewall.....
> >  Why ????
> >
> > Antony.
>
> I realize this, the reason being is there are other machines that have
> public IP's specifically my VPN. Since I have found no stable support
> for Masquarading VPN traffic

Sounds like you're using the wrong sort of VPN.   IPsec has very successful 
and stable support under Linux, works well through netflter, including under 
NAT, and the FreeS/WAN implementation works well with other vendors'ystems on 
the remote gateway.

If you're trying to use PPTP then I agree you'll have problems.

> I placed it on the external net. Which is
> basically a hub sharing my T1 my firewall and VPN machine.

That does not explain why you would even consider plugging both the internal 
and external interfaces of your firewall into the same switch / hub.

If you have other machines which require a public IP address, and which you 
do not want to NAT, then you have a switch / hub on the external interface of 
your firewall, connecting together anything which has a genuine public IP 
address (eg router, firewall, VPN gateway).

Then you have a different switch / hub on the internal interface of your 
firewall, joining it to all the machines on your internal network.   The 
firewall is the only physical connection between the inside and the outside, 
therefore it can act as a filter to decide what traffic is allowed and what 
isn't.

If you do not physically separate the internal and external networks (eg you 
join them to the same switch / hub) you will have problems.

Antony.

-- 

The difference between theory and practice is that
in theory there is no difference, whereas in practice there is.

