From: Steve <steve@sheddy.net>
Subject: Re: Broken fwmark
Date: Mon, 3 Jun 2002 00:49:33 +0100 (BST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.33.0206030037270.14482-100000@shaun.sheddy.net>
References: <200206022239.g52MdJA10657@Networker.rockstone.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206022239.g52MdJA10657@Networker.rockstone.co.uk>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.samba.org

Hi Antony,

> I'm no expert on packet marking, but why should a reply packet automatically
> pick up the mark of whatever it's a reply to ?   I mean, where would the mark
> get applied ?

I'm no expert either!

My working configuration was watermarking the packet as it came in via a
specific interface and then checking the watermark on the reply so the
packet took the same route out.

Surely then, the watermark is "set" (by whatever means) on the reply
packet otherwise the conditional routing would not work?

Steve.


