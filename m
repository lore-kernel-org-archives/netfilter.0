From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: ToS and Windows
Date: Sun, 25 Jul 2004 10:09:48 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <SERVER7pGR881Np7vXe000000ae@server7.bandwidthco.com>
References: <1090735278.4548.10.camel@rivendell.home.local>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1090735278.4548.10.camel@rivendell.home.local>
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

 

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Florin Andrei
Sent: Saturday, July 24, 2004 11:01 PM
To: netfilter@lists.netfilter.org
Subject: ToS and Windows

Slightly offtopic.

I'm using "-j TOS --set-tos" with apparently good results. I manage to
control the ToS on the packets sent by a Linux box to a couple Windows
boxes.
The problem is that the packets sent back by the Windows machines do not
have ToS set. How do i set ToS on Windows?
One of the Win systems is Win2K, the other is WinXP.


You should be able to set TOS on the packets from the Windows boxes as they
enter the firewall interface. However, if you do not (or cannot) wish to do
this, there is a very nifty little Windows utility called "cablenut" which
will allow you to set the TOS (or any other tcp/ip packet value) before the
packet leaves the Windows machine. The utility is freeware. Run a google
search on cablenut to find it. Should come up on first page.



