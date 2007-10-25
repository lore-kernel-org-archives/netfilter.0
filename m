From: Michael Rash <mbr@cipherdyne.org>
Subject: psad-2.1 release + book announcement
Date: Thu, 25 Oct 2007 00:27:00 -0400
Message-ID: <20071025042700.GC16759@minastirith>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi -

psad-2.1 has been released:

http://www.cipherdyne.org/psad/download/

This release finishes off the 2.0.x development series with a few bug
fixes and feature enhancements.  For example, one bug was fixed in how psad
handles the options portion of the TCP header; it was previously possible
to force psad into an infinite loop with a specially crafted set of options
(logged by iptables with the --log-tcp-options command line argument when
building a LOG rule).

Here is the complete ChangeLog:

http://trac.cipherdyne.org/trac/psad/browser/psad/tags/psad-2.1/ChangeLog

Also, I have finished writing the book "Linux Firewalls: Attack Detection
and Response" for No Starch Press.  It is available for a decent discount
off the Amazon.com price if you go through the No Starch site:

http://www.nostarch.com/frameset.php?startat=firewalls_mr

This book is as much about intrusion detection as it is about iptables,
and treats the two subjects in a unified fashion.  There are lot of
books out there about intrusion detection, and lots more about firewalls,
but none that I'm aware of that really concentrate on the combination of
the two technologies.  In this respect, it is my hope that this book is
unique.

There is also an online site for the book here:

http://www.cipherdyne.org/LinuxFirewalls/

For example, visualizations of iptables Honeynet log data can be viewed
(along with the parsed data sets produced by psad) here:

http://www.cipherdyne.org/LinuxFirewalls/ch14/

Thanks,

--
Michael Rash
http://www.cipherdyne.org/
Key fingerprint = 53EA 13EA 472E 3771 894F  AC69 95D8 5D6B A742 839F
