From: Jason Opperisano <opie@817west.com>
Subject: Re: where list of **reserved address**??? (IP addresses can *drop*)
Date: Wed, 27 Apr 2005 14:18:49 -0400
Message-ID: <20050427181849.GA23747@bender.817west.com>
References: <1114539542.3856.12.camel@seberino.spawar.navy.mil>
	<426FB150.2060708@riverviewtech.net>
	<Pine.LNX.4.60.0504271331080.9550@darkstar.sysinfo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.60.0504271331080.9550@darkstar.sysinfo.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Apr 27, 2005 at 01:33:52PM -0400, R. DuFresne wrote:
> The only real reason to have to have a bogon listing of rules in a 
> firewall are those firewalls that tend to be permissive.  Firewalls with 
> default deny policies should not have to deal with keeping an up-to-date 
> listing of the bogons, nor all the clutter and added overhead of rules to 
> disallow these addresses.

that's an odd view.  the most common reason i see for people wanting to
filter "bogons" is when you make services available to "any" in your DMZ
(web, mail, dns, etc), and you want to filter out bogus src IP's as they
are obviously spoofed and the sender is up to no good.  <rant>of course
none of this would be necessary if f**king ISP's would just perform some
f**king egress filtering, but i digress...</rant>.

as to the security benefit this provides--i'd guess it's pretty
negligible.  i've run firewalls that filter out the unassigned and
reserved address spaces, and they do not get a lot of hits.  if i was
going to spoof my src IP, i wouldn't use an unassigned or reserved block,
i'd probably use another entity i didn't like...

oh and PS--if you wanna do this--use a list (or write your own script)
that summarizes the netblocks down, so you have ~40 rules instead of 
100+.

-j

--
"Peter: Hey, Lois, the lost my job smells great. Hey, Meg, could
 you pass me the fired my ass for negligence? 
 Lois: Peter, are you OK?
 Peter: Great. I haven't got a job in the world."
        --Family Guy

