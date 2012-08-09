From: "Bryan K. Walton" <bkw@70mpg.org>
Subject: Re: Filtering incoming 3G smartphone traffic using iptables?
Date: Thu, 9 Aug 2012 15:09:30 -0500
Message-ID: <CAM91gdBWbAcAo6480ZVA4YO+cj3ipeTNhBX7t4CwOpN8ROPq7Q@mail.gmail.com>
References: <CAM91gdBFqPw-Z5C9khGJ1JNjmQ2ZOtZh4XrEWK6yCmAiE2T2Jw@mail.gmail.com>
	<20120809194914.GN3672@harrier.slackbuilds.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120809194914.GN3672@harrier.slackbuilds.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Thu, Aug 9, 2012 at 2:49 PM, /dev/rob0 <rob0@gmx.co.uk> wrote:
> On Thu, Aug 09, 2012 at 02:34:43PM -0500, Bryan K. Walton wrote:
>
> MAC address filtering on wireless is not effective. All an attacker
> has to do is monitor the traffic a minute or less and choose a MAC
> address to spoof.

Thanks for that information.

> When using your 3g network, the packets will come in through your
> Internet connection, using the MAC address of your upstream router.
> Indeed, you probably do not want to enable SSH for that MAC.

Indeed.

>> But how can I restrict port 22 access to this smart phone when
>> using 3g service for its Internet?  Do I have any options?
>
> You can Google around and find port knocking solutions. That would be
> on topic here. But the real question, "how do I secure my ssh against
> attackers?" is less so.

Thanks for the reply.  I should have worded my question more
precisely.  I'm not really looking for tips to lock down my ssh
server.  I recognize that is off-topic.  What I'm really trying to
figure out is if there is an IP tables module that makes use of
something like the MEID.

Thanks,
Bryan
