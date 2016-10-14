From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: iptables-translate command not found
Date: Fri, 14 Oct 2016 13:18:08 -0500
Message-ID: <20161014181808.GF6526@harrier.slackbuilds.org>
References: <CAOCi2DEkJ3JOJdYUK4_jX3cfdP7Rwje7zioqLBaj5Um3HoiT8Q@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOCi2DEkJ3JOJdYUK4_jX3cfdP7Rwje7zioqLBaj5Um3HoiT8Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Fri, Oct 14, 2016 at 09:14:02PM +0530, Gargi Sharma wrote:
> I am looking to translate iptable rules to nftables and when I run 
> the command sudo iptables-translate I get , command not found.
> 
> The path for iptables command is /sbin/iptables.
> 
> The other commands related to iptables that are available are:
> iptables-save
> iptables-restore
> ip6tables
> 
> How do I install iptables-translate?

Either:
   1. Install from source obtained from netfilter.org, or:
   2. Ask questions about your distro at a place which supports
      your distro.

> From what I have understood from looking around is that 
> iptables-translate comes with the iptables package.

-- 
  http://rob0.nodns4.us/
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
