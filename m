From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Allowing limited broadcasts between LAN <-> DMZ?
Date: Tue, 25 Jun 2002 12:42:32 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206251142.MAA19842@slate.rockstone.co.uk>
References: <Pine.LNX.4.33.0206251044140.4927-100000@blackhole.kfki.hu> <3D18379C.B101AA83@aon.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3D18379C.B101AA83@aon.at>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Tuesday 25 June 2002 10:27 am, Chris wrote:

> Hello,
>
>
> i am wondering if it would be a security risk to generally allow ALL
> limited broadcasts (255.255.255.255)?!
>
> We have a heterogenous network with Linux (Firewalls, Mail/Proxy/Time/
> etc-server), WinNT/W2k Clients & Servers and one AS/400 as server.
> Now there is our internal firewall between the LANs and the DMZ.
> At the moment i am blocking limited broadcasts, which breaks the
> functionality of some windows stuff (SQL-Server, NetBIOS, SMB, ...).

Broadcasts will not cross a router, from one network to another, so even if 
you did not actively block them with netfilter, they still wouldn't pass from 
your LAN to your DMZ.

 

Antony.

