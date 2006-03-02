From: "Niels Somers" <somers.niels@gmail.com>
Subject: libipt_recent
Date: Thu, 2 Mar 2006 14:18:43 +0100
Message-ID: <2ad714090603020518x42cecf23l@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello all,

I have a very basic knownledge of linux. So keep that in mind plz :)
I ran into a problem when I was searching for a solution for the ssh
brute-force attacks.
Found one that was simple to add,  some rules in the iptables.
When I add those rules I get an error that the file libipt_recent.so is mis=
sing.
And indeed, when I check the lib-files it isn't there.
So I downloaded a newer version of iptables. 1.3.0 (its a red hat 7.3,
kernel 2.4.18-3).
When I do a "make" I see alot of files getting compiled in the
extensions folder.
But when I look for libipt_recent I can only find the .c file, and not
the .so file :(
How can force it to be compiled also ?
Searching with google didn't gave me much answers, just to recompile
the kernel and iptables.
How do you recompile the kernel ?  Or that isn't nessecary ?

Greetings,

Niels

