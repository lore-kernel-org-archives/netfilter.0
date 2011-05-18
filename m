From: Robert Nichols <rnicholsNOSPAM@comcast.net>
Subject: Re: iptables commands interfere with each other
Date: Wed, 18 May 2011 14:40:42 -0500
Message-ID: <ir17bq$3rp$1@dough.gmane.org>
References: <BANLkTikhC4FeiKz94trqSiFSNcPJG353Vw@mail.gmail.com> <BANLkTinknwdKqT=RP28ERv9Ybjr+mBfTKg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTinknwdKqT=RP28ERv9Ybjr+mBfTKg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 05/18/2011 11:48 AM, Steve Murphy wrote:
> Hello--
>
> I haven't done it on enough kernels and different OS's to be certain it
> is a general problem, or a version problem, or what, but....
>
> When I fire up fail2ban with a set of jails all using iptables to block,
> one of the jails will usually not get set up correctly, as if the commands
> to create chains, rules, etc, were ignored or lost.  If I introduce a
> sleep before
> each jail is created, such that no two jails will be created and set
> up at the same time,
> then all the problems go away.
>
> This is on CentOS 5.5/5.6.
>
> Am I alone and weird, or do others see this also? Is there known issues on this?

Expected behavior, really.  The mechanism for making changes to the
running ruleset is this:

1. Read the entire ruleset from the kernel.

2. Make the requested changes.

3. Load the entire new ruleset into the kernel.

The problem with multiple instances of this running simultaneously
is obvious.

-- 
Bob Nichols     "NOSPAM" is really part of my email address.
                 Do NOT delete it.

