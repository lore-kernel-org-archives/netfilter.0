From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Being selective about traffic and interfaces
Date: Mon, 8 Mar 2004 21:07:29 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403082107.29626.rob0@gmx.co.uk>
References: <20040308150758.GB16848@virgin.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040308150758.GB16848@virgin.net>
Content-Disposition: inline
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

On Monday 08 March 2004 09:07, Richard Bellamy wrote:
> I have just set up an ecrypted connection (with OpenVPN) between my
> laptop and router currently all traffic goes down the vpn. I would
> like to allow ssh traffic to bypass the vpn.

FWIW, if what you're seeking is a performance improvement, you would 
probably do better by changing your sshd/ssh client to use something 
faster than the default 3DES encryption. Blowfish (which of course is 
openvpn's default) is a good choice: fast and not known to be weak.

> I would be very grateful for any assistance.

I am pretty sure that what you want can be done with MARK in the mangle 
table and complex routing (iproute2). Unfortunately that's all a bit 
beyond me. I hope the blowfish suggestion is helpful.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

