From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Filtering incoming 3G smartphone traffic using iptables?
Date: Thu, 9 Aug 2012 14:49:14 -0500
Message-ID: <20120809194914.GN3672@harrier.slackbuilds.org>
References: <CAM91gdBFqPw-Z5C9khGJ1JNjmQ2ZOtZh4XrEWK6yCmAiE2T2Jw@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAM91gdBFqPw-Z5C9khGJ1JNjmQ2ZOtZh4XrEWK6yCmAiE2T2Jw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Thu, Aug 09, 2012 at 02:34:43PM -0500, Bryan K. Walton wrote:
> On my home firewall, I'm been denying all incoming access to port 22.
> Then, I've been allowing port 22 access from a specified mac address.

MAC address filtering on wireless is not effective. All an attacker 
has to do is monitor the traffic a minute or less and choose a MAC 
address to spoof.

> Now I would like to also allow access from a certain Android
> smartphone.  The device has a mac address when it is using wi-fi.  But
> from what I can see, when the data traffic is 3g traffic, there
> doesn't seem to be a mac address.  Now, I've read that 3g traffic
> doesn't use a mac address, and that is fine.

When using your 3g network, the packets will come in through your 
Internet connection, using the MAC address of your upstream router. 
Indeed, you probably do not want to enable SSH for that MAC.

> But how can I restrict port 22 access to this smart phone when 
> using 3g service for its Internet?  Do I have any options?

You can Google around and find port knocking solutions. That would be 
on topic here. But the real question, "how do I secure my ssh against 
attackers?" is less so.

Well, there is -m recent, which does a fine job for me. I leave port 
22 open to the world, with limits.

http://rlworkman.net/conf/firewall/sshattacks <-- the basics

Other alternatives you might consider, and these ARE off topic:
- disable root login
- require public key authentication (disable password auth)
- use an alternate port

The latter is "security through obscurity", but it does prevent the 
attack bots from finding you. They seem to be scanning port 22 only.
-- 
  http://rob0.nodns4.us/ -- system administration and consulting
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
