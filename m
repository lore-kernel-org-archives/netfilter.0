From: Skull <skull@skullkrusher.net>
Subject: Re: tftp conntrack
Date: Mon, 10 Jun 2002 16:33:25 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D04B8B5.8040608@skullkrusher.net>
References: <E131E9F1848D0148813EAF06A846608F615DA7@w2ks-e2k.iconos.be>
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
To: Sneppe Filip <Filip.Sneppe@cronos.be>, netfilter@lists.samba.org

Sneppe Filip wrote:

 > the tftp conntracker, like all conntrackers nowadays requires that
 > the kernel is patched for newnat support.
 >
 > Did you apply the necessary patch(es) for newnat before applying the
 > tftp connectrack helper ?

Yes... To avoid any kind of misunderstanding during the configuration, 
this is what I did:
- I downloaded a 2.4.18-vanilla tarball
- I've checked out thru CVS the entire netfilter/userspace repository 
directory
- I launched the make patch-o-matic

It obviously made a lot of questions for each patch to install, and it 
didn't find anything wrong during the whole process.
The only problem happens when it tries to install the tftp-conntrack 
helper (that was what I really needed from all this thing... damn...): 
it comes out with:

Testing patch extra/tftp-conntrack-nat.patch...
    Placed new Config.in line
    Placed new Config.in line
    Placed new Configure.help entry
    Placed new Makefile line
Could not find place to slot in Makefile line
TEST FAILED: patch NOT applied.

[Press enter to continue]

And this is not such a verbose comment if I need to understand where the 
problem is :-)

Thanx 4 all...



-- 
Emanuele "SKULL" Balla
----------------------------------------------------------------------
"How should I know if it works?  That's what beta testers are for. I
only coded it." (Attributed to Linus Torvalds, somewhere in a posting)


