From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: how to write rule specification according to port availablity
Date: Fri, 22 Feb 2013 09:50:20 -0600
Message-ID: <20130222155020.GM3672@harrier.slackbuilds.org>
References: <CAJhv45gug+73Fr4w2s+snYzPn1bMK-BLbvJGpx1cJOQn6jhPfQ@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJhv45gug+73Fr4w2s+snYzPn1bMK-BLbvJGpx1cJOQn6jhPfQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Fri, Feb 22, 2013 at 04:19:12PM +0800, Donghua Liu wrote:
> Now I have such a scenario that I should write different nat rules
> according to the designated locally port is open or not.
> For example, if the port is listening then do the nat operation,
> otherwise do not use this rule.

There's nothing within Netfilter/iptables to do this.

> Any help would be greatly appreciated!

You could script something (sh, python, perl, whatever you like) to 
check the port state and enable or disable the rule as desired.
-- 
  http://rob0.nodns4.us/ -- system administration and consulting
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
