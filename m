From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Additional user for iptables
Date: Thu, 20 Jun 2002 20:26:51 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020621002651.GB2453@cannon.eng.us.uu.net>
References: <MBBBJHGKAGOKDNNIMPJHMEPKJGAA.davemiller@comcast.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <MBBBJHGKAGOKDNNIMPJHMEPKJGAA.davemiller@comcast.net>
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
Content-Transfer-Encoding: 7bit
To: Dave Miller <davemiller@comcast.net>
Cc: netfilter@lists.samba.org

On Thu, Jun 20, 2002 at 07:58:55PM -0400, Dave Miller wrote:

> Hello ?
> 
> Is there a way to allow an additional (non root) user to access the iptables
> tool without using sudo or similar?

There is always the setuid-bit solution but why do you want to do this? If
you trust the user to play with your netfilter part of the system you can
trust them for more, no? Or do you want to only trust an application? In
which case, sudo is still a better solution, IMO.

Ramin

> 
> Thank you.
> 
> 
> David S. Miller
> Strategic Services Group, Inc.
> 



