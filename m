From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Modem to Ethernet Bridge
Date: Thu, 5 Sep 2002 15:42:17 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209051442.g85EgNv00719@vulcan.rissington.net>
References: <F37GuSKqGABtvNLepTy000017d8@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F37GuSKqGABtvNLepTy000017d8@hotmail.com>
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

On Thursday 05 September 2002 3:29 pm, Scott Ainslie wrote:

> I have a box with a network card(LAN) ip 192.168.0.25 subnet 192.168.0.0/24
> and has a modem for dial-in access which allocates 192.168.1.1 on this side
> and 192.168.1.2 to the client.
>
> I am able to ping the LAN from the client and vice-versa and am able to
> http browse etc but I am not able to ftp, windows network browse etc.
>
> Does anyone have any pointers on where to start? I simply want the dial-in
> client to be treated as safe and to have full access to the LAN.

SNAT the packets from 192.168.1.2 behind the 192.168.0.25 address.   Then 
other machines will be able to reply to your dial-in user (provided they can 
already reply to your box with the two interface as described above).

Something like:

iptables -A POSTROUTING -t nat -s 192.168.1.2 -j SNAT --to 192.168.0.25

should do the trick.

Antony.

-- 

If you want to be happy for an hour, get drunk.
If you want to be happy for a year, get married.
If you want to be happy for a lifetime, get a garden.

