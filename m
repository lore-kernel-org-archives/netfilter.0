From: "Jesper Lund" <jesper@ballbreaker.dk>
Subject: Re: Turning on IP Forwarding
Date: Mon, 24 Mar 2003 14:37:37 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2515.212.242.51.102.1048513057.squirrel@www.ramstedt.dk>
References: <20030324130221.39616.qmail@web40201.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030324130221.39616.qmail@web40201.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: james_marcinek@yahoo.com
Cc: netfilter@lists.netfilter.org

> I always foget this.
>
> Can anyone tell me which file I need to modify to turn
> on IP Forwarding? I know where to do it while the
> system is on; however, since it's a multi-homed system
> and my router, I would like to have it setup
> correctly...

echo 1 > /proc/sys/net/ipv4/ip_forward

Place that line in eg. /etc/rc.local

//Jesper



