From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Multihomed Problem
Date: Wed, 12 Dec 2007 18:21:18 -0600
Message-ID: <47607AFE.4030408@riverviewtech.net>
References: <475EFFF8.1010606@nwcascades.com>	 <475F095A.7040003@riverviewtech.net> <1197412206.19486.115.camel@grateful.d.umn.edu> <475F1562.7060207@riverviewtech.net> <47603204.8060200@nwcascades.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47603204.8060200@nwcascades.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 12/12/2007 1:09 PM, Jack Lauman wrote:
> IP forwarding is turned on.  I've tried several different routing 
> statements but none seemed to work.

Ok, we are going to need some more information.

> What's the correct procedure to do this?

Will you please clarify what your network setup is?  I'm presuming the 
following:

(Middle) Linux is the common default gateway:

+------------+   +-----------------+   +-------------+
| Xerox 1.30 +---+ 1.1 Linux 100.1 +---+ 100.2 Linux |
+------------+   +-----------------+   +-------------+

Is the middle Linux system the default gateway / router for both the 
Xerox and other Linux systems?  Or do the Xerox and (other) Linux system 
use a different default gateway / router other than the middle Linux 
system?  I.e. either of the below images?


(Middle) Linux is not the common default gateway:

                      +-----------------+
                  +---+ Default Gateway +---+
                  |   +-----------------+   |
                  |                         |
+------------+   |   +-----------------+   |   +-------------+
| Xerox 1.30 +---+---+ 1.1 Linux 100.1 +---+---+ 100.2 Linux |
+------------+       +-----------------+       +-------------+

Different default gateways:

                      +-----------------+
                  +---+ Default Gateway |
                  |   +-----------------+
                  |
+------------+   |   +-----------------+       +-------------+
| Xerox 1.30 +---+---+ 1.1 Linux 100.1 +---+---+ 100.2 Linux |
+------------+       +-----------------+   |   +-------------+
                                            |
                      +-----------------+   |
                      | Default Gateway +---+
                      +-----------------+

What networking scenario are we looking at:
  - (Middle) Linux is the common default gateway
  - (Middle) Linux is not the common default gateway
  - Different default gateways
  - Or a third scenario where the (Middle) Linux is the default gateway 
for one network but not the other?

We need to know what type of network topology we are working with so 
that we can better help you.

Also, are you running any type of firewalling?  If so, where is it and 
can we get a configuration so that we know what we are working with?



Grant. . . .
