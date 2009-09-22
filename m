From: Alex Bligh <alex@alex.org.uk>
Subject: Re: netfilter + masquerade, mutliple i/fs sharing an IP
Date: Tue, 22 Sep 2009 23:59:00 +0100
Message-ID: <66A8455F5B45E9A9AFEF79D5@nimrod.local>
References: <C427FC06DA4331C494D72BCA@Ximines.local>
 <4AB9549C.5040508@plouf.fr.eu.org>
Reply-To: Alex Bligh <alex@alex.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AB9549C.5040508@plouf.fr.eu.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, netfilter@vger.kernel.org
Cc: Alex Bligh <alex@alex.org.uk>



--On 23 September 2009 00:50:04 +0200 Pascal Hambourg 
<pascal.mail@plouf.fr.eu.org> wrote:

> You might be interested in the CONNMARK target and the connmark match.
>
> 1) Mark packets received on each tunX interface with MARK.
> 2) Copy the packet mark into the connection mark with CONNMARK.
> 3) Copy the connection mark of packets received on eth0 into the packet
> mark with CONNMARK.
> 4) Route the packets according to their mark with ip rule & ip route.

Thanks - just what I was looking for.

-- 
Alex Bligh
