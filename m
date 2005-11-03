From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Re: iptables problem (nfcan: addressed to
	exclusivesender for this address)
Date: Thu, 3 Nov 2005 18:17:28 +0100
Message-ID: <20051103172314.5DFC26AA58@smtp.sterenborg.info>
References: <20051103162346.GA31304@zion.homelinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051103162346.GA31304@zion.homelinux.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> you say "their" system works based on the packet they first
> receive when contacting them. So with multiple IPs, wouldn't
> it work to let each kiosk contact the server via its own IP
> address via SNAT??
> E.g. kiosk 1 which is internally 1.2.3.4 gets natted to the
> public ip 5.6.7.8, so when it contacts the server it will
> establish a connection back to 5.6.7.8 which will in turn be
> DNATted to 1.2.3.4.
> kiosk 2 (1.2.3.5) --> 5.6.7.9
> and so on...

Yes this could work. Stupid I didn't think of it.

Ext_ip1 -(DNAT)-> Int_ip1
Ext_ip2 -(DNAT)-> Int_ip2
Ext_ip3 -(DNAT)-> Int_ip3

But then (reading OP's other post : "And I can't tell the other company
to send data to separate IPs either because their system works based on
the packet they first receive when the kiosk contacts them") you should
also SNAT to different externals IP's :

Int_ip1 -(SNAT)-> Ext_ip1
Int_ip2 -(SNAT)-> Ext_ip2
Int_ip3 -(SNAT)-> Ext_ip3

> I haven't read the whole thread, so it might be that I missed
> something :-) 

I think not ;^)


Gr,
Rob


