From: "G. Georgiev" <ggeorgiev@videotron.ca>
Subject: PPTP multiple connections masquerading patch needed.
Date: Sat, 22 Mar 2003 20:29:16 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303222029.16524.ggeorgiev@videotron.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
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

        Hi,

        I need to start two PPTP connections from my gateway (using two login 
names for the remote end) and it does not want to work - both channels open, 
but they mix the packets they receive from the server and reject them:

Mar 22 18:12:00 gate pptp[140]: anon log[decaps_gre:pptp_gre.c:362]: 
discarding duplicate or old packet 26 (expecting 57)
rcvd [proto=0xf4f8] 4b da 5e 22 f0 53 b5 6a 52 3b 3f 20 c8 64 c2 a2 0a d2 62 
e4 65 1f a1 25 16 7a ec 53 4f 40 57 5f ...
Unsupported protocol 0xf4f8 received
sent [LCP ProtRej id=0x1a f4 f8 4b da 5e 22 f0 53 b5 6a 52 3b 3f 20 c8 64 c2 
a2 0a d2 62 e4 65 1f a1 25 16 7a ec 53 4f 40 ...]

        Given the fact that the server accepts both connections if there is a 
way for my gateway to distinguish between them things should work. And in 
VPN-Masquerade 'howto' it's written that there is an option 'PPTP Call ID 
masquerade' that may be helpfull for this. However, this is probably a kernel 
patch that I do not know where to find. I get some patches from 
http://cvs.netfilter.org/netfilter-extensions/helpers/pptp/, but they give too 
much compilation errors - probably a work in progress.

        So, may someone point me how to make two simultaneous PPTP connections 
work from my gateway to the same server, and if there is a patch where I may 
find it?

	Thanks, George.

