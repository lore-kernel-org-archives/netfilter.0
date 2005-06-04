From: Jason Opperisano <opie@817west.com>
Subject: Re: Fedora 3, missing ip_conntrack_ftp & ip_nat_ftp
Date: Sat, 4 Jun 2005 17:17:15 -0400
Message-ID: <20050604211715.GA20974@bender.817west.com>
References: <1117901467.2143.15.camel@grendel>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1117901467.2143.15.camel@grendel>
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
To: netfilter <netfilter@lists.netfilter.org>

On Sat, Jun 04, 2005 at 12:11:07PM -0400, Chris Brenton wrote:
> Greets all,
> 
> I have a pretty basic Fedora 3 install with all patches installed via
> Yum. I'm using the box as a network firewall and need support for
> outbound PASV FTP. I tried to modprobe the modules ip_conntrack_ftp and
> ip_nat_ftp, but I get an error saying the files do not exist. A quick ls
> of /sys/modules confirms this. 

/sys/modules?  huh?  try:

ls /lib/modules/`uname -r`/kernel/net/ipv4/netfilter/*_ftp*

> Any idea what I'm missing? I know I could pull down source and install
> that way, but I would prefer to do it via RPM's & Yum so I can easily
> keep the box up to date. 

i don't have an FC3 box in my stable anymore, but i'm pretty
sure i would've noticed this when i did have one.  unless they've
broken something with a recent kernel update (last one i saw was
kernel-2.6.11-1.27_FC3), which is not entirely beyond the realm of
possibility, i suppose...  i assume they would've noticed that by now,
as that update was released on 5/23.

-j

--
"Dennis Miller: I don't want to go on a rant, here, but America's
 foreign policy makes about as much sense as Beowulf having sex
 with Robert Fulton at the first battle of Antietam. I mean when
 a neo-conservative defenestrates it's like Raskolnikov filibuster
 deoxymonohydroxinate...
 Peter: What the hell does rant mean?"
        --Family Guy

