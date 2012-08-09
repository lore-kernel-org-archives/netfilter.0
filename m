From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Filtering incoming 3G smartphone traffic using iptables?
Date: Thu, 9 Aug 2012 18:33:42 -0500
Message-ID: <20120809233342.GO3672@harrier.slackbuilds.org>
References: <CAM91gdBFqPw-Z5C9khGJ1JNjmQ2ZOtZh4XrEWK6yCmAiE2T2Jw@mail.gmail.com>
 <20120809194914.GN3672@harrier.slackbuilds.org>
 <CAM91gdBWbAcAo6480ZVA4YO+cj3ipeTNhBX7t4CwOpN8ROPq7Q@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAM91gdBWbAcAo6480ZVA4YO+cj3ipeTNhBX7t4CwOpN8ROPq7Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Thu, Aug 09, 2012 at 03:09:30PM -0500, Bryan K. Walton wrote:
> On Thu, Aug 9, 2012 at 2:49 PM, /dev/rob0 <rob0@gmx.co.uk> wrote:
> > On Thu, Aug 09, 2012 at 02:34:43PM -0500, Bryan K. Walton wrote:
> >> But how can I restrict port 22 access to this smart phone when
> >> using 3g service for its Internet?  Do I have any options?
> >
> > You can Google around and find port knocking solutions. That 
> > would be on topic here. But the real question, "how do I secure 
> > my ssh against attackers?" is less so.
> 
> Thanks for the reply.  I should have worded my question more
> precisely.  I'm not really looking for tips to lock down my ssh
> server.  I recognize that is off-topic.  What I'm really trying to
> figure out is if there is an IP tables module that makes use of
> something like the MEID.

I'm quite sure that the MEID does not transmit over IP. Neither do 
MAC addresses, outside their own physical segment. Every packet 
arriving from the Internet has the MAC address of your default 
gateway. MEID is not applicable in IP networking.

I did give you an on-topic reply concerning iptables -m recent, which 
was omitted from your quoting. I suggest that you go back and review 
that. You don't need to restrict your sshd that much. In fact I find 
it quite entertaining to review my statistics of deflected SSH 
attackers. :) 37 of them this week, at home.
-- 
  http://rob0.nodns4.us/ -- system administration and consulting
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
