From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Port 1900
Date: Mon, 25 Oct 2004 08:52:53 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <417D0535.4090300@pbl.ca>
References: <013101c4ba8f$38a7d7b0$49caa8c0@caris.priv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <013101c4ba8f$38a7d7b0$49caa8c0@caris.priv>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

Peter Marshall wrote:
> Oct 25 08:58:43 radium kernel: REJECT: frbk-rad IN=eth2 OUT=
> MAC=00:01:02:2f:78:4d:00:01:02:46:85:d6:08:00 SRC=192.168.100.101
> DST=192.168.100.1 LEN=160 TOS=0x00 PREC=0x00 TTL=1 ID=1464 PROTO=UDP
> SPT=29860 DPT=1900 LEN=140
> 
> I looked on the gys macine for a LONG time .. I can't see why this is
> happening.  I know 1900 is the msn port ..... Any ideas ?

1900 is Universal Plug-and-Play.  It's used by messanger, however 
messanger works just fine without it.  There's registry entry to disable it:

Hive: HKEY_LOCAL_MACHINE
Key: Software\Microsoft\DirectPlayNATHelp\DPNHUPnP
Name: UPnPMode
Type: REG_DWORD
Value: 2 disabled
With UPnPMode=2, Universal Plug and Play Network Address Translation 
(NAT) traversal discovery does not occur.

Apperently this is good idea to do.  It seems there's more holes in UPnP 
than in Swiss cheese.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

