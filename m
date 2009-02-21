From: Sebastian Roemer <tengaman@wolke7.net>
Subject: What does the redirect target in detail?
Date: Sat, 21 Feb 2009 01:27:18 +0100
Message-ID: <20090221002718.GA3922@localhost>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I'm desperately looking for an explanation on the redirect target.
In what way does it influence the traversing order of packages through 
the tables/chains or is it out of reach for netfilter as soon as it hits REDIRECT?
If not, how does the packages look like in the following tables/chains,
is the source and destination address modified?
Or is it handeled internally like the MARKs, meaning that a redirected
package reaches its modified destination unspoiled?



Thanks for your help

Sebastian R.
