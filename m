From: Y Makki <bugzilla@sympatico.ca>
Subject: [Fwd: RE: Windows file sharing over different subnets]
Date: 27 Mar 2003 17:55:16 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048805716.8220.18.camel@psyche>
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
To: "Mailing List: Netfilter" <netfilter@lists.netfilter.org>

I enabled file sharing on the win98 box and shared a folder to test, i
had the same thought you did. 

The win98 client is configured to use 'dns for wins resolution',
although I have done nothing yet with dns on the router box, it runs
bind; I don't know if that is even relevant to be honest. 

I added the client entry into win2k's lmhosts.sam and ran nbtstat- R,
still can't browse the client from the server even with \\192.168.2.2\

Also added the rules mentioned to dnat broadcasts originating on both
subnets to the other one.

Here's something new, a tcpdump on the client (192.168.2.2) while trying
to access it through the win2k server (192.168.1.3):

17:28:12.327623 192.168.2.2.microsoft-ds > 192.168.1.3.1079: R [tcp sum
ok] 0:0(0) ack 228195974 win 0 (ttl 128, id 10240, len 40)
17:28:12.327981 192.168.2.2.netbios-ssn > 192.168.1.3.socks: S [tcp sum
ok] 254406:254406(0) ack 228254317 win 8760 <mss 1460,nop,nop,sackOK>
(DF) (ttl 128, id 10496, len 48)
17:28:12.329218 192.168.2.2.netbios-ssn > 192.168.1.3.socks: FP [tcp sum
ok] 1:6(5) ack 73 win 8688
>>> NBT Packet
NBT SessionReject
Flags=0x83000001
Reason=0x82
Called name not present

 (DF) (ttl 128, id 10752, len 45)


I'm breaking my head over this..



On Thu, 2003-03-27 at 15:15, Daniel Chemko wrote: 
> 1. Is File sharing enabled on the win98 box? I am not sure it is
> 'visible' without it.
> 
> 2. The server is trying to find NetBIOS String ("192.168.2.2") on the
> network, which will fail. The followup would be to search WINS for it.
> If the WINS server on windows 2000 does not have that computer
> registered, then the machine cannot be resolved. Can you look at your
> wins server on 192.168.1.3 and see an entry for your win98 clients that
> allegedly registered with it?
> 
> 3. Make sure the win98 computers are configured for wins automatically.
> Sometimes it is set for manual or disabled wins settings.
> 
> 
> 




