From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: quick cut-over iptables to firewalld
Date: Thu, 20 Jul 2017 23:11:14 -0500
Message-ID: <20170721041114.GA32555@harrier.slackbuilds.org>
References: <201707201934.v6KJYcj6029286@epjdn.zq3q.org>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201707201934.v6KJYcj6029286@epjdn.zq3q.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Thu, Jul 20, 2017 at 02:34:38PM -0500, iptables@trodman.com wrote:
> Whats are best practice steps to migrate a host that is currently 
> running a simple set of 6 or so iptables rules, to firewalld?

Since you are asking here, the Netfilter mailing list, I'll tell you 
my advice: don't do it!  I like nice and simple rules.  I don't like 
bloated frontends.  I bet on this list I am not alone in these 
preferences.

Furthermore this list isn't the place to support firewalld.  Perhaps 
Red Hat has a support list or forum for firewalld?
-- 
  http://rob0.nodns4.us/
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
