From: Skull <skull@skullkrusher.net>
Subject: Re: tftp conntrack
Date: Mon, 10 Jun 2002 17:36:57 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D04C799.20102@skullkrusher.net>
References: <E131E9F1848D0148813EAF06A846608F615DA7@w2ks-e2k.iconos.be> <3D04B8B5.8040608@skullkrusher.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter <netfilter@lists.samba.org>

Skull wrote:
> 
> Yes... To avoid any kind of misunderstanding during the configuration, 
> this is what I did:
> - I downloaded a 2.4.18-vanilla tarball
> - I've checked out thru CVS the entire netfilter/userspace repository 
> directory
> - I launched the make patch-o-matic

Oh, I made a mistake: tftp conntrack helper doesn't install because of
the lack of the newnat patch, which refuses to install by itself because:

Testing patch pending/0-newnat13.patch...
Failed to patch copy of /usr/src/linux
TEST FAILED: patch NOT applied.

hmmm not so exxaustive, huh?

Need to study why it fails.. :-P

Just a question: when launching patch-o-matic how could I choose what to 
install?
Only reading what the it says about the single packets or is it present 
somewhere
a list of dependencies for patch installation?

thx


-- 
Emanuele "SKULL" Balla
----------------------------------------------------------------------
"How should I know if it works?  That's what beta testers are for. I
only coded it." (Attributed to Linus Torvalds, somewhere in a posting)


