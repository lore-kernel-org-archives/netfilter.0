From: Alistair Tonner <Alistair@alistairt.ath.cx>
Subject: Re: pptp + iptables MTU ???
Date: Tue, 17 Sep 2002 12:40:42 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020917164042.GC9482@Ajftl1.ajfthome.on.ca>
References: <20020913173529.41af8435.pulsar@bofh.homeunix.org> <3D8219B0.7070309@bewegungsmelder.de> <20020915111113.OSCA14766.mta05-svc.ntlworld.com@there> <3D8491CE.1010100@bewegungsmelder.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3D8491CE.1010100@bewegungsmelder.de>; from thomas.lussnig@bewegungsmelder.de on Sun, Sep 15, 2002 at 09:57:34 -0400
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: Thomas Lussnig <thomas.lussnig@bewegungsmelder.de>
Cc: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org


	It seems to me that the initial connection would be in TCP
	form, thus this rule will (or at least should) set the rule for
	all subsidiary connections between these two points, be they
	TCP, UDP, or other... but I'm no expert on GRE in any way.
	 
	I'm sure someone will bash me on the head if I'm wrong.

	Alistair


On 2002.09.15 09:57 Thomas Lussnig wrote:
>> 
>> 
>>> i have one question, when TCP packet's where send the filter change 
>>> the
>>> MTU sice (T-Error.com problem)
>>> But i do not acivate such an rule for UDP or GRE Protocol. Is it
>>> possible that this is the source for the
>>> problems with pptp conection over an maserading server ?
>>> 
>> MTU applies to IP packets, not specifically to TCP packets (which 
>> are a particular form of data inside an IP packet).
>> 
>> UDP and GRE are also transported inside IP packets, so if you need 
>> to set the MTU on your external interface to get TCP/IP packets to 
>> work, I think you should do the same thing for UDP/IP and GRE/IP 
>> packets too.
>> 
>> Antony.
>> 
> Hi,
> i used this as an entry in the iptables. its mentioned in most of the 
> examples. But i think it do not work for
> UPD and GRE. This was the question if GRE/UDP need such spezial 
> handling to maybe this is the problem for
> the failed pptp connections ?
> If yes mean this that i have to adjust the Mtu values on every client 
> behind the server that should use pptp.
> The server have the correct mtu for the ppp0 interface.
> 
> Cu Thomas
> 
> iptables -A FORWARD -j TCPMSS   -o ppp+          -p   tcp 
> --tcp-flags   SYN,RST SYN --clamp-mss-to-pmtu
> 
> 
> 


