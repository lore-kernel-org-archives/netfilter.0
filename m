From: "Daniel Guthrie" <daniel.guthrie@ldbsinc.com>
Subject: Logging connections into IPTables
Date: Mon, 7 Nov 2005 12:23:48 -0500
Message-ID: <200511071227531.SM02796@EZ0887>
References: <20051105202050.GA24788@awa.mat.agh.edu.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051105202050.GA24788@awa.mat.agh.edu.pl>
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

 
I may be asking in the wrong area, but hopefully someone can point me in the
right direction.
 
Does anyone have an idea as to anything I could use to put the IPTable
connection attempts into a SQL table of some nature for another developer to
build off of. I'm only somewhat experienced with linux and very
inexperienced with IPTables, so I'm beating my head against the same walls.
 
Essentially, what we're doing is this -- using a *nix box to as a
provisioning server that updates firmware and configuration on customer's
VoIP ATAs via TFTP (port 69). The only catch is that we need to know which
customers have been updated. This can be done by comparing MAC addresses (of
the box logging in), but first I need to get the data into a table of some
nature or even just a regular file. I've looked at the log and seeing as how
it logs each packet, it's far too large to be of any use to me.
 
Any ideas? Just point me in a direction perhaps? Maybe an add-in of some
nature? I'd prefer to NOT do this with windows... Just because I'm not sure
if a Win box could handle everything properly.
 
Thanks for your time,
 
Daniel



