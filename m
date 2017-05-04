From: Robert White <rwhite@pobox.com>
Subject: Re: ulogd start script
Date: Thu, 4 May 2017 20:12:01 +0000
Message-ID: <d0626d6c-95cd-7ef9-07b6-46bc3a857b68@pobox.com>
References: <CAOr=3U_-b4Az0MpU3RTt3_R6MMhCFbNUDTZMFQg0kVQxaBSdxA@mail.gmail.com>
 <CAOr=3U_v0wKgJN7ABFyO3cUonPDvavSqDj4Ea6xc7Zchpb+4-w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAOr=3U_v0wKgJN7ABFyO3cUonPDvavSqDj4Ea6xc7Zchpb+4-w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Darshan Ghumare <darshan.ghumare@gmail.com>, netfilter@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>

On 05/04/17 08:35, Darshan Ghumare wrote:
> When I ran `#service ulogd start` this failed because `nfnlh->fd =
> socket(AF_NETLINK, SOCK_RAW, NETLINK_NETFILTER);` from libnfnetlink
> failed with -EACCES. But `#ulogd -d` succeeded.

YMMV but that's _usually_ caused by the service startup script trying to
use nobody/nogroup or some other safe UID/GID to start deamons.

I personally use Gentoo, which doesn't use the "service" command and I
think you are using RedHat or a derrative, but...

It's common to not want to run deamons with full root priviliges. Some
things, such as Apache, will start as full root to grab a few priviliged
resources and then change their effective/ongoing user ID to something
much more restricted. But _lots_ (indeed most?) demons don't do this, so
lots of the systems out there have an explicit override in the service
launcher to "always" run deamons as a specific or less priviliged user ID.

So you'll need to consult your system documentation to determine how to
control that feature as needed.

Alternatively there is a way to assign various capabilities to specific
programs. I've never bothered to learn the full ins-and-outs of the
whole setcap command, but you should be able to find and set the needed
capability on the ulogd executable so that it can have the permission(s)
needed to open the netlink socket regardless of the user ID used to
invoke it.

oh, so many caveats apply...

