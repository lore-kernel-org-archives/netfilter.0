From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: Command not working  in latest version
Date: 18 Feb 2003 00:51:46 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045525905.682.128.camel@tux.rsn.bth.se>
References: <01CEA3A5B8B2D511890F0002A5870AEC5FB5E9@EXCHANGE>
	 <002901c2d616$c41d6300$0100a8c0@nikita>
	 <1045467010.681.100.camel@tux.rsn.bth.se>
	 <200302172337.21158.pocm@mega.ist.utl.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200302172337.21158.pocm@mega.ist.utl.pt>
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
To: "Paulo Jorge O. C. Matos" <pocm@mega.ist.utl.pt>
Cc: Khanh Tran <khanh@slc.edu>, Netfilter <netfilter@lists.netfilter.org>

On Tue, 2003-02-18 at 00:37, Paulo Jorge O. C. Matos wrote:
> Hi Martin,
> 
> I've lost your mail before reading it... Now I got it... I'll try to 
> recompile the kernel with userspace iptables, thx.

No no, you shouldn't recompile your kernel at all.
The only thing you should recompile is the userspace iptables.

KERNEL_DIR=/usr/src/linux-2.4.20 make install

something like that.

-- 
/Martin

Never argue with an idiot. They drag you down to their level, then beat you with experience.

