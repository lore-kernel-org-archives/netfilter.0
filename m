From: "Joe Patterson" <jpatterson@asgardgroup.com>
Subject: RE: detection of the third tcp packet in a tcp connection setup
Date: Thu, 27 Jun 2002 15:10:39 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <NJEFLNJDIFFNMHDEBKMJCEJADOAA.jpatterson@asgardgroup.com>
References: <20020627182753.GS31466@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020627182753.GS31466@cannon.eng.us.uu.net>
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

catching the third packet is easy.  The hard part is to both catch the third
packet and *not* catch all of the rest of the ack packets.

There are some distinguishing characteristics... it is the first packet sent
by the client that is in state ESTABLISHED.  it should have ACK set and no
other flags.  the tcp data length should be zero.

Probably Patrick's idea of the CONNMARK patch is best.  Mark the connection
when you see a syn-ack in state established.  Then when you see an ack
packet that is marked, you unmark the connection and do with it what you
wish.  Actually, unmark is probably the wrong term.  As I understand it, all
packets have a mark, it's just 0x0 unless it's been specifically set.  So,
mark it as some arbitrary value when you see the syn-ack established, and
then mark it as 0 when you see established with the arbitrary mark value.
That should work.  Probably the best solution you're likely to get.

-Joe

> -----Original Message-----
> From: netfilter-admin@lists.samba.org
> [mailto:netfilter-admin@lists.samba.org]On Behalf Of Ramin Alidousti
> Sent: Thursday, June 27, 2002 2:28 PM
> To: netfilter@lists.samba.org
> Subject: detection of the third tcp packet in a tcp connection setup
>
>
> Hi,
>
> Does anyone have a good solution to catch the third (ACK) packet
> in a tcp connection setup?
>
> Ramin
>
>
>


