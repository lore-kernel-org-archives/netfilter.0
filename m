From: "mdpeters" <michael.peters@lazarusalliance.com>
Subject: Re: transparent bridge troubles?
Date: Fri, 7 Jan 2005 17:01:47 -0500
Message-ID: <005101c4f504$7be50f20$3e0010ac@esonet18>
References: <7C9884991ADAE0479C14F10C858BCDF591E3AC@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Daniel Chemko <dchemko@smgtec.com>, Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

Both host and target have no information about the bridge | firewall in the 
middle.


----- Original Message ----- 
From: "Daniel Chemko" <dchemko@smgtec.com>
To: "mdpeters" <michael.peters@lazarusalliance.com>; "Jason Opperisano" 
<opie@817west.com>; <netfilter@lists.netfilter.org>
Sent: Friday, January 07, 2005 4:38 PM
Subject: RE: transparent bridge troubles?


mdpeters wrote:
> Du'oh!
>
> I changed it and this is what I see so far. I'm running a Nessus scan
> on one side of the bridge and the target system is at the other side
> of the bridge.
>
> PRE QUEUEIN=safetynet0 OUT=safetynet0 PHYSIN=eth2 PHYSOUT=eth1
> SRC=68.16.185.132 DST=68.16.185.130 LEN=41 TOS=0x00 PREC=0x00 TTL=64
> ID=3072 PROTO=TCP SPT=3133 DPT=45495 WINDOW=2048 RES=0x00 ACK URGP=0
>
> POST QUEUEIN=safetynet0 OUT=safetynet0 PHYSIN=eth2 PHYSOUT=eth1
> SRC=68.16.185.132 DST=68.16.185.130 LEN=41 TOS=0x00 PREC=0x00 TTL=64
> ID=3072 PROTO=TCP SPT=3133 DPT=45495 WINDOW=2048 RES=0x00 ACK URGP=0

Ok, since there was no return traffic, I'm assuming that the destination
host doesn't know the firewall's in between the two PC's. In
68.16.185.130's arp table, does it have 68.16.185.132 mapped to your
firewall's eth1 interface? Is proxyARPing setup on both firewall
interfaces? This is leaving my knowledge realm, so if someone else can
help..



