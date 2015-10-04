From: Aleksander Morgado <aleksander@aleksander.es>
Subject: Re: Problems receiving UDP multicast traffic on bridge interface
Date: Sun, 4 Oct 2015 18:44:30 +0200
Message-ID: <CAAP7ucLegPkymY61+Kez9ADnJ6z37sSbO5SsefGYrZFPAvzJuQ@mail.gmail.com>
References: <CAAP7uc+7f3ZU7ROvWvYDvLQp_GgzGiumx+KeFNPY1VxxK-g2jw@mail.gmail.com>
	<CAEzD07L_ik1je3bCE_drJX2_-Zjf0pq68gzbLbMCy_eKbxftGg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAEzD07L_ik1je3bCE_drJX2_-Zjf0pq68gzbLbMCy_eKbxftGg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anton Danilov <littlesmilingcloud@gmail.com>
Cc: netfilter@vger.kernel.org

On Sun, Oct 4, 2015 at 6:28 PM, Anton Danilov
<littlesmilingcloud@gmail.com> wrote:
> Seems like you have igmp-snooping issue. Run tcpdump and check the
> igmp-traffic: you should see igmp-join at your daemon start and
> periodical igmp-queries and replied igmp-reports. Allow input
> igmp-packets in your ruleset.

Oh, that actually worked, thanks!

-- 
Aleksander
https://aleksander.es
