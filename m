From: "Mohd. Jeffry" <linuxlah@gmail.com>
Subject: Re: what protocols need UDP instead of just TCP?? DNS, IMAP, SSH,
	etc.?
Date: Sat, 29 Jan 2005 00:45:58 +0700
Message-ID: <a0d88f500501280945123146d7@mail.gmail.com>
References: <20050126000550.GB15359@spawar.navy.mil>
	<20050126184721.GA7134@bender.817west.com>
Reply-To: "Mohd. Jeffry" <linuxlah@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050126184721.GA7134@bender.817west.com>
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

DNS, NTP, NFS


On Wed, 26 Jan 2005 13:47:21 -0500, Jason Opperisano <opie@817west.com> wrote:
> On Tue, Jan 25, 2005 at 04:05:50PM -0800, seberino@spawar.navy.mil wrote:
> > I'm only allowing TCP out of my firewall.
> >
> > What apps/protocls need UDP?
> >
> > DNS, IMAP, SSH, etc.?
> 
> DNS--yes.  IMAP and SSH--no.
> 
> > I dunno if I need to allow UDP for anything.
> 
> other common UDP ports i allow out:
> 
> Port    Service
> ---------------
> 123     NTP
> 500     IKE
> 
> -j
> 
> --
> "I never passed Remedial Science 1A.
>  And you're a nuclear technician?"
>         --The Simpsons
> 
>

