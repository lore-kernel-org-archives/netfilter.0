From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: ipchains compat/active ftp?
Date: 13 Jun 2002 19:14:55 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1023988495.19818.374.camel@tux>
References: <Pine.LNX.4.33.0205220926150.32435-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
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
To: bhartin@straus-frank.com
Cc: Netfilter <netfilter@lists.samba.org>

On Wed, 2002-05-22 at 16:28, bhartin@straus-frank.com wrote:
> 
> I'm using a 2.4.x series kernel, but due to time constraints lately, I'm
> using the ipchains compatability module and our old ipchains scripts.
> Unfortunately, I have yet to find how to get active ftp connections
> working through this.  The ftp module appears to be for pure iptables use
> only, and there are no individual modules to be seen for the ipchains
> compatability.
> 
> What am I missing?  Is there something that's just not very well
> documented on this, or am I basically screwed until I re-write everything
> for iptables?

That's correct, you are screwed until you rewrite the rules to use
iptables.

-- 
/Martin

Never argue with an idiot. They drag you down to their level, then beat
you with experience.

