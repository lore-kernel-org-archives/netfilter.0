From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Iproute2 and fwmark usage
Date: Fri, 9 Jan 2004 16:22:41 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040109212241.GF24304@cannon.eng.us.uu.net>
References: <001401c3d63b$e9ebdff0$1684188d@Kiste> <20040109164718.GB24304@cannon.eng.us.uu.net> <001d01c3d6cc$191fc210$1684188d@Kiste> <20040109173530.GC24304@cannon.eng.us.uu.net> <001601c3d6d0$b8198e10$1684188d@Kiste> <20040109194247.GD24304@cannon.eng.us.uu.net> <001101c3d6e3$cdf03e60$1684188d@Kiste> <20040109204745.GE24304@cannon.eng.us.uu.net> <004101c3d6ec$7801b6b0$1684188d@Kiste>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <004101c3d6ec$7801b6b0$1684188d@Kiste>
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
Content-Transfer-Encoding: 7bit
To: Thhoep <thhoep@gmx.de>
Cc: netfilter@lists.netfilter.org

On Fri, Jan 09, 2004 at 09:09:14PM +0100, Thhoep wrote:

> is there a logical reason (besides some bug in the code) why it should drop
> something?

I can't think of any logical reason. And to be honest, I don't think it is
due to a bug.

> i thought (but aint sure) that the "demasquerading" happens right
> in the prerouting, before the routing process, so that no routing rule in
> the world could disturb it?

You're right.

> i just did it. killed all other ppp connections, there was just eth4 (the
> local lan interface), ppp0 and a bunch of non-ip ethernet interfaces. but
> the result was the same, and no mis-guided packages in either direction.
> 
> i've really no clue what to do now.

Send the exact rules (netfilter/ip) from scratch for this minimal setup.
I'll try to have an exact setup here...

Ramin

> 
> i will try to reproduce the configuration on another server here.

