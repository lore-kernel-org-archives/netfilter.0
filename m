From: Thomas Lussnig <thomas.lussnig@bewegungsmelder.de>
Subject: Re: pptp + iptables MTU ???
Date: Sun, 15 Sep 2002 15:57:34 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D8491CE.1010100@bewegungsmelder.de>
References: <20020913173529.41af8435.pulsar@bofh.homeunix.org> <3D8219B0.7070309@bewegungsmelder.de> <20020915111113.OSCA14766.mta05-svc.ntlworld.com@there>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

>
>
>>i have one question, when TCP packet's where send the filter change the
>>MTU sice (T-Error.com problem)
>>But i do not acivate such an rule for UDP or GRE Protocol. Is it
>>possible that this is the source for the
>>problems with pptp conection over an maserading server ?
>>    
>>
>MTU applies to IP packets, not specifically to TCP packets (which are a 
>particular form of data inside an IP packet).
>
>UDP and GRE are also transported inside IP packets, so if you need to set the 
>MTU on your external interface to get TCP/IP packets to work, I think you 
>should do the same thing for UDP/IP and GRE/IP packets too.
>
>Antony.
>
Hi,
i used this as an entry in the iptables. its mentioned in most of the 
examples. But i think it do not work for
UPD and GRE. This was the question if GRE/UDP need such spezial handling 
to maybe this is the problem for
the failed pptp connections ?
If yes mean this that i have to adjust the Mtu values on every client 
behind the server that should use pptp.
The server have the correct mtu for the ppp0 interface.

Cu Thomas

iptables -A FORWARD -j TCPMSS   -o ppp+          -p   tcp --tcp-flags   
SYN,RST SYN --clamp-mss-to-pmtu


