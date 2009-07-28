From: "/dev/rob0" <rob0@gmx.co.uk>
Subject: Re: Firewall Configuration Help
Date: Tue, 28 Jul 2009 17:08:17 -0500
Message-ID: <200907281708.17332.rob0@gmx.co.uk>
References: <4399fd970907271056m24713eecj5d6f20aed572cc36@mail.gmail.com> <47ae5fdc6d1c4a93d1035f61774996ec@localhost> <a43edf1b0907280619y24f759eble72105e67a70e5ac@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <a43edf1b0907280619y24f759eble72105e67a70e5ac@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Tuesday 28 July 2009 08:19:19 Billy Crook wrote:
[snip lots of good advice]
> And here's my config, which is longer than I'd like, but as short as
> it can be and still do the job.  You might change :FORWARD ACCEPT to
> :FORWARD REJECT if you don't ever plan to act as a router.

1. Allow me to introduce my friend, the multiport match, which will
   indeed shorten your rules and still do the job. :)
2. REJECT is not a valid policy, see DROP.
-- 
    Offlist mail to this address is discarded unless
    "/dev/rob0" or "not-spam" is in Subject: header
