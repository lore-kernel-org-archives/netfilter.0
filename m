From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: iptables analyzer
Date: Tue, 28 Oct 2003 02:53:01 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031028105301.92009.qmail@web40206.mail.yahoo.com>
References: <16278.57173.146033.350478@teak.killian.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <16278.57173.146033.350478@teak.killian.com>
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
To: "Earl A.Killian" <netfilter@lists.killian.com>, netfilter@lists.netfilter.org


--- "Earl A.Killian" <netfilter@lists.killian.com> wrote:
> Has anyone built a iptables analyzer?  I am thinking writing one, but
> I don't want to reinvent what might already exist.
> 
> I have in mind something that tries all "interesting" (as gleaned from
> the rules themselves) combinations of IP addresses, protocols, ports,
> etc., simulates the ruleset and says what happens.  The result would
> be displayed in table form.
> 
> One could test the equivalence of two iptables specifications by
> analyzing them and comparing the output (useful for seeing if an
> "optmization" is correct).
> 
I too am interested in this... and thus set out to find some projects to do
this as I am a novice shell scripter and know zilch on programming...

This is what I have found although nothing really gets to the grit like I would
like...

Iam
http://intevation.de/iam/

IPAC-NG - IP accounting next generation
http://ipac-ng.sourceforge.net/

IAG - IP-Accounting Grapher
http://dev.lashout.net/iag/

BW ACCT v0.9.4
http://www.bwacct.org/

ADMLogger
http://aaron.marasco.com/linux.html

Firewall Log Daemon - firelogd
http://rouxdoo.freeshell.org/dmn/

Firewall Monitor (fwmon)
http://www.scaramanga.co.uk/fwmon/

fwlogwatch 0.9.3
http://www.kyb.uni-stuttgart.de/boris/software.shtml

PStat 
http://members.fortunecity.com/mrsi/

iptacct - Accounting for Linux 2.4
http://tretmine.org/iptacct/

SASacct
http://rousse.pm.org/sasacct/

Simple Little Firewall Monitor
http://slfm.sourceforge.net/

tvc4
http://fsi-server.physik.uni-erlangen.de/~sndapara/shaping/index_en.shtml

While i have not tried any of these projects... I don't think they are what I
am looking for. I don't really need graphics or things displayed in MySQL
databases.. I would simple like to be able to saya... hey how many packets have
I gottin in the last 5 or so mins...and see the difference from the 5 mins
before. Graphing this daily weekly monthy..etc would be nice...but hey I'm
willing to settle.

Good luck in your hunt. Hope this helps.

=====
In the absence of order there will be chaos.

__________________________________
Do you Yahoo!?
Exclusive Video Premiere - Britney Spears
http://launch.yahoo.com/promos/britneyspears/

