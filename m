From: Scott MacKay <scottmackay@yahoo.com>
Subject: Re: Turning on IP Forwarding
Date: Mon, 24 Mar 2003 06:51:03 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030324145103.16421.qmail@web13904.mail.yahoo.com>
References: <2515.212.242.51.102.1048513057.squirrel@www.ramstedt.dk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2515.212.242.51.102.1048513057.squirrel@www.ramstedt.dk>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Or update /etc/sysctl.conf with the line:

net.ipv4.ip_forward = 1

-Scott

--- Jesper Lund <jesper@ballbreaker.dk> wrote:
> > I always foget this.
> >
> > Can anyone tell me which file I need to modify to
> turn
> > on IP Forwarding? I know where to do it while the
> > system is on; however, since it's a multi-homed
> system
> > and my router, I would like to have it setup
> > correctly...
> 
> echo 1 > /proc/sys/net/ipv4/ip_forward
> 
> Place that line in eg. /etc/rc.local
> 
> //Jesper
> 
> 
> 


__________________________________________________
Do you Yahoo!?
Yahoo! Platinum - Watch CBS' NCAA March Madness, live on your desktop!
http://platinum.yahoo.com

